package com.js.api.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 创建人：Jason
 * 创建时间：2020/2/7
 * 描述你的类：UserView
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UmsUserView implements Serializable {
    //{date: '2020-02-07', orderCount: 10, orderAmount: 1093},
    private String updateTime;
    private int count;
    //private String name;

}
