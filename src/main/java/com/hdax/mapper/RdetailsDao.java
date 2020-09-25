package com.hdax.mapper;


import com.hdax.entity.Rdetails;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RdetailsDao {


    //添加信息
    public void InsertInfo(Rdetails rdetails);

    /*删除信息*/
    public void delInfo(String number);

    /*根据单号查询信息*/
    public List<Rdetails> queryAll(@Param("number") String number);

}
