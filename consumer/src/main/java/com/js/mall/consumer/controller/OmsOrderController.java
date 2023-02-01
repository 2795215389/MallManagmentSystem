package com.js.mall.consumer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.js.api.annotation.LogType;
import com.js.api.annotation.SystemLog;
import com.js.api.annotation.UserLoginToken;
import com.js.api.dto.OmsOrderQueryParam;
import com.js.api.dto.OmsReceiverInfoParam;
import com.js.api.dto.PmsProductQueryParam;
import com.js.api.model.OmsOrder;
import com.js.api.model.PmsProduct;
import com.js.api.service.IOmsOrderService;
import com.js.api.service.IPmsBrandService;
import com.js.common.CommonPage;
import com.js.common.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author js
 * @date 2022/12/5 18:12
 */
@RestController
@Api(tags = "OmsOrderController",description = "订单管理")
@RequestMapping("/order")
@CrossOrigin
public class OmsOrderController {

    @Reference(

            version="1.0.0",
            interfaceName = "com.js.api.service.IOmsOrderService",
            interfaceClass = IOmsOrderService.class,
            timeout = 120000

    )
    private IOmsOrderService orderService;


    //前端传过来一个id列表
    @ApiOperation("批量删除订单")
    @PostMapping(value="/delete")
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "批量删除订单",type= LogType.ORDER_DELETE)
    public CommonResult<OmsOrder> delete(@RequestParam("ids") List<Long> ids){

        CommonResult commonResult;
        try{
            ids.forEach(c->orderService.delete(c));
            commonResult=CommonResult.success(1);
        }catch(Exception e){
            commonResult=CommonResult.failed();
            e.printStackTrace();

        }
        return commonResult;
    }


    @ApiOperation("获取订单详情")
    @GetMapping(value="/{id}")
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "订单明细",type= LogType.ORDER_DETAIL)
    public CommonResult<OmsOrder> detail(@PathVariable Long id){
        OmsOrder omsOrder=orderService.detail(id);
        return CommonResult.success(omsOrder);
    }



    //根据输入条件查看订单
    @ApiOperation("查询订单")
    @GetMapping(value="/list")
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "查询订单",type= LogType.ORDER_LIST)
    public CommonResult<CommonPage<OmsOrder>> getList(
            OmsOrderQueryParam omsOrderQueryParam,
            @RequestParam(value="pageSize",defaultValue = "5") Integer pageSize,
            @RequestParam(value="pageNum",defaultValue = "1") Integer pageNum

    ){
        return CommonResult.success(orderService.list(omsOrderQueryParam,pageSize,pageNum));
    }


    //点入订单明细进行修改订单信息
    @ApiOperation("修改收货人信息")
    @PostMapping(value="/update/receiverInfo")
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "修改收货人信息",type= LogType.ORDER_RECEIVER_UPDATE)
    public CommonResult updateReceiverInfo(@RequestBody OmsReceiverInfoParam infoParam){
        CommonResult commonResult;
        try{
            orderService.updateReceiverInfo(infoParam);
            commonResult=CommonResult.success(1);
        }catch(Exception e){
            commonResult=CommonResult.failed();
            e.printStackTrace();

        }
        return commonResult;
    }


    @ApiOperation("取消单个超时订单")
    @PostMapping(value="/cancelOrder")
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "取消单个超时订单",type= LogType.ORDER_CANCEL)
    public CommonResult cancelOrder(@RequestParam("ids") List<Long> ids,@RequestParam("minute") int minute){
       //演示之前，先把OmsOrder表中的status改为0.
        orderService.sendDelayMessageCancelOrder(ids.get(0),minute);
        return CommonResult.success(null);
    }
}
