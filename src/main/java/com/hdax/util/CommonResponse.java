package com.hdax.util;

public class CommonResponse<T> {

    private String success = "success";//成功响应
    private String code;//响应状态码
    private String msg;//错误消息
    private T data;//成功响应数据

    //成功响应
    public CommonResponse(T data,String success){
        code = "0000";
        msg = "success";
        this.success = success;
        this.data = data;
    }

    //成功响应
    public CommonResponse(T data){
        code = "0000";
        msg = "success";
        this.data = data;
    }

    //失败响应
    public CommonResponse(String code, String msg){
        this.code = code;
        this.msg = msg;
    }

    public CommonResponse(String code, String msg, String success, T data) {
        this.code = code;
        this.msg = msg;
        this.success = success;
        this.data = data;
    }

    public CommonResponse(String code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }


    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
