package com.hdax.mapper;



import com.hdax.entity.Permission;
import com.hdax.pojo.PermissionBean;

import java.util.List;

public interface PermissionDao {


    public List<PermissionBean> query();

    public List<PermissionBean> queryId(long parentid);

    public List<Permission> queryByPermissionIds(List<Long> ids);
    ;

}
