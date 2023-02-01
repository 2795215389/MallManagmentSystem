package com.js.api.dto;

import lombok.Data;

import java.io.Serializable;


@Data
public class OmsReceiverInfoParam implements Serializable {
    private Long orderId;//主键id
    private String receiverName;
    private String receiverPhone;
    private String receiverPostCode;
    private String receiverDetailAddress;
    private String receiverProvince;
    private String receiverCity;
    private String receiverRegion;
    private Integer status;
}
