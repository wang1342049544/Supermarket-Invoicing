package com.hdax.controller;


import com.hdax.entity.Kct;
import com.hdax.entity.Shoptype;
import com.hdax.entity.Xsdetails;
import com.hdax.mapper.KctDao;
import com.hdax.mapper.SalesDao;
import com.hdax.mapper.ShoptypeDao;
import com.hdax.mapper.XsdetailsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*import javax.jws.Oneway;*/

@Controller
@RequestMapping("/Xsdetails")
@Scope

public class XsdetailsDaoController {

    @Autowired
    private XsdetailsDao xsdetailsDao;  //订单
    @Autowired
    private SalesDao salesDao;//销售商品展示表
    @Autowired
    private KctDao kctDao;  //库存表
    @Autowired
    private ShoptypeDao shoptypeDao;

  /*  @RequestMapping("/main")
    public String main(HttpSession session){
        List<Shoptype> cate = shoptypeDao.queryATT();
        session.setAttribute("cate",cate);
        return "tb";
    }*/
    @RequestMapping("/main")
    public String main(HttpServletRequest request){
        List<Shoptype> cate = shoptypeDao.queryATT();
        request.getSession().setAttribute("cate",cate);
        return "tb";
    }






    /*根据单据号和商品编号查询*/
    @RequestMapping("/slectGH")
    @ResponseBody
    public int slectGH(String ids) {

        String[] ss1 = ids.split(",");

        String number = "";
        String buId = "";
        String dh = "";
        List<Xsdetails> list = new ArrayList<>();
        System.out.println("长度" + ss1.length);
        for (int i = 0; i < ss1.length; i++) {
            String[] ss = ss1[i].split("-");

            buId = ss[0];
            number = ss[1];
            dh = ss[2];
            System.out.println(number + "-------------" + buId + "-----" );

             list = xsdetailsDao.selectNum(number,Integer.parseInt(buId),Integer.parseInt(dh));


            for (Xsdetails x : list){
                //销售商品表里面的总数据
                long sum  = salesDao.getCount(x.getBuId());

                System.out.println("数据库里面总数据"+sum);

                //减完之后的数据
                long sheng = sum - x.getNum();
                System.out.println("减去购买的数量"+x.getNum());
                System.out.println("减完之后"+sheng);

                salesDao.updnum(sheng,x.getBuId());


            }

        }

return 1;

    }

//出库成功之后 减去库存数量
    @RequestMapping("/kucun")
    @ResponseBody
    public Boolean chuku(String number) {

        //1.先获取库存里边的 id  和数量
        //2.获取 订单里边 对应 id 的数量
        //减去
        //KCt 库存表
        //Xsdetails  订单表
        //获取当前订单id  和 库存数量
        List<Kct> kct = kctDao.queryAll();

        List<Xsdetails> xs = xsdetailsDao.selectNum2(number);
        for (Kct item: kct) {
            for (Xsdetails item2:xs) {
                if (item.getKcId() == item2.getBuId()){
                    if (item2.getNum() > item.getNums()){
                        return false;
                    }
                }
            }
        }
        for (Xsdetails item2:xs) {
            kctDao.jianK(item2.getBuId(),item2.getNum());
        }
        return true;
    }






    //退货成功之后 加回去库存数量
    @RequestMapping("/tuihuo")
    @ResponseBody
    public Boolean tuihuo(String number) {

        //1.先获取库存里边的 id  和数量
        //2.获取 订单里边 对应 id 的数量
        //减去
        //KCt 库存表
        //Xsdetails  订单表
        //获取当前订单id  和 库存数量


        List<Xsdetails> xs = xsdetailsDao.selectNum2(number);
        try {
            for (Xsdetails item2:xs) {
                kctDao.jiaK(item2.getBuId(),item2.getNum());
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }





    /*根据单据号查询信息*/
    @RequestMapping("/selectGF")
    @ResponseBody
    public List<Xsdetails> selectGF(String number){

        System.out.println(number);

       return xsdetailsDao.selectDH(number);

    }

    @RequestMapping("times")
    @ResponseBody
    public Map<String,Object> times(){
        Map<String,Object> map=new HashMap<>();
        List<Object> xq=new ArrayList<>();
        List<Object> count=new ArrayList<>();
        for (int i=0;i<7;i++){
            String time=xsdetailsDao.times(i);
            String totalNum=xsdetailsDao.timesTotal(time);
            int k=0;
            if(totalNum==null){
                k=0;
            }else{
                k=Integer.parseInt(totalNum);
            }
            xq.add(time);
            count.add(k);
            System.out.println("------------"+time);
            System.out.println("~~~~~~~~~~~~~"+k);
        }


        map.put("xq",xq);
        map.put("count",count);
        return map;
    }


    @RequestMapping("/ShopTop")
    @ResponseBody
    public Map<String,List<Object>> ShopTop(long typeId){
        Map<String,List<Object>> map = new HashMap<>();
        List<Xsdetails> list =  xsdetailsDao.zxl(typeId);
        List<Object> namelist = new ArrayList<>();
        List<Object> countlist = new ArrayList<>();
        for (Xsdetails x:list) {
            namelist.add(x.getShopName());
            countlist.add(x.getMoney());
        }
        map.put("namelist",namelist);
        map.put("countlist",countlist);
        return map;
    }

    @RequestMapping("/zxx")
    @ResponseBody
    public Map<String,List<Object>> zxx(long typeId){
        Map<String,List<Object>> map = new HashMap<>();
        List<Xsdetails> list =  xsdetailsDao.zxx(typeId);
        List<Object> namelist = new ArrayList<>();
        List<Object> countlist = new ArrayList<>();
        for (Xsdetails x:list) {
            namelist.add(x.getShopName());
            countlist.add(x.getNum());
        }
        map.put("namelist",namelist);
        map.put("countlist",countlist);
        return map;
    }

    /**
     * 按年月 统计 每月销售额
     * @param xsTime
     * @return
     */

    @RequestMapping("/zz")
    @ResponseBody
    public Map<String,List<Object>> zz(String xsTime){
        Map<String,List<Object>> map = new HashMap<>();
        List<Xsdetails> list =  xsdetailsDao.zz(xsTime);
        List<Object> namelist = new ArrayList<>();
        List<Object> countlist = new ArrayList<>();
        for (Xsdetails x:list) {
            namelist.add(x.getYue());
            countlist.add(x.getMoney());
        }
        map.put("namelist",namelist);
        map.put("countlist",countlist);
        return map;
    }

    @RequestMapping("/ShopXS")
    @ResponseBody
    public Map<String,List<Object>> ShopXS(long typeId){
        Map<String,List<Object>> map = new HashMap<>();
        List<Xsdetails> list =  xsdetailsDao.zxs(typeId);

        List<Object> namelist = new ArrayList<>();
        List<Object> countlist = new ArrayList<>();
        for (Xsdetails x:list) {
            namelist.add(x.getShopName());
            countlist.add(x.getMoney());
        }
        map.put("namelist",namelist);
        map.put("countlist",countlist);
        return map;
    }



}
