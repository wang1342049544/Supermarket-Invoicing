package com.hdax.controller;
import com.hdax.entity.Buyer;
import com.hdax.mapper.BuyerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Buyer")
@Scope
public class BuyerDaoController {

    @Autowired
    private BuyerDao buyerDao;


    /*全表添加*/
    @RequestMapping("/InserList")
    @ResponseBody
    public Map<String,Object> InsertList(String ids){

        String[] ss1 = ids.split(",");

        Buyer buyer = new Buyer();

        String shopId = "";
        String shopName = "";
        String danwei = "";
        String price = "";
        String nums = "";
        String money = "";
        String supplierId = "";
        String yileld = "";
        String pledge = "";
        String expiration = "";
        String typeId = "";

        for(int i=0;i<ss1.length;i++){

            String[] ss = ss1[i].split("/");

            for(int j=0;j<ss.length;j++){

                shopId = ss[0];
                shopName = ss[1];
                danwei = ss[2];
                price = ss[3];
                nums = ss[4];
                money = ss[5];
                supplierId = ss[6];
                yileld = ss[7];
                pledge = ss[8];
                expiration = ss[9];
                typeId = ss[10];
            }

            buyer.setBuId(shopId);
            buyer.setBuName(shopName);
            buyer.setDanWei(danwei);
            buyer.setPrice(Double.parseDouble(price));
            buyer.setNums(Integer.parseInt(nums));
            buyer.setMoney(Double.parseDouble(money));
            buyer.setSupplierId(Integer.parseInt(supplierId));
            buyer.setYileld(yileld);
            buyer.setPledge(pledge);
            buyer.setExpiration(expiration);
            buyer.setTypeId(Integer.parseInt(typeId));

            buyerDao.InsertInfo(buyer);

        }


        Map<String,Object> map = new HashMap<>();
        map.put("rows",buyerDao.queryFY(0,10));
        map.put("total",buyerDao.getTotalCount());
        return map;

    }

    @RequestMapping("/delD")
    @ResponseBody
    /*批量删除*/
    public Map<String,Object> delD(String sids){

        String[] ss = sids.split("-");

        for(int i=0;i<ss.length;i++){

            buyerDao.delD(Integer.parseInt(ss[i]));
        }


        Map<String,Object> map = new HashMap<>();
        map.put("rows",buyerDao.queryFY(0,10));
        map.put("total",buyerDao.getTotalCount());
        return map;
    }


    @RequestMapping("/queryList")
    @ResponseBody
    /*查询*/
    public List<Buyer> queryList(){
        return buyerDao.queryAll();
    }

    /*分页查询*/
    @RequestMapping("/queryFY")
    @ResponseBody
    public Map<String,Object> queryFY(int offset,int limit){


        Map<String,Object> map = new HashMap<>();
        map.put("rows",buyerDao.queryFY(offset,limit));
        map.put("total",buyerDao.getTotalCount());
        return map;
    }

    @RequestMapping("/delInfo")
    @ResponseBody
    /*删除信息*/
    public Map<String,Object> delInfo(int id){

        buyerDao.delInfo(id);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",buyerDao.queryFY(0,10));
        map.put("total",buyerDao.getTotalCount());
        return map;
    }

    /*修改信息*/
    @RequestMapping("/updInfo")
    @ResponseBody
    public Map<String,Object> updInfo(Buyer buyer){

        buyerDao.updateInfo(buyer);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",buyerDao.queryFY(0,10));
        map.put("total",buyerDao.getTotalCount());
        return map;
    }

    /*单个数据添加*/

    @RequestMapping("/InsertI")
    @ResponseBody
    public Map<String,Object> InsertI(Buyer buyer){

        buyerDao.InsertInfo(buyer);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",buyerDao.queryFY(0,10));
        map.put("total",buyerDao.getTotalCount());
        return map;
    }


}
