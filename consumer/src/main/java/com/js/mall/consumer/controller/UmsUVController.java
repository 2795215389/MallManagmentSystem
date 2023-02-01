package com.js.mall.consumer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.js.api.annotation.UserLoginToken;
import com.js.api.model.UmsUserView;
import com.js.api.service.IUserViewService;
import com.js.common.CommonPage;
import com.js.common.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;


@RestController
@Api(tags = "UmsUVController",description = "UserView统计数据管理")
@RequestMapping("/uv")
@CrossOrigin//解决跨域问题
public class UmsUVController {
    @Reference(

            version="1.0.0",
            interfaceName = "com.js.api.service.IUserViewService",
            interfaceClass = IUserViewService.class,
            timeout = 120000

    )
    private IUserViewService userViewService;


    @ApiOperation(value="UserView统计数据管理")
    @GetMapping(value ="/list")
    @ResponseBody
    @UserLoginToken
    public CommonResult<CommonPage<UmsUserView>> getUVList(
            @RequestParam(value="start",required = true) String start,
            @RequestParam(value="end",required = true) String end,
            @RequestParam(value="type",required = true) String type

    ) throws Exception {
        CommonPage c=userViewService.listUV(start,end,type);
        return CommonResult.success(c);
    }



    @ApiOperation(value="UserView统计类型管理")
    @GetMapping(value ="/type")
    @ResponseBody
    @UserLoginToken
    public CommonResult<CommonPage<UmsUserView>> getUVType() throws Exception {
          CommonPage c=userViewService.listTypeUV();
          return CommonResult.success(c);
    }

}

