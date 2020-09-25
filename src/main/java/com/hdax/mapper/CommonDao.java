package com.hdax.mapper;

import com.hdax.entity.Manager;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;

public interface CommonDao<T, PK extends Serializable> {


    Manager Find(@Param("mname") String name);
    /**
     * 查询全部数据
     * @return
     */


    /**
     * 查询全部数据条数
     * @return
     */
    int getCount();

    /**
     * select * from xxx limit offset,limit
     * @param offset 从第几条开始查询(从0开始)
     * @param limit 每页显示条数
     * @return
     */
    List<T> findByPage(@Param("offset") int offset, @Param("limit") int limit);



    /**
     * 多条件组合查询
     * @param condition 封装查询数据
     * @param offset 从第几条开始查询(从0开始)
     * @param limit 每页显示条数
     * @return
     */
    List<T> findByCondition(@Param("condition") T condition, @Param("offset") int offset, @Param("limit") int limit);

    /**
     * 多条件查询总条数
     * @param condition 封装查询数据
     * @return
     */
    int getCountByCondition(@Param("condition") T condition);

    /**
     * 根据主键查询单条信息
     * @param id
     * @return
     */
    T findById(@Param("id") PK id);

    /**
     * 新增数据
     * @param entity
     */
    void saveEntity(@Param("entity") T entity);

    /**
     * 修改数据
     * @param entity
     */
    void updateEntity(@Param("entity") T entity);

    /**
     * 根据主键删除信息
     * @param id
     */
    void deleteById(@Param("id") PK id);

    /**
     * 根据条件删除信息
     * @param condition 封装条件数据
     */
    void deleteByObject(@Param("condition") T condition);

}
