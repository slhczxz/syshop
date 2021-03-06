package com.sy.shop.domain;

import lombok.Data;

import java.util.Date;

@Data
public class TbOrder {

    private String orderId;
    private String payment;
    private Integer paymentType;
    private String postFee;
    private Integer status;
    private Date createTime;
    private Date updateTime;
    private Date paymentTime;
    private Date consignTime;
    private Date endTime;
    private Date closeTime;
    private String shippingName;
    private String shippingCode;
    private Long userId;
    private String buyerMessage;
    private String buyerNick;
    private Integer buyerRate;

}
