package com.js.api.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;


@Data
public class UmsAdminLoginParam implements Serializable {

    @ApiModelProperty(value = "用户名",required = true)//将属性值写到Swagger
    @NotEmpty(message = "用户名不能为空")//校验validation
    private String username;
    @ApiModelProperty(value = "密码",required = true)
    @NotEmpty(message = "密码不能为空")
    private String password;
}
