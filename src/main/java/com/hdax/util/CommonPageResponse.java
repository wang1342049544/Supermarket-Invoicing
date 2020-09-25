package com.hdax.util;

public class CommonPageResponse<T> extends CommonResponse<T> {

    private int count;//总条数

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    //成功响应
    public CommonPageResponse(T data, int count, String success){
        super("0000","success",success,data);
        this.count = count;
    }

    //成功响应
    public CommonPageResponse(T data, int count){
        super("0000","success",data);
        this.count = count;
    }

    //失败响应
    public CommonPageResponse(String code, String msg){
        super(code, msg);
    }
}
