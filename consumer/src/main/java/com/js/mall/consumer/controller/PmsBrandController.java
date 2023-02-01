package com.js.mall.consumer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.js.api.annotation.LogType;
import com.js.api.annotation.SystemLog;
import com.js.api.annotation.UserLoginToken;
import com.js.api.dto.PmsProductQueryParam;
import com.js.api.model.PmsBrand;
import com.js.api.model.PmsProduct;
import com.js.api.service.IPmsBrandService;
import com.js.api.service.IPmsProductService;
import com.js.common.CommonPage;
import com.js.common.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

/**
 * @author js
 * @date 2022/12/2 18:51
 */
@RestController
@Api(tags = "PmsBrandController",description = "品牌管理")
@RequestMapping("/brand")
@CrossOrigin
public class PmsBrandController {

    @Reference(
            version="1.0.0",
            interfaceName = "com.js.api.service.IPmsBrandService",
            interfaceClass = IPmsBrandService.class,
            timeout = 120000

    )
    private IPmsBrandService brandService;



    @ApiOperation("根据品牌名称分页获取品牌列表")
    @GetMapping(value="/list")
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "品牌列表",type= LogType.BRAND_LIST)
    public CommonResult<CommonPage<PmsBrand>> getList(
            @RequestParam(value="keyword",required = false) String keyWord,
            @RequestParam(value="pageSize",defaultValue = "5") Integer pageSize,
            @RequestParam(value="pageNum",defaultValue = "1") Integer pageNum

    ){
        CommonPage c=brandService.listBrand(keyWord,pageNum,pageSize);
        return CommonResult.success(c);
    }
}
