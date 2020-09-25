package com.hdax.mapper;

import com.hdax.entity.Sales;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SalesDao {

    /*查询*/
    public List<Sales> queryTJ(@Param("typeId") long typeId, @Param("buName") String buName, @Param("offset") int offset, @Param("limit") int limit);

    /*查询数量*/
    public long getTotalCount(@Param("typeId") long typeId, @Param("buName") String buName);

    /*根据Id查询数量*/
    public long getCount(long buId);

    /*根据编号修改数量*/
    public void updnum(@Param("num") long num, @Param("buId") long buId);

    /*库存报警*/
    public List<Sales> selectBJ();

    /*根据编号查询数量*/
    public Sales getCounts(long buId);

    /*查询所有的数量*/
    public List<Sales> Count();

    /*统计商品名称*/

}
