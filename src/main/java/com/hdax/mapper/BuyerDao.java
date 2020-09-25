package com.hdax.mapper;

import com.hdax.entity.Buyer;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BuyerDao {


        /*添加信息*/
    public void InsertInfo(Buyer buyer);

    /*查询*/
    public List<Buyer> queryAll();

    /*分页查询*/
    public List<Buyer> queryFY(@Param("offset") int offset, @Param("limit") int limit);

    /*查询总数量*/
    public long getTotalCount();

    /*删除信息*/
    public void  delInfo(int id);

    /*修改信息*/
    public void updateInfo(Buyer buyer);

    /*批量删除*/
    public void delD(int sids);




}
