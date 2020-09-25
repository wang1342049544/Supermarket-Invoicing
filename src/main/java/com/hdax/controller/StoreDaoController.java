package com.hdax.controller;

import com.hdax.entity.Store;
import com.hdax.mapper.StoreDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping(path ="/Store")
@Scope


public class StoreDaoController {

    @Autowired
    private StoreDao storeDao;





    @RequestMapping("/Storelist")
    @ResponseBody
    public List<Store> queryAll(){

        List<Store> list = storeDao.query();

        return list;

    }

    //分页查询

    @RequestMapping("/TJquery")
    @ResponseBody
    public Map<String,Object> TJquery(String storeName, int offset, int limit){


        //解决乱码
        try {
            if(storeName!=null){
                storeName = new String(storeName.getBytes("ISO-8859-1"),"utf-8");

            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        Map<String,Object> map = new HashMap<>();
        map.put("rows",storeDao.TJquery(storeName,offset,limit));
        map.put("total",storeDao.getTotalCount(storeName));
        return map;
    }



    //分页查询

    @RequestMapping("/TT")
    @ResponseBody
    public Map<String,Object> TT(long storeId){
        Map<String,Object> map = new HashMap<>();
        map.put("rows",storeDao.TT(storeId));
        return map;
    }





    //添加信息
    @RequestMapping("/addinfo")
    @ResponseBody
    public Map<String,Object> addinfo(Store s){

        storeDao.addinfo(s);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",storeDao.TJquery("",0,3));
        map.put("total",storeDao.getTotalCount(""));
        return map;

    }


    //修改信息
    @RequestMapping("/updateInfo")
    @ResponseBody
    public Map<String,Object> updateInfo(Store s){
        int i = storeDao.updateInfo(s);

        Map<String,Object> map = new HashMap<>();
     /*   map.put("rows",StoreDao.TJquery("",(pn - 1) * 2,2));
        map.put("total",StoreDao.getTotalCount(""));*/
        map.put("rows",storeDao.query());
        return map;
    }

    /*删除信息*/

/*    @RequestMapping("/delInfo")
    @ResponseBody
    public Map<String,Object> delInfo(String ids,int pn){
        String[] ss = ids.split("-");
        Integer[] myids = new Integer[ss.length] ;
        for(int i=0;i<ss.length;i++){
            System.out.println(ss[i]);
            myids[i] = Integer.parseInt(ss[i]) ;
        }
        int i = storeDao.delInfo(myids);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",storeDao.TJquery("",(pn - 1) * 2,2));
        map.put("total",storeDao.getTotalCount(""));

        return map;
    }*/



    @RequestMapping("/delInfo")
    @ResponseBody
    /*删除信息*/
    public Map<String,Object> delInfo(int id){

        storeDao.delInfo(id);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",storeDao.TJquery("",0,3));
        map.put("total",storeDao.getTotalCount(""));
        return map;
    }

}
