package com.hdax.controller;

import com.hdax.entity.Xsbills;
import com.hdax.entity.customer;
import com.hdax.mapper.XsbillsDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/Xsbills")
@Scope

public class XsbillsDaoController {
    @Autowired
    private XsbillsDao xsbillsDao;

    @RequestMapping("/Insertlist")
    @ResponseBody
    public int Insertlist(String id,String danhao,long danType,String times,double money,long zjifen,long cz){

        Xsbills xsbills = new Xsbills();
        xsbills.setKhId(id);
        xsbills.setNumber(danhao);
        xsbills.setbType(danType);
        xsbills.setXsTime(times);
        xsbills.setMoney(money);
        xsbills.setJifen(zjifen);
        xsbills.setManagerId(cz);


        xsbillsDao.InsertInfo(xsbills);


        return 1;
    }


    /*分页查询0*/
    @RequestMapping("/selectFY")
    @ResponseBody
    public Map<String,Object> selectFY(String number, int offset,int limit){

        System.out.println("编号"+number);

        /*解决乱码*/
        try {
            if(number!=null){
                number = new String(number.getBytes("ISO-8859-1"),"utf-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        Map<String,Object> map = new HashMap<>();
        map.put("rows",xsbillsDao.selectTJ(number,offset,limit));
        map.put("total",xsbillsDao.getTotalCount(number));

        return map;
    }



    /*分页查询0*/
    @RequestMapping("/selectFYY")
    @ResponseBody
    public Map<String,Object> selectFYY(String number, int offset,int limit){


        /*解决乱码*/
        try {
            if(number!=null){
                number = new String(number.getBytes("ISO-8859-1"),"utf-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        Map<String,Object> map = new HashMap<>();
        map.put("rows",xsbillsDao.selectTJJ(number,offset,limit));
        map.put("total",xsbillsDao.getTotalCount(number));

        return map;
    }




    //修改信息  修改状态是1
    @RequestMapping("/updateInfo")
    @ResponseBody
    public Map<String,Object> updateInfo(Xsbills x){
        int i = xsbillsDao.updateInfo(x);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",xsbillsDao.selectTJJ("",0,5));
        map.put("total",xsbillsDao.getTotalCount(""));
        return map;
    }


    //修改信息  修改状态是2
    @RequestMapping("/updateInfo1")
    @ResponseBody
    public Map<String,Object> updateInfo1(Xsbills x){
        int i = xsbillsDao.updateInfo1(x);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",xsbillsDao.selectTJJ("",0,5));
        map.put("total",xsbillsDao.getTotalCount(""));
        return map;
    }

    //修改信息  修改状态是2
    @RequestMapping("/updateInfo2")
    @ResponseBody
    public Map<String,Object> updateInfo2(Xsbills x){
        int i = xsbillsDao.updateInfo2(x);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",xsbillsDao.selectTJJ("",0,5));
        map.put("total",xsbillsDao.getTotalCount(""));
        return map;
    }

    //修改信息  修改状态是4
    @RequestMapping("/updateInfo4")
    @ResponseBody
    public Map<String,Object> updateInfo4(Xsbills x){
        int i = xsbillsDao.updateInfo4(x);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",xsbillsDao.selectTJJ("",0,5));
        map.put("total",xsbillsDao.getTotalCount(""));
        return map;
    }



    //修改信息  修改状态是4
    @RequestMapping("/updateInfo5")
    @ResponseBody
    public Map<String,Object> updateInfo5(Xsbills x){
        int i = xsbillsDao.updateInfo5(x);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",xsbillsDao.selectTJJ("",0,5));
        map.put("total",xsbillsDao.getTotalCount(""));
        return map;
    }
}
