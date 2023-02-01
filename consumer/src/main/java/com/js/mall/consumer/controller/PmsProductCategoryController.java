package com.js.mall.consumer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.js.api.annotation.LogType;
import com.js.api.annotation.SystemLog;
import com.js.api.annotation.UserLoginToken;
import com.js.api.model.PmsBrand;
import com.js.api.model.PmsProductCategory;
import com.js.api.service.IPmsBrandService;
import com.js.api.service.IPmsProductCategoryService;
import com.js.common.CommonPage;
import com.js.common.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author js
 * @date 2022/12/2 19:41
 */
@RestController
@Api(tags = "PmsProductCategoryController",description = "商品分类管理")
@RequestMapping("/productCategory")
@CrossOrigin
public class PmsProductCategoryController {


    @Reference(
            version="1.0.0",
            interfaceName = "com.js.api.service.IPmsProductCategoryService",
            interfaceClass = IPmsProductCategoryService.class,
            timeout = 120000

    )
    private IPmsProductCategoryService categoryService;

    @ApiOperation("查询所有一级分类及其子类")
    @RequestMapping(value="/list/withChildren",method = RequestMethod.GET)
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "分页查询商品分类",type= LogType.PRODUCT_CATEGORY_LIST)
    public CommonResult<List<PmsProductCategory>> listWithChildren(){
        List<PmsProductCategory> list=categoryService.listWithChildren();

        return CommonResult.success(list);
    }
}
