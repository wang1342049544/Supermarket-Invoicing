package com.hdax.controller;

import com.hdax.constant.Constants;
import com.hdax.entity.Manager;
import com.hdax.entity.ManagerRole;
import com.hdax.entity.Permission;
import com.hdax.mapper.ManagerMapper;
import com.hdax.mapper.ManagerRoleDao;
import com.hdax.mapper.PermissionDao;
import com.hdax.mapper.RolePermissionDao;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.*;

@Controller
@RequestMapping("/Mapper")
@Scope
public class ManagerInfoController {

    @Autowired
    ManagerMapper managerMapper; //用户信息
    @Autowired
    private ManagerRoleDao managerRoleDao;//用户职位
    //全查
    @RequestMapping("/managerlist")
    @ResponseBody
    public List<Manager> listquery(){
        return  managerMapper.Mquery();
    }

    //分页查询
    @RequestMapping("/TJquery")
    @ResponseBody
    public Map<String,Object> TJquery(String mname,int offset,int limit){
        //解决乱码
        try {
            if(mname!=null){
                mname = new String(mname.getBytes("ISO-8859-1"),"utf-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        Map<String,Object> map = new HashMap<>();
        map.put("rows",managerMapper.TJquery(mname,offset,limit));
        map.put("total",managerMapper.getTotalCount(mname));

        return map;
    }




    //添加
    //添加信息
    @RequestMapping(value = "addinfo" ,method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> InsertInfo(@RequestParam(value = "touxiang", required = false) MultipartFile[] multipartFile, HttpServletRequest request, String mname, String password, String phone, String address, String roleId) throws IOException {

        for (MultipartFile files : multipartFile) {
            //1.获取文件名字
            String originalFilename = files.getOriginalFilename();

            System.out.println("图片路径"+originalFilename);

            //2.图片的输入流名字
            try {
                InputStream inputStream = files.getInputStream();
                //3.存在于项目中的路径
                /*F:\C#作业\XiangMu\src\main\webapp\static\images*/
                String wlPath = "F:\\C#作业\\XiangMu\\src\\main\\webapp\\static\\images/" + originalFilename;
                //4.逻辑路径，存到数据库中
                String ljPath = "static/images/QQ图片20200527182305.jpg" + originalFilename;
                //5.临时路径
                String realPath = request.getSession().getServletContext().getRealPath("/");
                String lsPath = realPath + "//image//" + originalFilename;

                //6.如果没有那个文件夹就创建
                File wlFile = new File("F:\\C#作业\\XiangMu\\src\\main\\webapp\\static\\image");
                if (!wlFile.exists()) {
                    wlFile.mkdir();
                }
                File isFile = new File(realPath + "\\image\\");
                if (!isFile.exists()) {
                    isFile.mkdir();
                }
                //7.不为空时
                if (!files.isEmpty()) {
                    //输出流 写物理路径
                    FileOutputStream wlStream = new FileOutputStream(wlPath);
                    //输出流 写临时路径
                    FileOutputStream lsStream = new FileOutputStream(lsPath);
                    int len = 0;
                    while ((len = inputStream.read()) != -1) {
                        wlStream.write(len);//写入
                        lsStream.write(len);

                    }
                    wlStream.flush();
                    lsStream.flush();
                    wlStream.close();
                    lsStream.close();
                    inputStream.close();

                }
                System.out.println("存到文件夹位置："+wlPath);
                System.out.println("数据库字段："+ljPath);
                System.out.println("临时路径："+lsPath);

                //加密
            /*    String pwd = this.jiami(password);*/

/*        String pwd = String.valueOf(new Random().nextInt(1000000));*/

                Manager m = new Manager();
                m.setMname(mname);
                m.setPhoto(ljPath);
                m.setPhone(phone);
              /*  m.setPassword(pwd);*/
                m.setAddress(address);
                m.setRoleId(Integer.parseInt(roleId));


                managerMapper.InsertInfo(m);


                int ManId = managerMapper.MaxId();//获取最大的Id值


                ManagerRole managerRole = new ManagerRole();
                managerRole.setManagerId(ManId);
                managerRole.setRoleId(Integer.parseInt(roleId));

                managerRoleDao.InsertInfo(managerRole);

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Map<String,Object> map = new HashMap<>();
        map.put("rows",managerMapper.TJquery("",0,3));
        map.put("total",managerMapper.getTotalCount(""));

        return map;

    }






    //修改信息
    @RequestMapping("/updateInfo")
    @ResponseBody
    public Map<String,Object> updateInfo(Manager m, int pn){
        int i = managerMapper.updateInfo(m);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",managerMapper.TJquery("",(pn - 1) * 2,3));
        map.put("total",managerMapper.getTotalCount(""));

        return map;
    }

    /*删除信息*/
    @RequestMapping("/delInfo")
    @ResponseBody
    public Map<String,Object> delInfo(String ids,int pn){
        String[] ss = ids.split("-");
        Integer[] myids = new Integer[ss.length] ;
        for(int i=0;i<ss.length;i++){
            System.out.println(ss[i]);
            myids[i] = Integer.parseInt(ss[i]) ;
        }
        int i = managerMapper.delInfo(myids);

        int m = managerMapper.delInfo(myids);


        Map<String,Object> map = new HashMap<>();
        map.put("rows",managerMapper.TJquery("",(pn - 1) * 2,3));
        int limit = 0 ;
        long tcount = managerMapper.getTotalCount("") ;
        long pg = 0 ;
        if(tcount % 2 ==0){
            pg = tcount / 2 ;
        }
        else{
            pg = tcount / 2 +1 ;
        }

        if(pg==pn){
            limit = (pn-1) * 2 ;
        }
        else{
            limit =  (pn-2) * 2 ;
        }

        map.put("rows",managerMapper.TJquery("",limit,3));
        map.put("total",managerMapper.getTotalCount(""));

        return map;
    }


    /*条件查询*/
    @RequestMapping("/caiList")
    @ResponseBody
    public List<Manager> caiList(){
/*        Manager m =new Manager();
        m.setManagerId();
        m.setMname();
      m.setManagerId();*/
        int id = 2;

        return managerMapper.tjQuery(id);

    }


    //去登陆页面
   @RequestMapping("/doLogin")
    public String login() {
        return "login";
    }






    @RequestMapping("/Login")
    @ResponseBody
    public Map<String, String> index(@Param("mname") String mname,@Param("password") String password,HttpServletRequest request) {
        Map<String, String> map = new HashMap<String, String>();
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(mname, password);
        System.out.println("subject"+subject+":"+token);
        try {
            subject.login(token);
            map.put("code", "1");
            map.put("msg", "登录成功");
            return map;
        } catch (UnknownAccountException e) {
            map.put("code", "2");
            map.put("msg", Constants.LoginInfo.ERR_LOGIN_INVALID_USERNAME);
            return map;
        } catch (IncorrectCredentialsException e) {
            map.put("code", "3");
            map.put("msg", Constants.LoginInfo.ERR_LOGIN_INVALID_PASSWORD);
            return map;
        }
    }




}
