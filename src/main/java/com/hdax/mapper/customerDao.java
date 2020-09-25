package com.hdax.mapper;

import com.hdax.entity.customer;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface customerDao {
    //全查
    public List<customer> Mquery();

    //总数量
    public long getTotalCount(@Param("cName") String mname);

    //分页条件查询
    public List<customer> TJquery(@Param("cName") String mname, @Param("offset") int offset, @Param("limit") int limit);

    //添加信息
    public void addinfo(customer c);

    //修改信息
    public int updateInfo(customer c);

    //删除信息
    public int delInfo(Integer[] ids);

    /*查询积分*/
    public int selectJifen(int id);

    /*根据编号修改积分*/
    public void updJi(@Param("jifen") long jifen, @Param("id") int id);



}
