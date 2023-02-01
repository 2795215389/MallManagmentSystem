package com.js.api.service;

import com.js.api.dto.OmsOrderQueryParam;
import com.js.api.dto.OmsReceiverInfoParam;
import com.js.api.model.OmsOrder;
import com.js.common.CommonPage;

public interface IOmsOrderService {
     CommonPage list(OmsOrderQueryParam queryParam, Integer pageSize, Integer pageNum) ;

    /**
     * 获取指定订单详情
     */
    OmsOrder detail(Long id);
    /**
     * 批量删除订单
     */
    int delete(Long id);

    /**
     * 修改订单收货人信息
     */

    OmsOrder updateReceiverInfo(OmsReceiverInfoParam receiverInfoParam);




    //根据id 取消订单
    public void sendDelayMessageCancelOrder(Long orderId, int minute);


    public OmsOrder cancelOrder(Long orderId) ;
}
