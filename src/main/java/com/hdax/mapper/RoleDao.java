package com.hdax.mapper;

import com.hdax.entity.Role;


import java.util.List;

public interface RoleDao  {

    //全查
    public List<Role> queryAll();

    //添加
    public void InsertInfo(Role r);

    //删除信息
    public int delInfo(Integer[] ids);

    /*修改信息*/
    public int updateInfo(Role r);

    public Role getRoleByUserId(long roleId);


}
