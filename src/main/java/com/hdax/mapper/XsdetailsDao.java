package com.hdax.mapper;

import com.hdax.entity.Xsdetails;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface XsdetailsDao {

    /*添加信息*/
    public void InsertInfo(Xsdetails xsdetails);

    /*根据单据号、商品编号查询数量*/
    public List<Xsdetails> selectNum(@Param("number") String number, @Param("buId") long buId, @Param("dh") long dh);

    /*根据单据号查询数量*/
    public List<Xsdetails> selectNum2(@Param("number") String number);


    /*根据编号查询信息*/
    public List<Xsdetails> selectDH(String number);

    /*查询全部商品*/
    public List<Xsdetails> getAll();

    /*当天销量*/
    public String jinri(long buId);
    /*本月销量*/
    public String benyue(long buId);
    /*今年销量*/
    public String year(long buId);

    /*根据当前日期推几天 一周后*/
    public String times(int day);

    /*根据当天日期销售总数量*/
    public String timesTotal(@Param("xstime") String xstime);

    /*统计全部销量*/
    public List<Xsdetails> zxl(@Param("typeId") long typeId);
    /*统计前10 top销量*/
        public List<Xsdetails> zxx(@Param("typeId") long typeId);


    /*统计全部销量*/
    public List<Xsdetails> zxs(@Param("typeId") long typeId);

    /*统计全部销量*/
    public List<Xsdetails> zz(@Param("xsTime") String xsTime);


//库存 数量
    Boolean chuku(String number);



}
