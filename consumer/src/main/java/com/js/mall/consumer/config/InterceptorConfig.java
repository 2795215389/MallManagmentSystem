package com.js.mall.consumer.config;

import com.js.mall.consumer.aop.SystemLogAspect;
//import com.js.mall.consumer.interceptor.AuthenticationInterceptor;
import com.js.mall.consumer.interceptor.AuthenticationInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//拦截器，在前端传过来之后也就是执行核心方法前
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
    private AuthenticationInterceptor authenticationInterceptor;

    @Autowired
    private SystemLogAspect systemLogAspect;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(systemLogAspect).addPathPatterns("/**");//拦截全部
        registry.addInterceptor(authenticationInterceptor).addPathPatterns("/**");
    }
}
