package com.hdax.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(path = "/store")
@Scope
public class StoreController {
    //去页面
    @GetMapping(path = "/Store")
    public String list(){
        return "Store";
    }

// //去页面
//    @GetMapping(path = "/Storee")
//    public String listt(HttpServletRequest request){
//
//        //*request.setAttribute("storeid",storeid);*/
//        return "KuCun/panku";
//    }
}
