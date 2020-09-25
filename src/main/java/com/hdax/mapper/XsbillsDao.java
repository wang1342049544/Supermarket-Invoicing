package com.hdax.mapper;

import com.hdax.entity.Xsbills;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface XsbillsDao {

    /*添加信息*/
    public void InsertInfo(Xsbills xsbills);

    /*条件分页查询*/
    public List<Xsbills> selectTJ(@Param("number") String number, @Param("offset") int offset, @Param("limit") int limit);
    public List<Xsbills> selectTJJ(@Param("number") String number, @Param("offset") int offset, @Param("limit") int limit);
    /*查询数量*/
    public long getTotalCount(@Param("number") String number);


    //修改信息
    public int updateInfo(Xsbills x);

    //修改信息
    public int updateInfo1(Xsbills x);
    //修改信息
    public int updateInfo2(Xsbills x);

    //修改信息
    public int updateInfo4(Xsbills x);

    public int updateInfo5(Xsbills x);
}
