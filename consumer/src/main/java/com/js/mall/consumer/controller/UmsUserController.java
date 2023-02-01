package com.js.mall.consumer.controller;


import com.alibaba.dubbo.common.json.JSON;
import com.alibaba.dubbo.common.json.ParseException;
import com.alibaba.dubbo.config.annotation.Reference;
import com.baidu.aip.face.AipFace;
import com.js.api.annotation.LogType;
import com.js.api.annotation.SystemLog;
import com.js.api.annotation.UserLoginToken;
import com.js.api.dto.AIBaiduFaceBean;
import com.js.api.dto.AIFaceBean;
import com.js.api.dto.UmsAdminLoginParam;
import com.js.api.model.UmsAdmin;
import com.js.api.service.ITokenService;
import com.js.api.service.IUserService;
import com.js.common.AIFactoryUtil;
import com.js.common.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


/*
启动服务器之后启动客户端，或者刷新客户端。否则会network error
需要等一段时间，使得对象被注册到dubbo
 */



@RestController
@Api(tags = "UmsUserController",description = "后台用户管理")//将类的描述发送到Swagger文档
@RequestMapping("/admin")
@CrossOrigin//解决跨域问题
public class UmsUserController {
    //读取配置文档
    /*
    jwt:
  tokenHeader: Authorization #JWT存储的请求头-----前端往后端送
  #secret: mall-admin-secret #JWT加解密使用的密钥
  expiration: 604800 #JWT的超期限时间(60*60*24)
  tokenHead: Bearer@ #JWT负载中拿到开头----后端往前端送
     */
    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @Value("${jwt.tokenHeader}")
    private String tokenHeader;

    @Reference(
            version="1.0.0",
            interfaceName = "com.js.api.service.IUserService",
            interfaceClass = IUserService.class,
            timeout = 120000
    )
      private IUserService userService;


    @Reference(
            version="1.0.0",
            interfaceName = "com.js.api.service.ITokenService",
            interfaceClass = ITokenService.class,
            timeout = 120000
    )
    private ITokenService tokenService;


    //人脸模块对象
    private AipFace aipFace= AIFactoryUtil.getAipFace();

    @ApiOperation(value="登录以后返回token")
    @PostMapping(value ="/login")
    @ResponseBody//响应体
    public CommonResult login(@RequestBody UmsAdminLoginParam user){//用户名密码
        //根据用户名找到是否存在该用户
        UmsAdmin user1=userService.findByUsername(user.getUsername());
        if(user1==null){
            return CommonResult.validateFailed("用户名不存在!");
        }else{
            //判断密码是否正确
            if(!user1.getPassword().equals(user.getPassword())){
                Map<String,String> tokenMap=new HashMap();
                tokenMap.put("error_code","500");
                return CommonResult.failed(tokenMap);
            }else{//密码也匹配

                //根据用户ID和密码生成唯一的token码
                String token=tokenService.getToken(user1.getId().toString(),user1.getPassword());


                //返回自定义响应头
                Map <String,String> tokenMap=new HashMap<>();
                tokenMap.put("token",token);
                tokenMap.put("error_code","200");
                tokenMap.put("tokenHead",tokenHead);
                return CommonResult.success(tokenMap);
            }
        }

    }


    @ApiOperation(value="面部识别登录以后返回token")
    @PostMapping(value ="/flogin")
    @ResponseBody//响应体
    public CommonResult faceLogin(@RequestBody AIFaceBean faceBean) throws ParseException {
        Map<String,String> tokenMap=new HashMap();
        String groupList="login"; //分组
        //PNG图片
        JSONObject resultObject=aipFace.search(faceBean.getImgdata(),"BASE64",groupList,null);
        AIBaiduFaceBean faceSearchResponse= JSON.parse(resultObject.toString(), AIBaiduFaceBean.class);
        if(faceSearchResponse.getError_code().equals("0")&&faceSearchResponse.getError_msg().equals("SUCCESS")){//该图片是成功的
            //这里对人脸先检索 是否已经录入，设置判定条件为返回score大于80 即代表一个人
            HashMap<String,Object> m=  faceSearchResponse.getResult().getUser_list().get(0);

            if(Float.parseFloat(m.get("score").toString())>80f){
                faceBean.setError_code(faceSearchResponse.getError_code());
                faceBean.setError_msg(faceSearchResponse.getError_msg());
                //取出你曾经注册的用户id 也是图片名称
                String userid=m.get("user_id").toString();
                //根据userid 取出用户
                UmsAdmin a=userService.findUserById(Long.parseLong(userid));
                String password=a.getPassword();
                String username=a.getUsername();

                //生成token
                String token=tokenService.getToken(userid,password);
                tokenMap.put("error_code",faceSearchResponse.getError_code());
                tokenMap.put("token",token);
                tokenMap.put("tokenHead",tokenHead);
                tokenMap.put("username",username);
                tokenMap.put("password",password);
                return CommonResult.success(tokenMap);

            }else{
                tokenMap.put("error_code",faceSearchResponse.getError_code());
                CommonResult.failed(tokenMap);
            }

        }else{
            tokenMap.put("error_code",faceSearchResponse.getError_code());
            CommonResult.failed(tokenMap);
        }
        return CommonResult.success(faceBean);

    }



    @ApiOperation(value="用户注册")
    @PostMapping(value ="/reg")
    @ResponseBody
    public CommonResult reg(@RequestBody UmsAdmin umAdmin){
        if(userService.findByUsername(umAdmin.getUsername())!=null){//已经被注册了
            Map<String,String> tokenMap=new HashMap();
            tokenMap.put("error_code","500");
            return CommonResult.failed(tokenMap);
        }

        UmsAdmin a=new UmsAdmin();

        a=userService.reg(umAdmin);
        //图片送百度
        String userid=a.getId().toString();
        String groupId="login";

        HashMap<String,String> options=new HashMap();
        options.put("user_info",a.getPassword());
        //人脸注册部分 前端摄像头传过来的数据的字头是：data:image/png:base64, 需要剔除它
        String b64=umAdmin.getPic().substring(22);//取出字头后面的数据即可,真实的图片字节流
        JSONObject object=aipFace.addUser(b64,"BASE64",groupId,userid,options);
        System.out.println(object);
        Map<String,String> tokenMap=new HashMap();
        tokenMap.put("error_code","200");
        return CommonResult.success(tokenMap);

    }

    @ApiOperation(value="获取当前登录用户信息")
    @GetMapping(value ="/info")
    @ResponseBody
    @SystemLog(description = "获取当前登录用户信息",type = LogType.USER_INFO)
   @UserLoginToken(required = true)
    public CommonResult info(HttpServletRequest request){
        String token=request.getHeader(tokenHeader);
        UmsAdmin admin=userService.findByUmsAdmin(token.split("@")[1]);  //根据token码 找到用户

        Map <String,Object> data=new HashMap<>();
        data.put("username",admin.getUsername());
        data.put("roles",new String[]{"TEST"});
        data.put("icon",admin.getIcon());
        return CommonResult.success(data);
    }




        //登出
        @ApiOperation(value="登出功能")
        @PostMapping(value ="/logout")
        @ResponseBody
        @SystemLog(description = "登出功能",type = LogType.USER_LOGIN_OUT)
        @UserLoginToken(required = true)
        public CommonResult logout(){//连接点
            return CommonResult.success(null);
        }






}
