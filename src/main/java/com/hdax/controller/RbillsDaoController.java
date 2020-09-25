package com.hdax.controller;

/*import com.sun.imageio.plugins.common.I18N;*/
import com.hdax.entity.Details;
import com.hdax.entity.Rbills;
import com.hdax.entity.Rdetails;
import com.hdax.mapper.DetailsDao;
import com.hdax.mapper.RbillsDao;
import com.hdax.mapper.RdetailsDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/rbills")
@Scope

public class RbillsDaoController {

    @Autowired
    private RbillsDao rbillsDao;
    @Autowired
    private DetailsDao detailsDao;//单据详情
    @Autowired
    private RdetailsDao rdetailsDao;

    /*从进货审核传过来*/
    @RequestMapping("/InserList")
    @ResponseBody
    public int InsertList(String ids){

        String[] ss = ids.split("/");

        String number = "";
        String typeId = "";
        String danTime = "";
        String storeId = "";
        String yingF = "";
        String shiF = "";
        String managerId = "";
        String managerIds = "";
        String stateId = "";
        String remake = "";

        for(int i=0;i<ss.length;i++){
            number = ss[0];
            typeId = ss[1];
            danTime = ss[2];
            storeId = ss[3];
            yingF = ss[4];
            shiF= ss[5];
            managerId = ss[6];
            managerIds = ss[7];
            stateId = ss[8];
            remake = ss[9];
        }

        System.out.println(number + "--" + typeId + "--" + danTime + "--" + storeId + "--" + yingF + "--" + shiF + "--" + managerId
                + "--" + managerIds + "--" + stateId + "--"
        );

        Rbills rbills = new Rbills();
        rbills.setNumber(number);
        rbills.setTypeId(Integer.parseInt(typeId));
        rbills.setDanTime(danTime);
        rbills.setStoreId(Integer.parseInt(storeId));
        rbills.setYingF(Double.parseDouble(yingF));
        rbills.setShiF(Double.parseDouble(shiF));
        rbills.setManagerId(Integer.parseInt(managerId));
        rbills.setCzy(Integer.parseInt(managerIds));
        rbills.setStateId(Integer.parseInt(stateId));
        rbills.setRemake(remake);

        rbillsDao.InsertInfo(rbills);

        List<Details> list = detailsDao.queryAll(number);

        String buid = "";
        String buName = "";
        String danWei = "";
        double price =0.0;
        long nums = 0;
        double money = 0.0;
        long supplierId = 0;
        String yileld = "";
        String pledge = "";
        String expiration = "";
        long typeIds = 0;
        long storeIds = 0;

        for (Details d : list){

            System.out.println("list技能"+list.size());


            buid = d.getBuId();
            buName = d.getBuName();
            danWei = d.getDanWei();
            expiration = d.getExpiration();
            money = d.getMoney();
            number = d.getNumber();
            nums = d.getNums();
            pledge = d.getPledge();
            price = d.getPrice();
            storeIds = d.getStoreId();
            supplierId = d.getSupplierId();
            typeIds = d.getTypeId();
            yileld = d.getYileld();

                //添加入库信息表
                Rdetails rdetails = new Rdetails();
                rdetails.setBuId(buid);
                rdetails.setBuName(buName);
                rdetails.setDanWei(danWei);
                rdetails.setExpiration(expiration);
                rdetails.setMoney(money);
                rdetails.setNumber(number);
                rdetails.setSnums(nums);
                rdetails.setYnums(nums);
                rdetails.setPrice(price);
                rdetails.setStoreId(storeIds);
                rdetails.setSupplierId(supplierId);
                rdetails.setTypeId(typeIds);
                rdetails.setYileld(yileld);
                rdetails.setPledge(pledge);

                rdetailsDao.InsertInfo(rdetails);
            }

        return 1;
    }


    /*未审核分页查询*/
    @RequestMapping("/queryFY")
    @ResponseBody
    public Map<String,Object> queryFY(int storeId, String number, int offset, int limit){

        System.out.println(offset);
        System.out.println(limit);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",rbillsDao.queryFY(storeId,number,offset,limit));
        map.put("total",rbillsDao.getTotalCount(storeId,number));

        return map;
    }


    /*已审核分页查询*/
    @RequestMapping("/queryFYS")
    @ResponseBody
    public Map<String,Object> queryFYS(int storeId,String number,int offset,int limit){

        System.out.println(offset);
        System.out.println(limit);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",rbillsDao.queryFYS(storeId,number,offset,limit));
        map.put("total",rbillsDao.getTotalCountS(storeId,number));

        return map;
    }

    /*修改状态*/
    @RequestMapping("/updatelist")
    @ResponseBody
    public Map<String,Object> updatelist(String number){

        System.out.println("----------"+number);

        rbillsDao.updateInfo(number);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",rbillsDao.queryFY(0,"",0,3));
        map.put("total",rbillsDao.getTotalCount(0,""));

        return map;
    }

    /*查询状态是否已经通过*/
    @RequestMapping("/TG")
    @ResponseBody
    public int TG(String number){

        int i = rbillsDao.TongG(number);


        return i;
    }





}
