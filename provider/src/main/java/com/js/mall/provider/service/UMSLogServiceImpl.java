package com.js.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.js.api.model.UmsLog;
import com.js.api.service.IUmsLogService;
import com.js.mall.provider.mapper.UmsLogMapper;
import org.springframework.beans.factory.annotation.Autowired;


@Service(
        version="1.0.0",
        interfaceName = "com.js.api.service.IUmsLogService",
        interfaceClass = IUmsLogService.class
)
public class UMSLogServiceImpl implements IUmsLogService {
    @Autowired
    private UmsLogMapper dao;
    @Override
    public Integer insert(UmsLog log) {
        //开始插入日志记录
        //System.out.println("插入日志记录");
        return dao.insert(log);
    }
}
