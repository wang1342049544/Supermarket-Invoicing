package com.hdax.controller;

import com.hdax.entity.Permission;
import com.hdax.entity.Role;
import com.hdax.mapper.PermissionDao;
import com.hdax.mapper.RoleDao;
import com.hdax.mapper.RolePermissionDao;
import com.hdax.pojo.PermissionBean;
import com.hdax.pojo.StateBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 权限分配的显示
 */
@Controller
@RequestMapping("/Role")
@Scope
public class RoleDaoController {

    @Autowired
    private RoleDao roleDao;
    @Autowired
    private PermissionDao permissionDao;
    @Autowired
    private RolePermissionDao rolePermissionDao;

    /*查询全部*/
    @RequestMapping("/Rolelist")
    @ResponseBody
    public List<Role> queryAll(){

        List<Role> list = roleDao.queryAll();

        return list;

    }

    /*添加职位*/
    @RequestMapping("/InsertList")
    @ResponseBody
    public List<Role> InsertList(Role r){

        roleDao.InsertInfo(r);

        return roleDao.queryAll();

    }


    /*删除信息*/

    @RequestMapping("/delList")
    @ResponseBody
    public List<Role> delList(String ids){

        String[] ss = ids.split("-");
        Integer[] myids = new Integer[ss.length] ;
        for(int i=0;i<ss.length;i++){
            System.out.println(ss[i]);
            myids[i] = Integer.parseInt(ss[i]) ;
        }
       roleDao.delInfo(myids);

        return roleDao.queryAll();
    }


    /*修改信息*/
    @RequestMapping("/updateList")
    @ResponseBody
    public List<Role> updateList(Role r){

        roleDao.updateInfo(r);

        return roleDao.queryAll();
    }

    /*分配权限*/

    @RequestMapping("/doFenPei")
    @ResponseBody
    public List<PermissionBean> doFenPei(int roleid){


        //得到当前角色的所有权限
        List<Permission> listAll = rolePermissionDao.queryByRoleId(roleid);

        //获取根节点
        List<PermissionBean> list = permissionDao.query();
        for (PermissionBean perm : list){
            int id = perm.getId();
            //查询子节点
            List<PermissionBean> list1 = permissionDao.queryId(id);
            perm.setNodes(list1);
        }
        System.out.println("lsit "+list);

       //回显当前角色拥有的所有权限
      for (PermissionBean per : list){
            StateBean stateBean = new StateBean();
            for (Permission permission : listAll){
                if(per.getId() == permission.getPermissionId()){
                    stateBean.setChecked(false);
                }

            }
            per.setState(stateBean);

            //所有子节点
            List<PermissionBean> listSon = per.getNodes();

            for (PermissionBean permission1 : listSon){
                StateBean stateBean1 = new StateBean();

                for (Permission permission11 : listAll){
                    if (permission1.getId() == permission11.getPermissionId()){
                        stateBean.setChecked(true);
                        stateBean1.setChecked(true);
                    }
                }
                permission1.setState(stateBean1);
            }

        }


        return list;
    }


}
