package com.hdax.vo;

import lombok.Data;

@Data
public class BillRequest {
    private Integer page;  //第几页
    private Integer limit;  //多少条
    private String username;  //用户名
    private Integer providerid = -1;  //id条件
    private String aphone;
    private String ano;
}
