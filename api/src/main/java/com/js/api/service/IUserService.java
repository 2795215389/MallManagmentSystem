package com.js.api.service;

import com.js.api.dto.UmsAdminLoginParam;
import com.js.api.model.UmsAdmin;

public interface IUserService {
    public UmsAdmin login(UmsAdminLoginParam user) ;
    public UmsAdmin findUserById(Long userId);
    public UmsAdmin findByUsername(String username);
    public UmsAdmin findByUmsAdmin(String token);
    public UmsAdmin reg(UmsAdmin user) ;
}
