package com.hdax.controller;

import com.hdax.entity.Audit;
import com.hdax.mapper.AuditDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/Audit")
@Scope

public class AuditDaoController {


    @Autowired
    private AuditDao auditDao;

    @RequestMapping("/queryL")
    @ResponseBody
    public List<Audit> queryAll(){

        return auditDao.queryAll();
    }



}
