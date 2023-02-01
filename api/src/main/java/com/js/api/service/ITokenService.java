package com.js.api.service;

public interface ITokenService {
    public  String getToken(String userId, String password);//需要写token的生成方法
    public  String getUserId(String token);
    public  boolean checkSign(String token, String password);
}
