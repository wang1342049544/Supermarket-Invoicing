package com.hdax.controller;
import com.hdax.constant.Constants;
import com.hdax.entity.Manager;
import com.hdax.entity.ManagerRole;
import com.hdax.entity.Permission;
import com.hdax.mapper.ManagerMapper;
import com.hdax.mapper.ManagerRoleDao;
import com.hdax.mapper.PermissionDao;
import com.hdax.mapper.RolePermissionDao;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@Scope
public class HomeController {
    //登录成功跳转首页

    @Autowired
    ManagerMapper managerMapper; //用户信息
    @Autowired
    private ManagerRoleDao managerRoleDao;//用户职位
    @Autowired
    private RolePermissionDao rolePermissionDao;//权限关系
    @Autowired
    private PermissionDao permissionDao;//权限




    @RequestMapping("/main")
    public String  index(String mname,String password,HttpServletRequest request){
        Subject subject = SecurityUtils.getSubject();
        Manager manager = (Manager) subject.getPrincipal();
        //登录用户存session
        request.getSession().setAttribute(Constants.LoginInfo.LOGIN_USER,manager);
        //1.得到登录的用户

     ManagerRole managerRole =  managerRoleDao.getRoleByManagerId((int) manager.getManagerId());
        //当前角色
       List<Long> list = rolePermissionDao.getPermissionByRoleId(managerRole.getRoleId());
        List<Permission> list1 = permissionDao.queryByPermissionIds(list);
        //存放父节点
        List<Permission> list2 = new ArrayList<>();
        for (Permission permission : list1){

            if(permission.getParentid() == 0){
                list2.add(permission);
            }
        }
        System.out.println("list1 "+list1);
        System.out.println("list2 "+list2);
      request.getSession().setAttribute("listall",list1);
        request.getSession().setAttribute("listfu",list2);


        return "index";
    }





}
