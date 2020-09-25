package com.hdax.controller;

import com.hdax.entity.Shoptype;
import com.hdax.entity.Store;
import com.hdax.mapper.ShoptypeDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * kct类型表
 */
@Controller
@RequestMapping("/ShopType")
@Scope

public class ShoptypeDaoController {

    @Autowired
    private ShoptypeDao shoptypeDao;

/*    @RequestMapping("/main")
    public String main(HttpServletRequest request){
        List<Shoptype> cate = shoptypeDao.queryATT();
        request.getSession().setAttribute("cate",cate);
        return "tb";
    }*/




    @RequestMapping("/listAll")
    @ResponseBody
    public List<Shoptype> listAll(){

        return shoptypeDao.queryAll();
    }

    //分页查询

    @RequestMapping("/TJquery")
    @ResponseBody
    public Map<String,Object> TJquery(String typeName, int offset, int limit){


        //解决乱码
        try {
            if(typeName!=null){
                typeName = new String(typeName.getBytes("ISO-8859-1"),"utf-8");

            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        Map<String,Object> map = new HashMap<>();
        map.put("rows",shoptypeDao.TJquery(typeName,offset,limit));
        map.put("total",shoptypeDao.getTotalCount(typeName));
        return map;
    }
    //添加信息
    @RequestMapping("/addinfo")
    @ResponseBody
    public Map<String,Object> addinfo(Shoptype s){

        shoptypeDao.addinfo(s);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",shoptypeDao.TJquery("",0,3));
        map.put("total",shoptypeDao.getTotalCount(""));
        return map;

    }

}
