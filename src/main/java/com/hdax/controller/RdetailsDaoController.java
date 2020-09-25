package com.hdax.controller;

import com.hdax.entity.Details;
import com.hdax.entity.Kct;
import com.hdax.entity.Rdetails;
import com.hdax.mapper.DetailsDao;
import com.hdax.mapper.KctDao;
import com.hdax.mapper.RdetailsDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/Rdetails")
@Scope

public class RdetailsDaoController {
    @Autowired
    private RdetailsDao rdetailsDao;
    @Autowired
    private DetailsDao detailsDao;
    @Autowired
    private KctDao kctDao;

    @RequestMapping("/dellist")
    @ResponseBody
    public void dellist(String number){
        rdetailsDao.delInfo(number);

    }

    /*查询信息*/
    @RequestMapping("/queryList")
    @ResponseBody
    public List<Rdetails> queryList(String number){

        return rdetailsDao.queryAll(number);

    }

    /*查询信息*/
    @RequestMapping("/queryLists")
    @ResponseBody
    public int queryLists(String number){

        System.out.println(number);

        List<Details> list = detailsDao.queryAll(number);

        String numbers = "";
        String buId = "";
        String buName = "";
        String danwei = "";
        double price = 0.0;
        long ynums = 0;
        long snums = 0;
        double money = 0.0;
        long supplierId = 0;
        String yileld = "";
        String pledge = "";
        String expiration = "";
        long typeId = 0;
        long storeId = 0;

        for (Details r : list){

            number = r.getNumber();
            buId = r.getBuId();
            buName = r.getBuName();
            danwei = r.getDanWei();
            price = r.getPrice();
            ynums = r.getNums();
            snums = r.getNums();
            money = r.getMoney();
            supplierId = r.getSupplierId();
            yileld = r.getYileld();
            pledge = r.getPledge();
            expiration = r.getExpiration();
            typeId = r.getTypeId();
            storeId = r.getStoreId();


            System.out.println("第一审核"+number + "--" + buId + "--" + buName + "--" + danwei + "--" + price + "--" +
                    ynums + "--" + money + "--" + supplierId + "--" + yileld + "--" + pledge + "--" + expiration + "--" + typeId + "--" +
                    storeId);

            Kct ks = new Kct();

           //售价
            double shoujia = price + (price * 0.30);
            System.out.println("进价"+price);
            System.out.println("售价"+shoujia);
            //缺货状态
            int queState = 0;
            //最低标准
            int zuid = 200;
            //积分
            int jifen = (int)price;

           ks.setKcId(Integer.parseInt(buId));
           ks.setsName(buName);
           ks.setDanWei(danwei);
           ks.setNums(snums);
           ks.setSprice(price);
           ks.setJprice(shoujia);
           ks.setSupplierId(supplierId);
           ks.setStoreId(storeId);
           ks.setTypeId(typeId);
           ks.setYileld(yileld);
           ks.setPledge(pledge);
           ks.setExpiration(expiration);
           ks.setQueState(queState);
           ks.setZuiD(zuid);
           ks.setJifen(jifen);

            System.out.println("KCID"+Integer.parseInt(buId) + "s" + supplierId+"e"+storeId+"r"+typeId);
            int kcId = Integer.parseInt(buId);
            System.out.println("KCID  "+kcId);
            //判断是否存在
            Kct k = kctDao.XTSelect(kcId,supplierId,storeId,typeId);


            if(k != null){
                long sum = k.getNums() + snums;
                System.out.println("总数量"+sum);
                System.out.println("有");
                kctDao.updateNum(sum,kcId,supplierId,storeId,typeId);
            }else {
                System.out.println("没有");
                kctDao.InsertInfo(ks);

            }






        }


        return 1;

    }


}
