package com.hdax.mapper;

import com.hdax.entity.Manager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ManagerMapper  extends CommonDao<Manager,Integer>  {

    //全查
    public List<Manager> Mquery();

    //总数量
    public long getTotalCount(@Param("mname") String mname);

    //分页条件查询
    public List<Manager> TJquery(@Param("mname") String mname, @Param("offset") int offset, @Param("limit") int limit);

    //添加信息
    public void InsertInfo(Manager m);

    //修改信息
    public int updateInfo(Manager m);

    //删除信息
    public int delInfo(Integer[] ids);
    //查询最大的Id值
    public int MaxId();

    /*条件查询*/
    public List<Manager> tjQuery(int roleId);


}
