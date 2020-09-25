package com.hdax.mapper;

import com.hdax.entity.Bills;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface billsDao {

    /*添加信息*/
    public void InsertInfo(Bills bills);

    /*查询*/
    public List<Bills> queryAll();

    /*未通过查询数量*/
    public long getTotalCount(@Param("storeId") int storeId, @Param("number") String number);

    /*已通过查询数量*/
    public long getTotalCountS(@Param("storeId") int storeId, @Param("number") String number);

    /*未审核分页查询*/
    public List<Bills> queryFY(@Param("storeId") int storeId, @Param("number") String number, @Param("offset") int offset, @Param("limit") int limit);

    /*已审核分页查询*/
    public List<Bills> queryFYS(@Param("storeId") int storeId, @Param("number") String number, @Param("offset") int offset, @Param("limit") int limit);

    /*修改审核状态*/
    public void updateInfo(String number);

  /*  先择  修改仓库 入库*/
  public void update(Bills id);


    /*查询审核是否已经通过*/
    public int TongG(String number);

    /*删除单据*/
    public long delInfo(String number);
}
