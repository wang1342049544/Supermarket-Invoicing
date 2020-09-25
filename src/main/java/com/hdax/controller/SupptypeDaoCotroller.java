package com.hdax.controller;


import com.hdax.entity.Supptype;
import com.hdax.mapper.SupptypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/Supptype")
@Scope
public class SupptypeDaoCotroller {

    @Autowired
    private SupptypeDao supptypeDao;

        @RequestMapping("/querylist")
        @ResponseBody
        public List<Supptype> querylist(){

            return supptypeDao.queryAll();
        }

}
