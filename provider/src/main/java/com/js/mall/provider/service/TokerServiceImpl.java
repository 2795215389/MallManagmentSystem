package com.js.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.js.api.service.ITokenService;

import java.util.Date;


@Service(
        version="1.0.0",
        interfaceName = "com.js.api.service.ITokenService",
        interfaceClass = ITokenService.class
)
public class TokerServiceImpl implements ITokenService {

    private static final long EXPIRE_TIME=5*600*1000;//50分钟
    @Override
    public String getToken(String userId, String password) {//生成token码
        String token="";
        try{

            Date date=new Date(System.currentTimeMillis()+EXPIRE_TIME);

            //作为Token区分码,设置过期时间,加密
            token=JWT.create().withAudience(userId).withExpiresAt(date).sign(Algorithm.HMAC256(password));


        }catch(Exception e){
            e.printStackTrace();
        }


        return token;
    }

    @Override
    public String getUserId(String token) {
        try{
            String userid=JWT.decode(token).getAudience().get(0);
            return userid;

        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean checkSign(String token, String password) {
        if(token==null){
            throw new RuntimeException("无token，请重新登录");
        }
        try{
            JWTVerifier jwtVerifier=JWT.require(Algorithm.HMAC256(password)).build();
            jwtVerifier.verify(token);

        }catch(Exception e){
            throw new RuntimeException("token无效，请重新登录");
        }
        return true;
    }
}
