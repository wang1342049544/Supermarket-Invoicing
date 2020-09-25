package com.hdax.entity;


public class Gshop {

  private long gShopId;
  private String gShopName;
  private String danWei;
  private double price;
  private long supplierId;
  private long typeId;
  private String yileld;
  private String pledge;
  private String expiration;
  private String remake;

  private Shoptype shoptypes;

  public long getgShopId() {
    return gShopId;
  }

  public void setgShopId(long gShopId) {
    this.gShopId = gShopId;
  }

  public String getgShopName() {
    return gShopName;
  }

  public void setgShopName(String gShopName) {
    this.gShopName = gShopName;
  }

  public Shoptype getShoptypes() {
    return shoptypes;
  }

  public void setShoptypes(Shoptype shoptypes) {
    this.shoptypes = shoptypes;
  }

  public long getGShopId() {
    return gShopId;
  }

  public void setGShopId(long gShopId) {
    this.gShopId = gShopId;
  }


  public String getGShopName() {
    return gShopName;
  }

  public void setGShopName(String gShopName) {
    this.gShopName = gShopName;
  }


  public String getDanWei() {
    return danWei;
  }

  public void setDanWei(String danWei) {
    this.danWei = danWei;
  }


  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }


  public long getSupplierId() {
    return supplierId;
  }

  public void setSupplierId(long supplierId) {
    this.supplierId = supplierId;
  }


  public long getTypeId() {
    return typeId;
  }

  public void setTypeId(long typeId) {
    this.typeId = typeId;
  }


  public String getYileld() {
    return yileld;
  }

  public void setYileld(String yileld) {
    this.yileld = yileld;
  }


  public String getPledge() {
    return pledge;
  }

  public void setPledge(String pledge) {
    this.pledge = pledge;
  }


  public String getExpiration() {
    return expiration;
  }

  public void setExpiration(String expiration) {
    this.expiration = expiration;
  }


  public String getRemake() {
    return remake;
  }

  public void setRemake(String remake) {
    this.remake = remake;
  }

}
