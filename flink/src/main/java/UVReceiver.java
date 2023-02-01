import com.js.api.model.UmsLog;
import com.js.common.GsonUtil;
import org.apache.flink.api.common.functions.RichMapFunction;
import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.api.common.state.MapState;
import org.apache.flink.api.common.state.MapStateDescriptor;
import org.apache.flink.api.common.state.ValueState;
import org.apache.flink.api.common.state.ValueStateDescriptor;
import org.apache.flink.api.common.typeinfo.TypeHint;
import org.apache.flink.api.common.typeinfo.TypeInformation;
import org.apache.flink.api.java.tuple.Tuple2;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.CheckpointingMode;
import org.apache.flink.streaming.api.environment.CheckpointConfig;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumerBase;
import org.apache.flink.streaming.connectors.redis.RedisSink;
import org.apache.flink.streaming.connectors.redis.common.config.FlinkJedisPoolConfig;
import org.apache.flink.streaming.connectors.redis.common.mapper.RedisCommand;
import org.apache.flink.streaming.connectors.redis.common.mapper.RedisCommandDescription;
import org.apache.flink.streaming.connectors.redis.common.mapper.RedisMapper;
import org.apache.kafka.clients.consumer.ConsumerConfig;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

/**
 * @author js
 * @date 2022/1/7 18:05
 */
public class UVReceiver {
    public static void main(String[] args) throws Exception {
        String topic="malluv";
        String host="192.168.87.129";
        int port=9092;
        int database_id=0;

        StreamExecutionEnvironment env=StreamExecutionEnvironment.getExecutionEnvironment();
        //检查点间隔设立为1ms
        env.enableCheckpointing(TimeUnit.MINUTES.toMillis(1));
        env.setParallelism(5);

        CheckpointConfig checkConfig=env.getCheckpointConfig();
        //不允许有数据丢失或者重复，否则直接启动检查点
        checkConfig.setCheckpointingMode(CheckpointingMode.EXACTLY_ONCE);
        //一旦Flink处理程序被cancel后，会保留Checkpoint数据，以便恢复
        checkConfig.enableExternalizedCheckpoints(CheckpointConfig.ExternalizedCheckpointCleanup.RETAIN_ON_CANCELLATION);

        Properties props=new Properties();
        props.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG,host+":"+port);
        props.put(ConsumerConfig.GROUP_ID_CONFIG,"app-uv-stat");//组之间是相互独立的

        FlinkKafkaConsumerBase<String> kafkaConsumer=new FlinkKafkaConsumer<String>(
                topic,  new SimpleStringSchema(),props);//从头topic中指定的group上次消费的位置开始消费。

        //配置Redis配置，因为flink分析结果要送到redis中
        FlinkJedisPoolConfig config=new FlinkJedisPoolConfig.
                Builder().
                setDatabase(database_id).setHost(host).build();

        //定义flink数据来源
        //.map(string -> GsonUtil.fromJson(string, UserVisitWebEvent.class))  // 反序列化 JSON
        //"20783","2021-01-06","2021-01-06","37","192.168.1.199","查询订单","{'pageNum':['1']&&'pageSize':['10']}","GET","/order/list","80","17"
        env.addSource(kafkaConsumer).map(string->{
            System.out.println("【"+string+"】");
            StringBuilder sb=new StringBuilder(1000);//处理字符串连接问题，节约空间
            UmsLog u=null;
            try{
                List<String> list= Arrays.asList(string.split(","));
                sb.append("{");

                Field[] fs= UmsLog.class.getDeclaredFields();
                /*
                 {
                    id:"54",
                    createBy:"System"
                 }

                 */
                for(int i=0;i<list.size();i++){
                    sb.append(fs[i].getName()+":"+list.get(i)+",");
                }
                sb.deleteCharAt(sb.lastIndexOf(","));
                sb.append("}");
                u= GsonUtil.fromJson(sb.toString(),UmsLog.class);


            }catch(Exception e){
                e.printStackTrace();
            }
            return u;
        }).keyBy("updateTime","logType")//按照日期和页面进行keyBy
        .map(new RichMapFunction<UmsLog, Tuple2<String,Long>>() {
            //存储当前key对应的userId集合
            private MapState<String,Boolean> userIdState;
            //存储当前key对应的UV值
            private ValueState<Long> uvState;

            @Override//open方法处理作用：一旦flink处理数据中断了，可以从状态中恢复
            public void open(Configuration parameters) throws Exception {
                super.open(parameters);

                userIdState=getRuntimeContext().getMapState(
                        new MapStateDescriptor<String, Boolean>("userIdState", TypeInformation.of(new TypeHint<String>(){}),
                                TypeInformation.of(new TypeHint<Boolean>(){}))
                );
                //从状态中恢复uvState
                uvState=getRuntimeContext().getState(
                        new ValueStateDescriptor<Long>("uvState",
                                TypeInformation.of(new TypeHint<Long>(){})));

            }

            @Override
            public Tuple2<String, Long> map(UmsLog umsLog) throws Exception {
                //初始化uvState
                if(uvState.value()==null){
                    uvState.update(0L);
                }
                //先判断是否使用不同用户访问该页面 如果是 则UV+1
                if(!userIdState.contains(umsLog.getUserid().toString())){
                    userIdState.put(umsLog.getUserid().toString(),null);//今天没有访问该页面
                    uvState.update(uvState.value()+1);
                }
                //生成Redis key，格式为 日期_logType
                String redisKey=umsLog.getUpdateTime()+"_"+umsLog.getLogType();
                System.out.println(redisKey + "   :::   " + uvState.value());
                System.out.println("由"+umsLog.getUserid()+"号用户，在"+umsLog.getUpdateTime()+
                        "时间操作了地址【"+umsLog.getRequestUrl()+"】1次！"+"；数据库的序号是："+umsLog.getId());
                System.out.println("【"+umsLog.getRequestUrl()+"】，共操作了"+uvState.value()+"次！");
                return Tuple2.of(redisKey,uvState.value());
            }//sink进行输出
        }).addSink(new RedisSink<>(config,new RedisSetSinkMapper()));

        env.execute();//流数据处理需要，执行环境

    }
    public static class RedisSetSinkMapper implements RedisMapper<Tuple2<String,Long>> {
        //
        @Override
        public RedisCommandDescription getCommandDescription() {
            return new RedisCommandDescription(RedisCommand.SET);//使用的什么redis指令进行存储
        }

        @Override
        public String getKeyFromData(Tuple2<String, Long> stringLongTuple2) {
            return stringLongTuple2.f0;
        }

        @Override
        public String getValueFromData(Tuple2<String, Long> stringLongTuple2) {
            return stringLongTuple2.f1.toString();
        }
    }
}
