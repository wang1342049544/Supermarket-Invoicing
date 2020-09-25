package com.hdax.entity;

import lombok.Data;


public class Xsbills {

  private long id;

    public String getIdd() {
        return idd;
    }

    public void setIdd(String idd) {
        this.idd = idd;
    }

    private String idd;
  private String number;
  private String khId;
  private long bType;
  private String xsTime;
  private double money;
  private long jifen;
  private long managerId;

  private customer customer;
  private Manager manager;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getKhId() {
        return khId;
    }

    public void setKhId(String khId) {
        this.khId = khId;
    }

    public long getbType() {
        return bType;
    }

    public void setbType(long bType) {
        this.bType = bType;
    }

    public String getXsTime() {
        return xsTime;
    }

    public void setXsTime(String xsTime) {
        this.xsTime = xsTime;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public long getJifen() {
        return jifen;
    }

    public void setJifen(long jifen) {
        this.jifen = jifen;
    }

    public long getManagerId() {
        return managerId;
    }

    public void setManagerId(long managerId) {
        this.managerId = managerId;
    }

    public com.hdax.entity.customer getCustomer() {
        return customer;
    }

    public void setCustomer(com.hdax.entity.customer customer) {
        this.customer = customer;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }
}
