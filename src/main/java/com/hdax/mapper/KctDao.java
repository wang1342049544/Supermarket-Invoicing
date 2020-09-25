package com.hdax.mapper;

import com.hdax.entity.Kct;

import com.hdax.entity.Xsdetails;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KctDao {

    /*查询*/
    public List<Kct> queryAll();

    //总数量
    public long getTotalCount(@Param("sName") String sName);

    /*分页查询*/
    public List<Kct> TJquery(@Param("sName") String sName, @Param("offset") int offset, @Param("limit") int limit);
    /*库存预警*/
    public List<Kct> query(@Param("sName") String sName, @Param("offset") int offset, @Param("limit") int limit);

    /*销售gu过期预警*/
    public List<Kct> queryy(@Param("sName") String sName, @Param("offset") int offset, @Param("limit") int limit);


    /*销售快过期预警*/
    public List<Kct> queryyy(@Param("sName") String sName, @Param("offset") int offset, @Param("limit") int limit);

    /*查询库存有没有相同的商品*/
    public Kct XTSelect(@Param("kcId") int kcId, @Param("supplierId") long supplierId, @Param("storeId") long storeId, @Param("typeId") long typeId);

    /*根据Id修改值*/
    public void updateNum(@Param("nums") long nums, @Param("kcId") long kcId, @Param("supplierId") long supplierId, @Param("storeId") long storeId, @Param("typeId") long typeId);


    /*进货叠加数量*/
    public  void  updateInfo(Kct k);


    /*添加信息*/
    public void InsertInfo(Kct kct);

    /*很久商品Id查询数量*/
    public List<Kct> getCount(long kcId);

    /*根据Id修改数量*/
    public void xiuNum(@Param("nums") long nums, @Param("kcId") long kcId);

    /*   库存数量*/
    public List<Kct> zxx();




    Boolean jianK(@Param("KCId")long KCId, @Param("num") long num);
    Boolean jiaK(@Param("KCId")long KCId, @Param("num") long num);




}
