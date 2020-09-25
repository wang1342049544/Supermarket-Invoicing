package com.hdax.controller;

import com.hdax.entity.Khshop;
import com.hdax.entity.Xsdetails;
import com.hdax.mapper.KhshopDao;
import com.hdax.mapper.XsdetailsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Khshop")
@Scope

public class KhshopDaoController {
    @Autowired
    private KhshopDao khshopDao;

    @Autowired
    private XsdetailsDao xsdetailsDao;//销售详情

    @RequestMapping("/queryTJ")
    @ResponseBody
    public Map<String,Object> queryTJ(int offset,int limit){
        Map<String,Object> map = new HashMap<>();
        map.put("rows",khshopDao.queryTJ(offset,limit));
        map.put("total",khshopDao.getTotalCountS());
        return map;
    }

    /*添加信息*/
    @RequestMapping("/Insertlist")
    @ResponseBody
    public Map<String,Object> Insertlist(Khshop khshop){

        khshopDao.InsertInfo(khshop);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",khshopDao.queryTJ(0,6));
        map.put("total",khshopDao.getTotalCountS());
        return map;
    }

    /*查询是否有相同的*/
    @RequestMapping("/SelectTG")
    @ResponseBody
    public String SelectTG(long buId,long dh){

        String num = khshopDao.selectXT(buId,dh);

        return num;
    }

    /*修改相同商品的数量*/
    @RequestMapping("/updlist")
    @ResponseBody
    public Map<String,Object> updlist(long sum,double money,long buId,long dh){


        khshopDao.updlist(sum,money,buId,dh);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",khshopDao.queryTJ(0,6));
        map.put("total",khshopDao.getTotalCountS());
        return map;

    }

    /*总积分*/
    @RequestMapping("/updlists")
    @ResponseBody
    public Map<String,Object> updlists(long sum,long zjifen,long buId,long dh){


        khshopDao.updlists(sum,zjifen,buId,dh);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",khshopDao.queryTJ(0,6));
        map.put("total",khshopDao.getTotalCountS());
        return map;

    }


    /*根据商品编号和兑换Id查询信息*/
    @RequestMapping("/selectTH")
    @ResponseBody
    public int selectTH(String sids){

        String[] ss1 = sids.split(",");

        String buId = "";
        String dh = "";
        String danhao = "";

        for(int i=0;i<ss1.length;i++){

            String[] ss = ss1[i].split("-");

            buId = ss[0];
            dh = ss[1];
            danhao = ss[2];

            List<Khshop> list = khshopDao.queryInfo(Integer.parseInt(buId),Integer.parseInt(dh));

            for (Khshop k : list){

                Xsdetails x = new Xsdetails();
                x.setNumber(danhao);
                x.setBuId(k.getBuId());
                x.setShopName(k.getBuName());
                x.setDanWei(k.getDanWei());
                x.setPrice(k.getPrice());
                x.setNum(k.getNum());
                x.setMoney(k.getMoney());
                x.setDh(k.getDh());
                x.setZjifen(k.getZjifen());

                xsdetailsDao.InsertInfo(x);

            }

        }
        return 1;
    }



    /*删除信息*/
    @RequestMapping("/delInfo")
    @ResponseBody
    public void delInfo(String ides) {
        String[] ss = ides.split("-");
        Integer[] myids = new Integer[ss.length];
        for (int i = 0; i < ss.length; i++) {
            khshopDao.delInfo(Integer.parseInt(ss[i]));
        }
    }










}

