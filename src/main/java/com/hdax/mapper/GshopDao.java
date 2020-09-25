package com.hdax.mapper;

import com.hdax.entity.Gshop;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GshopDao {

    //总数量
    public long getTotalCount(@Param("supplierId") int supplierId);

    //分页
    public List<Gshop> queryTJ(@Param("supplierId") int supplierId, @Param("offset") int offset, @Param("limit") int limit);

   //添加供货商商品
    public void InsertInfo(Gshop gshop);

    /*查询最大的Id值*/
    public long MAXID();


}
