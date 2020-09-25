package com.hdax.constant;


/**
 * 常量数据存放类
 */
public class Constants {
    public static class LoginInfo{
        public static final String LOGIN_USER = "manager";

        public static final String ERR_LOGIN_INVALID_USERNAME = "用户名不正确";
        public static final String ERR_LOGIN_INVALID_PASSWORD = "密码不正确";
    }





    public static class Client{
        public static final  String ERR_CLIENT_DEL_CODE="1051";
        public static final  String ERR_CLIENT_DEL_MSG="删除客户失败";

        public static final  String ERR_CLIENT_UPD_CODE="1052";
        public static final  String ERR_CLIENT_UPD_MSG="修改客户失败";

        public static final  String ERR_CLIENT_INS_CODE="1053";
        public static final  String ERR_CLIENT_INS_MSG="添加客户失败";

        public static final  String ERR_CLIENT_SEL_CODE="1054";
        public static final  String ERR_CLIENT_SEL_MSG="查询客户失败";
    }

    public static class Goods{
        public static final  String ERR_GOODS_SEL_CODE="1061";
        public static final  String ERR_GOODS_SEL_MSG="查询商品失败";

        public static final  String ERR_GOODS_DEL_CODE="1062";
        public static final  String ERR_GOODS_DEL_MSG="删除商品失败";

        public static final  String ERR_GOODS_UPD_CODE="1063";
        public static final  String ERR_GOODS_UPD_MSG="修改商品失败";

        public static final  String ERR_GOODS_INS_CODE="1064";
        public static final  String ERR_GOODS_INS_MSG="添加商品失败";

    }
}
