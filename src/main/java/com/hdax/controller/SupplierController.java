package com.hdax.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping(path = "/supp")
@Scope
public class SupplierController {
    //去页面
    @GetMapping(path = "/supplier")
    public String list(){
        return "supplier";
    }
}
