package com.hdax.mapper;

import com.hdax.entity.Supplier;
;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SupplierDao {

    //全查
    public List<Supplier> query();


    /*总数量*/
    public  long getTotalCount(@Param("supName") String supName);

    //分页条件查询
    public List<Supplier> TJquery(@Param("supName") String supName, @Param("offset") int offset, @Param("limit") int limit);

    //添加供货商
    public void insertInfo(Supplier supplier);

    /*修改供货商信息*/
    public void updateInfo(Supplier supplier);

    /*删除*/
    public int delInfo(Integer[] ids);

}
