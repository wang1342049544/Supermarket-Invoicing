package com.hdax.mapper;


import com.hdax.entity.ManagerRole;

public interface ManagerRoleDao {

        public ManagerRole getRoleByManagerId(Integer managerId);

    public int InsertInfo(ManagerRole managerRole);

    /*删除*/
    public int delInfo(Integer[] ids);

}
