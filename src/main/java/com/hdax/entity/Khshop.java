package com.hdax.entity;


public class Khshop {

  private long id;
  private long buId;
  private String buName;
  private String danWei;
  private long num;
  private double price;
  private double money;
  private long dh;
  private long zjifen;

  public long getZjifen() {
    return zjifen;
  }

  public void setZjifen(long zjifen) {
    this.zjifen = zjifen;
  }

  public long getDh() {
    return dh;
  }

  public void setDh(long dh) {
    this.dh = dh;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getBuId() {
    return buId;
  }

  public void setBuId(long buId) {
    this.buId = buId;
  }


  public String getBuName() {
    return buName;
  }

  public void setBuName(String buName) {
    this.buName = buName;
  }


  public String getDanWei() {
    return danWei;
  }

  public void setDanWei(String danWei) {
    this.danWei = danWei;
  }


  public long getNum() {
    return num;
  }

  public void setNum(long num) {
    this.num = num;
  }


  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }


  public double getMoney() {
    return money;
  }

  public void setMoney(double money) {
    this.money = money;
  }

}
