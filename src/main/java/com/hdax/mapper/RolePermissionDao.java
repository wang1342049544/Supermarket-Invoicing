package com.hdax.mapper;


import com.hdax.entity.Permission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RolePermissionDao {
    //根据roleid 删除
    public void del(int roleId);
    //保存
    public void save(@Param("roleId") long roleId, @Param("permissionId") long permissionId);
    //根据roleId查询
    public List<Permission> queryByRoleId(long roleId);
    //
    public List<Long> getPermissionByRoleId(long roleid);


}
