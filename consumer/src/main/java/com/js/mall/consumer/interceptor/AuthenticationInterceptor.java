package com.js.mall.consumer.interceptor;

import com.alibaba.dubbo.config.annotation.Reference;
import com.js.api.annotation.UserLoginToken;
import com.js.api.model.UmsAdmin;
import com.js.api.service.ITokenService;
import com.js.api.service.IUserService;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;


@Component
public class AuthenticationInterceptor implements HandlerInterceptor {//http拦截器，和手写AOP一样效果。
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


    @Override  //执行核心业务之前 进行验证 前置
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token=request.getHeader("Authorization");
        if(!(handler instanceof HandlerMethod)){//image css html js
            return true;
        }
        HandlerMethod handlerMethod=(HandlerMethod)handler;
        Method m=handlerMethod.getMethod();
        //检查有没有需要用户权限的注解
        if(m.isAnnotationPresent(UserLoginToken.class)){
            UserLoginToken userLoginToken=m.getAnnotation(UserLoginToken.class);
            if(userLoginToken.required()){
                //验证
                if(token==null){
                    throw new RuntimeException("无token，请重新登录！");
                }
                //获取token中的userid
                token=token.split("@")[1];

                long userid=Long.parseLong(tokenService.getUserId(token));
                UmsAdmin a=userService.findUserById(userid);
                if(a==null){
                    throw new RuntimeException("用户不存在，请重新登录！");
                }
                if(tokenService.checkSign(token,a.getPassword())){
                    return true;
                }else{
                    throw new RuntimeException("无token，请重新登录！");
                }
            }
        }


        return true;
    }

    @Override//执行阶段
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override//后置
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
