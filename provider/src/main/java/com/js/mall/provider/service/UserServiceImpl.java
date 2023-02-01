package com.js.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.js.api.dto.UmsAdminLoginParam;
import com.js.api.model.UmsAdmin;
import com.js.api.service.ITokenService;
import com.js.api.service.IUserService;
import com.js.mall.provider.mapper.UmsAdminMapper;
import org.springframework.beans.factory.annotation.Autowired;


@Service(
        version = "1.0.0",
        interfaceName = "com.js.api.service.IUserService",
        interfaceClass = IUserService.class
)//dubbo
public class UserServiceImpl implements IUserService {

    @Autowired
    private UmsAdminMapper umsAdminMapper;
    @Autowired
    private ITokenService tokenService;


    @Override
    public UmsAdmin login(UmsAdminLoginParam user) {
        return null;
    }

    @Override
    public UmsAdmin findUserById(Long userId) {
        return umsAdminMapper.selectByPrimaryKey(userId);
    }

    @Override
    public UmsAdmin findByUsername(String username) {
        return umsAdminMapper.findByUsername(username);
    }

    //根据token码找到用户
    @Override
    public UmsAdmin findByUmsAdmin(String token) {
        String userId=tokenService.getUserId(token);
        return umsAdminMapper.selectByPrimaryKey(Long.valueOf(userId));
    }

    @Override
    public UmsAdmin reg(UmsAdmin user) {
        //将图片注册到该位置
        user.setIcon("http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/170157_yIl3_1767531.jpg");
        umsAdminMapper.insert(user);
        return user;
    }
}
