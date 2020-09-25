package com.hdax.mapper;

import com.hdax.entity.Rbills;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RbillsDao {

    /*添加入库单据信息*/
    public void InsertInfo(Rbills rbills);

    /*未查询数量*/
    public long getTotalCount(@Param("storeId") int storeId, @Param("number") String number);

    /*已查询数量*/
    public long getTotalCountS(@Param("storeId") int storeId, @Param("number") String number);

    /*未审核条件查询*/
    public List<Rbills> queryFY(@Param("storeId") int storeId, @Param("number") String number, @Param("offset") int offset, @Param("limit") int limit);

    /*已审核条件查询*/
    public List<Rbills> queryFYS(@Param("storeId") int storeId, @Param("number") String number, @Param("offset") int offset, @Param("limit") int limit);

    /*修改审核状态*/
    public void updateInfo(String number);

    /*查询审核是否已经通过*/
    public int TongG(String number);

}
