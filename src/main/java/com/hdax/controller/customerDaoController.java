package com.hdax.controller;

import com.hdax.entity.customer;
import com.hdax.mapper.customerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/customer")
@Scope
public class customerDaoController {
    @Autowired
    private customerDao customerDao;

    //全查
    @RequestMapping("/listquery")
    @ResponseBody
    public List<customer> listquery(){
        return  customerDao.Mquery();
    }

    //分页查询

    @RequestMapping("/TJquery")
    @ResponseBody
    public Map<String,Object> TJquery(String cName, int offset, int limit){

        //解决乱码

        try {
            if(cName!=null){
                cName = new String(cName.getBytes("ISO-8859-1"),"utf-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        Map<String,Object> map = new HashMap<>();
        map.put("rows",customerDao.TJquery(cName,offset,limit));
        map.put("total",customerDao.getTotalCount(cName));
        return map;
    }

    //添加信息
    @RequestMapping(value = "addinfo" ,method = RequestMethod.POST)
    @ResponseBody
  public Map<String,Object> addinfo(customer c){

        customerDao.addinfo(c);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",customerDao.TJquery("",0,5));
        map.put("total",customerDao.getTotalCount(""));
        return map;

    }


    //修改信息
    @RequestMapping("/updateInfo")
    @ResponseBody
    public Map<String,Object> updateInfo(customer c,int pn){
        int i = customerDao.updateInfo(c);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",customerDao.TJquery("",0,5));
        map.put("total",customerDao.getTotalCount(""));

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
        int i = customerDao.delInfo(myids);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",customerDao.TJquery("",(pn - 1) * 2,2));
        map.put("total",customerDao.getTotalCount(""));

        return map;
    }

    /*查询积分*/
    @RequestMapping("/jifen")
    @ResponseBody
    public int jifen(int id){

        int jifen = customerDao.selectJifen(id);
        return jifen;
    }

    /*修改积分*/
    @RequestMapping("/xiulist")
    @ResponseBody
    public int xiulist(long ji,int id){

        customerDao.updJi(ji,id);

        return 1;

    }
}
