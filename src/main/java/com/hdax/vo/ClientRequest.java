package com.hdax.vo;

import lombok.Data;

@Data
public class ClientRequest {
    private Integer page;
    private Integer limit;
    private String name;
}
