package com.hdax.mapper;


import com.hdax.entity.Store;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StoreDao {


    //全查
    public List<Store> query();
    //总数量
    public long getTotalCount(@Param("storeName") String storeName);

    //分页条件查询
    public List<Store> TJquery(@Param("storeName") String storeName, @Param("offset") int offset, @Param("limit") int limit);


    //分页条件查询
    public List<Store> TT(long storeId);

    //添加信息
    public void addinfo(Store s);

    //修改信息
    public int updateInfo(Store s);

 /*   //批量删除信息
    public int delInfo(Integer[] ids);*/

    /*删除信息*/
    public void  delInfo(int id);

}
