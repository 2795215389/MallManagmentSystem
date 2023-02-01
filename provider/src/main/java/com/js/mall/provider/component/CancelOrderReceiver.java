package com.js.mall.provider.component;

import com.js.api.service.IOmsOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
@RabbitListener(queues = "mall.order.cancel")
public class CancelOrderReceiver {
    private static Logger LOGGER= LoggerFactory.getLogger(CancelOrderSender.class);

    @Autowired
    private IOmsOrderService service;

    @RabbitHandler
    public void handle(Long orderId){
        service.cancelOrder(orderId);//接受者调用删除方法
        LOGGER.info("send orderId:{}",orderId);
    }
}
