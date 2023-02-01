package com.js.mall.consumer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.js.api.annotation.LogType;
import com.js.api.annotation.SystemLog;
import com.js.api.annotation.UserLoginToken;
import com.js.api.dto.PmsProductQueryParam;
import com.js.api.model.PmsProduct;
import com.js.api.service.IPmsProductService;
import com.js.api.service.IUserService;
import com.js.common.CommonPage;
import com.js.common.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;


@RestController
@Api(tags = "PmsProductController",description = "商品管理")
@RequestMapping("/product")
@CrossOrigin
public class PmsProductController {


    @Reference(
            version="1.0.0",
            interfaceName = "com.js.api.service.IPmsProductService",
            interfaceClass = IPmsProductService.class,
            timeout = 120000

    )
    private IPmsProductService pmsService;

    @ApiOperation("查询商品")
    @GetMapping(value="/list")
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "查询商品",type= LogType.PRODUCT_LIST)
    public CommonResult<CommonPage<PmsProduct>> getList(
            PmsProductQueryParam pmsProductQueryParam,
            @RequestParam(value="pageSize",defaultValue = "5") Integer pageSize,
            @RequestParam(value="pageNum",defaultValue = "1") Integer pageNum

    ){
        return CommonResult.success(pmsService.list(pmsProductQueryParam,pageSize,pageNum));
    }
}
