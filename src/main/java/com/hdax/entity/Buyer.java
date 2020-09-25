package com.hdax.entity;


public class Buyer {

  private long id;
  private String buId;
  private String buName;
  private String danWei;
  private double price;
  private long nums;
  private double money;
  private long supplierId;
  private String yileld;
  private String pledge;
  private String expiration;
  private long typeId;
  private Supplier suppliers;
  private Shoptype shoptypes;

    public Supplier getSuppliers() {
        return suppliers;
    }

    public void setSuppliers(Supplier suppliers) {
        this.suppliers = suppliers;
    }

    public Shoptype getShoptypes() {
        return shoptypes;
    }

    public void setShoptypes(Shoptype shoptypes) {
        this.shoptypes = shoptypes;
    }

    public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getBuId() {
    return buId;
  }

  public void setBuId(String buId) {
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


  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }


  public long getNums() {
    return nums;
  }

  public void setNums(long nums) {
    this.nums = nums;
  }


  public double getMoney() {
    return money;
  }

  public void setMoney(double money) {
    this.money = money;
  }


  public long getSupplierId() {
    return supplierId;
  }

  public void setSupplierId(long supplierId) {
    this.supplierId = supplierId;
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


  public long getTypeId() {
    return typeId;
  }

  public void setTypeId(long typeId) {
    this.typeId = typeId;
  }

}
