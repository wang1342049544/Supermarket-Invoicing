package com.hdax.controller;


import com.hdax.entity.Gshop;
import com.hdax.mapper.GshopDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/Gshop")
@Scope
public class GshopDaoController {

    @Autowired
    private GshopDao gshopDao;


    @RequestMapping("/queryTJ")
    @ResponseBody

    public Map<String,Object> queryTJ(int supplierId, int offset, int limit){



        System.out.println("--------"+supplierId);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",gshopDao.queryTJ(supplierId,offset,limit));
        map.put("total",gshopDao.getTotalCount(supplierId));
        return map;
    }

    /*添加信息*/
    @RequestMapping("/InsertList")
    @ResponseBody

    public void InsertList(int gshopId,String gshopName,String danWei,String price,int supplierId,int typeId,String yileld,String pledge,String expiration ){


        System.out.println(gshopId + "--" + gshopName);

        Gshop gshop = new Gshop();
        gshop.setGShopId(gshopId);
        gshop.setGShopName(gshopName);
        gshop.setDanWei(danWei);
        gshop.setPrice(Double.parseDouble(price));
        gshop.setSupplierId(supplierId);
        gshop.setTypeId(typeId);
        gshop.setYileld(yileld);
        gshop.setPledge(pledge);
        gshop.setExpiration(expiration);

        gshopDao.InsertInfo(gshop);


    }

    /*查询最大的Id值*/
    @RequestMapping("/zuida")
    @ResponseBody
    public long zuida(){

       long i = gshopDao.MAXID();

        System.out.println("最大值"+i);

       return i;
    }


}
