package com.js.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.js.api.model.UmsLogType;
import com.js.api.model.UmsLogTypeExample;
import com.js.api.model.UmsUserView;
import com.js.api.service.IUserService;
import com.js.api.service.IUserViewService;
import com.js.common.CommonPage;
import com.js.mall.provider.mapper.UmsLogTypeMapper;
import com.js.mall.provider.mapper.redis.mapper.RedisUtilMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.*;


@Service(
        version="1.0.0",
        interfaceName = "com.js.api.service.IUserViewService",
        interfaceClass = IUserViewService.class
)
public class UserViewServiceImpl implements IUserViewService {

    @Autowired
    private UmsLogTypeMapper typeMapper;

    @Autowired
    private RedisUtilMapper rmapper;
    @Override
    public CommonPage listUV(String start, String end, String type) {

        List uvList=forDate(start,end,type);


        return CommonPage.restPage(uvList);
    }

    public List<UmsUserView> forDate(String start,String end,String type){

        //日期格式化
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        List <UmsUserView> uvList=new ArrayList();

        try{

            //起始日期
            Date d1=sdf.parse(start);
            //结束日期
            Date d2=sdf.parse(end);

            Date tmp=d1;
            Calendar dd=Calendar.getInstance();
            dd.setTime(d1);

            while(tmp.getTime()<=d2.getTime()){
                tmp=dd.getTime();

                //从redis中提取数据进行柱状图的输出
                Set<Object> s=rmapper.getAllKeys(sdf.format(tmp)+"_"+type);
                //c:格式为 日期_logType
                s.forEach(c->{
                    int count=Integer.parseInt(rmapper.get(c.toString()).toString());

                    uvList.add(new UmsUserView(c.toString().substring(0,10),count));//2012-09-09
                });

                //天数加1
                dd.add(Calendar.DAY_OF_MONTH,1);
            }


        }catch(Exception e){
            e.printStackTrace();
        }

        return uvList;
    }
    @Override
    public CommonPage listTypeUV() throws Exception {
        UmsLogTypeExample example=new UmsLogTypeExample();
        example.createCriteria().andFlagEqualTo(1);
        List<UmsLogType> list=typeMapper.selectByExample(example);

        return CommonPage.restPage(list);
    }
}
