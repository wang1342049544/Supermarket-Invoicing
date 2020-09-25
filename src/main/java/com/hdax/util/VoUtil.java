package com.hdax.util;

public class VoUtil {

    private static String success = "success";

    /**
     * 成功
     */
    public static<T> CommonResponse<T> returnSuccess(T data) {
        CommonResponse<T> commonResponse = new CommonResponse<T>(data,success);
        return commonResponse;
    }

    /**
     * 失败
     */
    public static CommonResponse returnFail(String errCode, String errMsg) {
        CommonResponse commonResponse = new CommonResponse(errCode,errCode);
        return commonResponse;
    }

    /**
     * 成功
     */
    public static<T> CommonPageResponse<T> returnPageSuccess(T data, int count) {
        CommonPageResponse<T> commonPageResponse = new CommonPageResponse<T>(data,count,success);
        return commonPageResponse;
    }

    /**
     * 失败
     */
    public static CommonPageResponse returnPageFail(String errCode, String errMsg) {
        CommonPageResponse commonPageResponse = new CommonPageResponse(errCode,errCode);
        return commonPageResponse;
    }

}
