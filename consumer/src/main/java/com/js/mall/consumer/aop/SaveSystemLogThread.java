package com.js.mall.consumer.aop;

import com.js.api.model.UmsLog;
import com.js.api.service.IUmsLogService;

/*
springmvc默认是单例的，每一个请求进入，都会启动一个线程，会存在线程安全问题，
即最好不要在controller,service层使用全局变量，如果存在对全局变量的修改，会出现线程安全问题。
 */
public class SaveSystemLogThread implements Runnable {

    private UmsLog log;
    private IUmsLogService logService;
    public SaveSystemLogThread(UmsLog log, IUmsLogService service){
        this.log=log;
        this.logService=service;
    }
    @Override
    public void run() {
        if(log.getLogType()!=null){
           // System.out.println("开始插入日志中........");
            logService.insert(log);
        }
    }
}
