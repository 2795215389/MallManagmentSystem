package com.js.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.js.api.dto.OmsOrderQueryParam;
import com.js.api.dto.OmsReceiverInfoParam;
import com.js.api.model.*;
import com.js.api.service.IOmsOrderService;
import com.js.api.service.IPmsBrandService;
import com.js.common.CommonPage;

import com.js.mall.provider.component.CancelOrderSender;
import com.js.mall.provider.mapper.OmsOrderItemMapper;
import com.js.mall.provider.mapper.OmsOrderMapper;
import com.js.mall.provider.mapper.OmsOrderOperateHistoryMapper;
import com.js.mall.provider.mapper.PmsSkuStockMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author js
 * @date 2022/12/5 18:17
 */
@Service(
        version="1.0.0",
        interfaceName = "com.js.api.service.IOmsOrderService",
        interfaceClass = IOmsOrderService.class
)
public class OmsOrderServiceImpl implements IOmsOrderService {
    @Autowired
    private OmsOrderMapper omsOrderMapper;

    @Autowired
    private OmsOrderItemMapper omsOrderItemMapper;

    @Autowired
    private PmsSkuStockMapper pmsSkuStockMapper;

    @Autowired
    private OmsOrderOperateHistoryMapper orderOperateHistoryMapper;
    @Autowired
    private CacheManager cacheManager;
    @Autowired
    private CancelOrderSender cancelOrderSender;



    @Cacheable(cacheNames ={"OrderList"},unless = "#result==null",
    key="T(String).valueOf(#pageNum+'-'+#pageSize)"+
            ".concat(#queryParam.orderSn!=null?#queryParam.orderSn:'os')"+
            ".concat(#queryParam.receiverKeyword!=null?#queryParam.receiverKeyword:'rk')"+
            ".concat(#queryParam.status!=null?#queryParam.status:'ss')"+
            ".concat(#queryParam.orderType!=null?#queryParam.orderType:'ot')"+
            ".concat(#queryParam.sourceType!=null?#queryParam.sourceType:'st')"+
            ".concat(#queryParam.createTime!=null?#queryParam.createTime:'ct')"
    )
    @Override
    public CommonPage list(OmsOrderQueryParam queryParam, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum,pageSize);
        List<OmsOrder> list=omsOrderMapper.getOrderList(queryParam);
        return CommonPage.restPage(list);
    }

    @Cacheable(cacheNames = {"Order"},unless ="#result==null",key="#id")
    @Override
    public OmsOrder detail(Long id) {
        return omsOrderMapper.selectByPrimaryKey(id);
    }

    private void clearOrder(){
        cacheManager.getCache("OrderList").clear();
    }



    //删除：逻辑删除，修改字段即可。若删除记录可能会有法律纠纷
    @CacheEvict(cacheNames ={"Order"},key="#id",allEntries = true,beforeInvocation = false)//删除缓存
    @Override
    public int delete(Long id) {
        clearOrder();//删除缓存OrderList
        OmsOrder record=new OmsOrder();
        record.setDeleteStatus(1);

        OmsOrderExample example=new OmsOrderExample();
        example.createCriteria().andDeleteStatusEqualTo(0).andIdEqualTo(id);

        return omsOrderMapper.updateByExampleSelective(record,example);
    }

    @CachePut(cacheNames = {"Order"},key="#result.id")//修改,点入明细进行修改
    @Override
    public OmsOrder updateReceiverInfo(OmsReceiverInfoParam receiverInfoParam) {
        clearOrder();//DML操作时必须删除原来的缓存
        OmsOrder order=detail(receiverInfoParam.getOrderId());
        order.setId(receiverInfoParam.getOrderId());
        order.setReceiverName(receiverInfoParam.getReceiverName());
        order.setReceiverPhone(receiverInfoParam.getReceiverPhone());
        order.setReceiverPostCode(receiverInfoParam.getReceiverPostCode());
        order.setReceiverDetailAddress(receiverInfoParam.getReceiverDetailAddress());
        order.setReceiverProvince(receiverInfoParam.getReceiverProvince());
        order.setReceiverCity(receiverInfoParam.getReceiverCity());
        order.setReceiverRegion(receiverInfoParam.getReceiverRegion());
        order.setModifyTime(new Date());
        int count=omsOrderMapper.updateByPrimaryKeySelective(order);


        //操作订单历史表,记录修改信息的日志
        OmsOrderOperateHistory history=new OmsOrderOperateHistory();
        history.setOrderId(receiverInfoParam.getOrderId());
        history.setCreateTime(new Date());
        history.setOperateMan("后台管理员");
        history.setOrderStatus(receiverInfoParam.getStatus());
        history.setNote("修改了收货人信息！");
        orderOperateHistoryMapper.insert(history);
        return order;
    }



    @Override
    public void sendDelayMessageCancelOrder(Long orderId, int minute) {
        long delayTimes=minute*60*1000;//转换为毫秒
        cancelOrderSender.sendMessage(orderId,delayTimes);
    }



    @CachePut(cacheNames = {"Order"},key="#orderId")
    @Override
    public OmsOrder cancelOrder(Long orderId) {
        clearOrder();//删除缓存OrderList

        OmsOrder omsOrder=this.detail(orderId);
        if(omsOrder!=null){
            //修改订单状态为取消
            omsOrder.setStatus(4);
            omsOrderMapper.updateByPrimaryKeySelective(omsOrder);

            //
            OmsOrderItemExample omsOrderItemExample=new OmsOrderItemExample();
            omsOrderItemExample.createCriteria().andOrderIdEqualTo(orderId);

            List<OmsOrderItem> orderItemList=omsOrderItemMapper.selectByExample(omsOrderItemExample);
            //解除订单商品库的锁定

            List<Long> productIdList=orderItemList.stream().map(c->c.getProductId()).collect(Collectors.toList());
            if(!CollectionUtils.isEmpty(orderItemList)){
                PmsSkuStock pmsSkuStock=new PmsSkuStock();
                PmsSkuStockExample example=new PmsSkuStockExample();
                example.createCriteria().andProductIdIn(productIdList);
                pmsSkuStock.setLockStock(0);//解除锁定
                pmsSkuStockMapper.updateByExampleSelective(pmsSkuStock,example);
            }


        }

        return omsOrder;
    }
}
