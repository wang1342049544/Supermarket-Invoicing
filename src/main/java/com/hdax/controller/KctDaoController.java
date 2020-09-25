package com.hdax.controller;


import com.hdax.entity.Kct;
import com.hdax.entity.Manager;
import com.hdax.entity.Store;
import com.hdax.entity.Xsdetails;
import com.hdax.mapper.KctDao;


import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * 库存表
 */
@Controller
@RequestMapping("/KCT")
@Scope
public class KctDaoController {

    @Autowired
    private KctDao kctDao;
/*    @Autowired
    private CkdjDao ckdjDao;//出库单据
    @Autowired
    private CkxqbDao ckxqbDao;//详情表
    @Autowired
    private SalesDao salesDao;*/



    @RequestMapping("/Shopkct")
    @ResponseBody
    public Map<String,List<Object>> Shopkct(){
        Map<String,List<Object>> map = new HashMap<>();
        List<Kct> list =  kctDao.zxx();
        List<Object> namelist = new ArrayList<>();
        List<Object> countlist = new ArrayList<>();
        for (Kct k:list) {
            namelist.add(k.getsName());
            countlist.add(k.getNums());
        }
        map.put("namelist",namelist);
        map.put("countlist",countlist);
        return map;
    }



    @RequestMapping("/queryAll")
    @ResponseBody
    public List<Kct> queryAll(){
        return kctDao.queryAll();
    }





    //修改信息
    @RequestMapping("/updateInfo")
    @ResponseBody

    public Map<String,Object> updInfo(Kct k){
   /*       Kct kc = new Kct();
        kctDao.InsertInfo(kc);*/
        kctDao.updateInfo(k);
        Map<String,Object> map = new HashMap<>();
        map.put("rows", kctDao.TJquery("",6,6));
        map.put("total",kctDao.getTotalCount(""));

        return map;
    }


    /**
     * 下载excel表格
     * @param request
     * @param resp
     * @return
     * @throws Exception
     */
    @RequestMapping("/fileDownloadData")
    public ResponseEntity<byte[]> fileDownloadData(HttpServletRequest request, HttpServletResponse resp)
            throws Exception {

        /*加载表所有数据*/
        List<Kct> list = kctDao.queryAll();
        //在服务器上产生excel数据表格
        XSSFWorkbook xwb = new XSSFWorkbook(new FileInputStream(new File("库存警告.xlsx"))) ;
        //得到excel表格的每个worksheet
        XSSFSheet sheet = xwb.getSheetAt(0);
        //声明行
        XSSFRow row = null;
        //单元格样式
        XSSFCellStyle style = xwb.createCellStyle();
        style.setAlignment(HorizontalAlignment.CENTER);
        XSSFFont font = xwb.createFont();// 创建字体对象
        font.setFontHeightInPoints((short) 15);// 设置字体大小
        style.setFont(font);
        for (int i=0;i<list.size();i++) {
            Kct k = list.get(i) ;

            row = sheet.createRow(i+1);
            //设置行高
            row.setHeight((short) 580);
            long id = k.getId();
            long kcid = k.getKcId();
            String name = k.getsName();
            String danwei = k.getDanWei();
            long nums = k.getNums();
            double jprice = k.getJprice();
            double sprice = k.getSprice();
            long supplier = k.getSupplierId();
            long store = k.getStoreId();
            long typeId = k.getTypeId();
            String yileId = k.getYileld();
            String pledge = k.getPledge();
            String expiration = k.getExpiration()




                    ;
            long queState = k.getQueState();
            long zuiD = k.getZuiD();
            long jifen = k.getJifen();
            String remake = k.getRemake();
            XSSFCell cell0 = row.createCell(1) ;
            //设置单元格样式
            cell0.setCellStyle(style);
            XSSFCell cell1 = row.createCell(2) ;
            //设置单元格样式
            cell1.setCellStyle(style);
            //设置单元格样式
            XSSFCell cell2 = row.createCell(3) ;
            //设置单元格样式
            XSSFCell cell3 = row.createCell(4) ;
            XSSFCell cell4 = row.createCell(5) ;
            XSSFCell cell5 = row.createCell(6) ;
            XSSFCell cell6 = row.createCell(7) ;
            XSSFCell cell7 = row.createCell(8) ;
            XSSFCell cell8 = row.createCell(9) ;
            XSSFCell cell9 = row.createCell(10) ;
            XSSFCell cell10 = row.createCell(11) ;
            XSSFCell cell11 = row.createCell(12) ;
            XSSFCell cell12 = row.createCell(13) ;
            XSSFCell cell13 = row.createCell(14) ;
            XSSFCell cell14 = row.createCell(15) ;
            XSSFCell cell15 = row.createCell(16) ;
            XSSFCell cell16 = row.createCell(17) ;
            /*cell2.setCellStyle(style);*/
            cell0.setCellValue(id);
            cell1.setCellValue(kcid);
            cell2.setCellValue(name);
            cell3.setCellValue(danwei);
            cell4.setCellValue(nums);
            cell5.setCellValue(jprice);
            cell6.setCellValue(sprice);
            cell7.setCellValue(supplier);
            cell8.setCellValue(store);
            cell9.setCellValue(typeId);
            cell10.setCellValue(yileId);
            cell11.setCellValue(pledge);
            cell12.setCellValue(expiration);
            cell13.setCellValue(queState);
            cell14.setCellValue(zuiD);
            cell15.setCellValue(jifen);
            cell16.setCellValue(remake);

          /*  cell1.setCellValue(stocknuma);
            cell2.setCellValue(alarmNum);
            cell3.setCellValue(dateStr);*/
        }
        //格式化当前时间
        String strDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) ;
        String fileName = "库存警告"+strDate+".xlsx" ;
        //在服务器上生成数据
        FileOutputStream os = new FileOutputStream(fileName);
        xwb.write(os);
        os.close();// 关闭文件输出流

