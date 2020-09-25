package com.hdax.controller;


import com.hdax.entity.Supplier;
import com.hdax.mapper.SupplierDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/Supplier")
@Controller
@Scope
public class SupplierDaoController {

    @Autowired
    private SupplierDao supplierDao;

    /*查询*/

    @RequestMapping("/queryList")
    @ResponseBody
    public List<Supplier> queryList(){
         return  supplierDao.query();
    }

    /*分页查询*/
    @RequestMapping("/TJquery")
    @ResponseBody
    public Map<String,Object> TJquery(String supName,int offset,int limit){

        //处理乱码
        try {
            if(supName!=null){
                supName = new String(supName.getBytes("ISO-8859-1"),"utf-8");

            }
        }catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        Map<String,Object> map = new HashMap<>();
        map.put("rows",supplierDao.TJquery(supName,offset,limit));
        map.put("total",supplierDao.getTotalCount(supName));

        return map;

    }


    /*添加*/
    @RequestMapping("/InsertInfo")
    @ResponseBody
    public Map<String,Object> InsertInfo(Supplier supplier){

        supplierDao.insertInfo(supplier);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",supplierDao.TJquery("",0,3));
        map.put("total",supplierDao.getTotalCount(""));


        return map;

    }

    /*修改*/

    @RequestMapping("/updateInfo")
    @ResponseBody
    public Map<String,Object> updateInfo(Supplier supplier){

        supplierDao.updateInfo(supplier);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",supplierDao.TJquery("",0,3));
        map.put("total",supplierDao.getTotalCount(""));

        return map;

    }

    /*删除*/

    @RequestMapping("/delInfo")
    @ResponseBody
    public Map<String,Object> delInfo(String ids,int pn){
        String[] ss = ids.split("-");
        Integer[] myids = new Integer[ss.length] ;
        for(int i=0;i<ss.length;i++){
            System.out.println(ss[i]);
            myids[i] = Integer.parseInt(ss[i]) ;
        }
        int i = supplierDao.delInfo(myids);


        Map<String,Object> map = new HashMap<>();
        int limit = 0 ;
        long tcount = supplierDao.getTotalCount("") ;
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

        map.put("rows",supplierDao.TJquery("",limit,3));
        map.put("total",supplierDao.getTotalCount(""));

        return map;
    }

}
