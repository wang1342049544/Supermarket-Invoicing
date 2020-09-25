package com.hdax.controller;
import com.hdax.entity.Bills;
import com.hdax.mapper.billsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*import org.omg.PortableInterceptor.INACTIVE;*/


@Controller
@RequestMapping("/bills")
@Scope
public class billsDaoController {

    @Autowired
    private billsDao billsDaos;


    /*添加信息*/
    @RequestMapping("/InserList")
    @ResponseBody
    public void InsertList(String Number,int typeId,int StoreIds,String time,String yingF,String shiF,String jing,String managerId,String auditId,String remake){

        Bills bills = new Bills();
        bills.setNumber(Number);
        bills.setTypeId(typeId);
        bills.setDanTime(time);
        bills.setAuditId(Integer.parseInt(auditId));
/*        bills.setCzy(Integer.parseInt(managerId));*/
        bills.setRemake(remake);
    /*    bills.setManagerId(Integer.parseInt(jing));*/
        bills.setShiF(Double.parseDouble(shiF));
        bills.setYingF(Double.parseDouble(yingF));
        bills.setStoreId(StoreIds);

        billsDaos.InsertInfo(bills);


    }

    /*查询*/
    @RequestMapping("/queryAll")
    @ResponseBody

    public List<Bills> queryAll(){

        return billsDaos.queryAll();
    }

    /*未审核分页查询*/
    @RequestMapping("/queryFY")
    @ResponseBody
    public Map<String,Object> queryFY(int storeId,String number,int offset,int limit){

        System.out.println(offset);
        System.out.println(limit);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",billsDaos.queryFY(storeId,number,offset,limit));
        map.put("total",billsDaos.getTotalCount(storeId,number));

        return map;
    }


    /*已审核分页查询*/
    @RequestMapping("/queryFYS")
    @ResponseBody
    public Map<String,Object> queryFYS(int storeId,String number,int offset,int limit){

        System.out.println(offset);
        System.out.println(limit);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",billsDaos.queryFYS(storeId,number,offset,limit));
        map.put("total",billsDaos.getTotalCountS(storeId,number));

        return map;
    }

    /*修改状态*/
    @RequestMapping("/updatelist")
    @ResponseBody
    public Map<String,Object> updatelist(String number){

        System.out.println("----------"+number);

        billsDaos.updateInfo(number);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",billsDaos.queryFY(0,"",0,3));
        map.put("total",billsDaos.getTotalCount(0,""));

        return map;
    }


    /*修改状态*/
    @RequestMapping("/update")
    @ResponseBody
    public Map<String,Object> update(Bills id){
        billsDaos.update(id);

        Map<String,Object> map = new HashMap<>();
        map.put("rows",billsDaos.queryFY(0,"",0,3));
        map.put("total",billsDaos.getTotalCount(0,""));

        return map;
    }



    /*查询状态是否已经通过*/
    @RequestMapping("/TG")
    @ResponseBody
    public int TG(String number){

        int i = billsDaos.TongG(number);


        return i;
    }

    /*删除*/
    @RequestMapping("/delList")
    @ResponseBody
    public Map<String,Object> delList(String ids){

        String[] ss = ids.split("-");
        for(int i=0;i<ss.length;i++){

            billsDaos.delInfo(ss[i]);
        }
;;

        Map<String,Object> map = new HashMap<>();
        map.put("rows",billsDaos.queryFY(0,"",0,3));
        map.put("total",billsDaos.getTotalCount(0,""));

        return map;
    }

}