        byte[] body = null;
        File file = new File(fileName);
        InputStream in = new FileInputStream(file);
        body = new byte[in.available()];
        in.read(body);

        HttpHeaders headers = new HttpHeaders();
        String fname = new String(fileName.getBytes("gbk"), "iso8859-1");
        headers.add("Content-Disposition", "attachment;filename=" + fname);
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(body, headers, statusCode);
        in.close();
        return response;
    }








    //分页查询
    @RequestMapping("/TJquery")
    @ResponseBody
    public Map<String,Object> TJquery(String sName, int offset, int limit){

        //解决乱码
        try {
            if(sName!=null){
                sName = new String(sName.getBytes("ISO-8859-1"),"utf-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        Map<String,Object> map = new HashMap<>();
        map.put("rows", kctDao.TJquery(sName,offset,limit));
        map.put("total",kctDao.getTotalCount(sName));
        return map;
    }
    /*库存不足预警*/
    @RequestMapping("/query")
    @ResponseBody
    public Map<String,Object> query(String sName, int offset, int limit){

        //解决乱码
        try {
            if(sName!=null){
                sName = new String(sName.getBytes("ISO-8859-1"),"utf-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        Map<String,Object> map = new HashMap<>();
        map.put("rows", kctDao.query(sName,offset,limit));
        map.put("total",kctDao.getTotalCount(sName));
        return map;
    }


    /*销售过期预警*/
    @RequestMapping("/queryy")
    @ResponseBody
    public Map<String,Object> queryy(String sName, int offset, int limit){

        //解决乱码
        try {
            if(sName!=null){
                sName = new String(sName.getBytes("ISO-8859-1"),"utf-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        Map<String,Object> map = new HashMap<>();
        map.put("rows", kctDao.queryy(sName,offset,limit));
        map.put("total",kctDao.getTotalCount(sName));
        return map;
    }
    /*销售快过期预警*/
    @RequestMapping("/queryyy")
    @ResponseBody
    public Map<String,Object> queryyy(String sName, int offset, int limit){

        //解决乱码
        try {
            if(sName!=null){
                sName = new String(sName.getBytes("ISO-8859-1"),"utf-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        Map<String,Object> map = new HashMap<>();
        map.put("rows", kctDao.queryyy(sName,offset,limit));
        map.put("total",kctDao.getTotalCount(sName));
        return map;
    }

   /* *//*根据编号查询数量*//*
    @RequestMapping("/selectNum")
    @ResponseBody
    public int selectNum(String ids){

        String[] ss = ids.split(",");

        String kcId = "";
        String num = "";
        long sum = 0;
        long nums = 0;
        String danHao = "";
        String managerId = "";
        String times = "";

        String danWei = "";
        String price = "";
        String yileId = "";
        String pledge = "";
        String expiration = "";
        String jifen = "";
        String buName = "";
        String typeIds = "";


        int gou = 0;
        System.out.println("外层循环"+ss.length);

        for(int i=0;i<ss.length;i++){

            String[] ss1 = ss[i].split("/");
            System.out.println("外层循环"+ss1.length);
            for(int j=0;j<ss1.length;j++){

                kcId = ss1[0];
                num = ss1[1];
                danHao = ss1[2];
                managerId = ss1[3];
                times = ss1[4];

                danWei = ss1[5];
                price = ss1[6];
                yileId = ss1[7];
                pledge = ss1[8];
                expiration = ss1[9];
                jifen = ss1[10];
                buName = ss1[11];
                typeIds = ss1[12];


            }
            //获取库存数量
            List<Kct> list = kctDao.getCount(Integer.parseInt(kcId));
            for (Kct k : list){
                nums = k.getNums();
            }

            if(nums >= Integer.parseInt(num)){

                //库存量-出库量
                sum = nums - Integer.parseInt(num);

                System.out.println("修完之后数量"+sum);
                System.out.println("原库存数"+nums);
                System.out.println("出库数量"+num);

                //修改数量
                kctDao.xiuNum(sum,Integer.parseInt(kcId));

                //添加单据表
                System.out.println("单据号 -- " + danHao +"单据类型:" + 0+"操作员--"+managerId +"时间"+times);

                System.out.println("单位"+danWei+"价格"+price+"1"+yileId+"2"+pledge+"3"+expiration+"4"+jifen);
                //添加单据详情表
                Ckxqb k = new Ckxqb();
                k.setNumber(danHao);
                k.setBuId(Integer.parseInt(kcId));
                k.setBuName(buName);
                k.setDanWei(danWei);
                k.setPrice(Double.parseDouble(price));
                k.setNum(Integer.parseInt(num));
                k.setTypeId(Integer.parseInt(typeIds));
                k.setYileId(yileId);
                k.setPledge(pledge);
                k.setExpiration(expiration);
                k.setJifen(Integer.parseInt(jifen));

                ckxqbDao.InsertInfo(k);


                //根据编号查询销售表里面的数据
                Sales sa = salesDao.getCounts(Integer.parseInt(kcId));

                System.out.println("查询信息+"+sa.getBuId() + "-----" + sa.getNum());

                System.out.println("销售表里面的数量---" + num);

                long sumes = sa.getNum() + Integer.parseInt(num);

                System.out.println("------"+sumes);

                *//*修改数量*//*
                salesDao.updnum(sumes,Integer.parseInt(kcId));

                gou = 1;

            }else
            {
               gou = 2;
            }



        }

        //库存数量够不够
        if(gou == 1){
            //添加单据表信息
            long typeId = 0;
            String remaek = "";
            //出库单据表
            Ckdj c = new Ckdj();
            c.setNumber(danHao);
            c.setDtime(times);
            c.setManagerId(Integer.parseInt(managerId));
            c.setTypeId(typeId);
            c.setRemake(remaek);

            int i = ckdjDao.InsertInfo(c);
        }else if (gou == 2){
            System.out.println("没添加");
        }





            return gou;
    }
*/




}
