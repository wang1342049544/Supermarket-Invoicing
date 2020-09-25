package com.hdax.controller;

import com.hdax.mapper.RolePermissionDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/RolePermission")
@Scope

/**
 * 分配权限9
 */
public class RolePermissionDaoController {

    @Autowired
    private RolePermissionDao rolePermissionDao;


    @RequestMapping("/grantPermission")
    @ResponseBody
    public Map<String,Object> grantPermission(int roleid,String pmid){

        Map<String,Object> map =  new HashMap<>();

        try {
            String[] ss = pmid.split("-");//剪切“-”

            int[] perids = new int[ss.length-1];

            for (int i = 0;i < perids.length;i++){
                perids[i] = Integer.parseInt(ss[i+1]);
            }
            //删除角色对应的权限
            rolePermissionDao.del(roleid);

            //添加用户选择的权限
            for (int permissionId : perids){
                rolePermissionDao.save(roleid,permissionId);
            }
            map.put("msg","1");
        } catch (NumberFormatException e) {
            map.put("msg","2");
            e.printStackTrace();
        }



        return map;

    }

}
