package com.hdax.mapper;


import com.hdax.entity.Details;

import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface DetailsDao {

    /*添加信息*/
    public void InsertInfo(Details details);

    public List<Details> queryAll(@Param("number") String number);

    //总数量
    public long getTotalCount(@Param("number") String number);


    /*删除信息*/
    public long delInfo(String number);


}
