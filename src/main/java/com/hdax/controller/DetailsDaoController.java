package com.hdax.controller;

import com.hdax.entity.Details;
import com.hdax.mapper.DetailsDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/Details")
@Scope

public class DetailsDaoController {
    @Autowired
    private DetailsDao detailsDao;


    /*全表添加*/
    @RequestMapping("/InserList")
    @ResponseBody
    public int InsertList(String ids){

        String[] ss1 = ids.split(",");

        Details detail = new Details();



        String number = "";
        String buId = "";
        String buName = "";
        String danwei = "";
        String price = "";
        String nums = "";
        String money = "";
        String supplierId = "";
        String yileld = "";
        String pledge = "";
        String expiration = "";
        String typeId = "";
        String storeId = "";

        System.out.println("外层循环"+ss1.length);

        for(int i=0;i<ss1.length;i++){

            String[] ss = ss1[i].split("/");

            System.out.println("内层循环"+ss.length);

            for(int j=0;j<ss.length;j++){

                System.out.println(ss[0]);
                System.out.println(ss[1]);
                System.out.println(ss[2]);
                System.out.println(ss[3]);
                System.out.println(ss[4]);
                System.out.println(ss[5]);
                System.out.println(ss[6]);
                System.out.println(ss[7]);
                System.out.println(ss[8]);
                System.out.println(ss[9]);
                System.out.println(ss[10]);
                System.out.println(ss[11]);
                System.out.println(ss[12]);

                number = ss[0];
                buId = ss[1];
                buName = ss[2];
                danwei = ss[3];
                price = ss[4];
                nums = ss[5];
                money = ss[6];

                yileld = ss[7];
                pledge = ss[8];
                expiration = ss[9];
                supplierId = ss[10];
                typeId = ss[11];

                storeId = ss[12];
            }
            detail.setNumber(number);
            detail.setBuId(buId);
            detail.setBuName(buName);
            detail.setDanWei(danwei);
            detail.setPrice(Double.parseDouble(price));
            detail.setNums(Integer.parseInt(nums));
            detail.setMoney(Double.parseDouble(money));
            detail.setSupplierId(Integer.parseInt(supplierId));
            detail.setYileld(yileld);
            detail.setPledge(pledge);
            detail.setExpiration(expiration);
            detail.setTypeId(Integer.parseInt(typeId));
            detail.setStoreId(Integer.parseInt(storeId));

            detailsDao.InsertInfo(detail);


        }


        return 1;
    }

    @RequestMapping("/queryList")
    @ResponseBody
    public List<Details> queryList(String number){

        return detailsDao.queryAll(number);

    }



    /*删除信息*/
    @RequestMapping("/delInfo")
    @ResponseBody
    public List<Details> delInfo(String ids){
        String[] ss = ids.split("-");
        String number = "";

        for(int i=0;i<ss.length;i++){
            detailsDao.delInfo(ss[i]);
            number = ss[i];
        }
        System.out.println("--------"+number);

        return queryList(number);
    }


}
