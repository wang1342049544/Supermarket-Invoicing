package com.hdax.controller;


import com.hdax.entity.Sales;
import com.hdax.mapper.SalesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*import dao.XsbjDao;*/
/*import entity.Xsbj;*/

@Controller
@RequestMapping("/Sales")
@Scope

public class SalesDaoController {

    @Autowired
    private SalesDao salesDao;
  /*  @Autowired
    private XsbjDao xsbjDao;*/

    /*条件查询*/
    @RequestMapping("/queryTJ")
    @ResponseBody
    public Map<String,Object> queryTJ(long typeId,String buName,int offset,int limit){
        System.out.println(typeId);
        //解决乱码
        try {
            if(buName!=null){
                buName = new String(buName.getBytes("ISO-8859-1"),"utf-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        System.out.println(buName);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",salesDao.queryTJ(typeId,buName,offset,limit));
        map.put("total",salesDao.getTotalCount(typeId,buName));
        return map;

    }

 /*   *//*报警查询*//*
    @RequestMapping("/queryBJ")
    @ResponseBody
    public int queryBJ(){


        List<Sales> list = salesDao.selectBJ();

        long buId = 0;
        String buName = "";
        String danWei = "";
        double price = 0.0;
        long typeId = 0;
        String yileId = "";
        String pledge = "";
        String expiration = "";
        long jifen = 0;

        int xing = 0;

        System.out.println("-------------"+list);

        if(list != null){

            for (Sales s:list){

                buId = s.getBuId();
                buName = s.getBuName();
                danWei = s.getDanWei();
                price = s.getPrice();
                typeId = s.getTypeId();
                yileId = s.getYileld();
                pledge = s.getPledge();
                expiration = s.getExpiration();
                jifen = s.getJifen();

                Xsbj x =  xsbjDao.selectXT(buId);
                System.out.println("-------"+x);
                if(x == null){
                    System.out.println("---------------");
                    Xsbj xe = new Xsbj();
                    xe.setBuId(buId);
                    xe.setBuName(buName);
                    xe.setDanWei(danWei);
                    xe.setPrice(price);
                    xe.setTypeId(typeId);
                    xe.setYileId(yileId);
                    xe.setPledge(pledge);
                    xe.setExpiration(expiration);
                    xe.setJifen(jifen);
                    xsbjDao.InsertInfo(xe);
                    xing = 1;
                }else {

                }

            }

        }else {
            xing = 2;
        }




        return xing;

    }*/


   //*查询数量*//
    @RequestMapping("/getCount")
    @ResponseBody
    public void getCount(){

        List<Sales> list =  salesDao.Count();

        for (Sales s:list){

            System.out.println("查询数量"+s.getNum());

            int num = 50;

            if(s.getNum() > num){

                System.out.println("他们的Id"+s.getBuId());

           /*         xsbjDao.delInfo(s.getBuId());*/

            }

        }

    }

}
