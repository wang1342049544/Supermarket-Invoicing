package com.hdax.mapper;

import com.hdax.entity.Shoptype;
import com.hdax.entity.Store;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface ShoptypeDao {

    /*查询全部*/
    public List<Shoptype> queryAll();

    /*查询全部*/
    public List<Shoptype> queryATT();

    //总数量
    public long getTotalCount(@Param("typeName") String typeName);

    //分页条件查询
    public List<Shoptype> TJquery(@Param("typeName") String typeName, @Param("offset") int offset, @Param("limit") int limit);

    //添加信息
    public void addinfo(Shoptype s);
}
