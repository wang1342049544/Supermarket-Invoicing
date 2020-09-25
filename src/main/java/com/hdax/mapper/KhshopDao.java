package com.hdax.mapper;

import com.hdax.entity.Khshop;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KhshopDao {

    /*查询总数量*/
    public long getTotalCountS();
    /*分页查询*/
    public List<Khshop> queryTJ(@Param("offset") int offset, @Param("limit") int limit);
    /*添加信息*/
    public void InsertInfo(Khshop kh);
    /*根据商品编号查询是否有相同的*/
    public String selectXT(@Param("buId") long buId, @Param("dh") long dh);

    /*根据商品编号修改数量*/
    public void updlist(@Param("num") long num, @Param("money") double money, @Param("buId") long buId, @Param("dh") long dh);

    /*根据商品编号修改数量总积分*/
    public void updlists(@Param("num") long num, @Param("zjifen") long zjifen, @Param("buId") long buId, @Param("dh") long dh);

    /*根据商品编号和兑换Id查询商品信息*/
    public List<Khshop> queryInfo(@Param("buId") long buId, @Param("dh") long dh);

    /*根据编号是删除商品*/
    public void delInfo(long buId);
}
