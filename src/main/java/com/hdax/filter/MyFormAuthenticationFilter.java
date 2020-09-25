package com.hdax.filter;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Component;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

@Component(value = "formFilter")
public class MyFormAuthenticationFilter extends FormAuthenticationFilter{
    @Override
    protected void issueSuccessRedirect(ServletRequest request, ServletResponse response) throws Exception {
        System.out.println("issueSuccessRedirect");
        WebUtils.issueRedirect(request,response,getSuccessUrl(),null,true);
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
//        System.out.println("onAccessDenied");


        return super.onAccessDenied(request, response);
    }




}
