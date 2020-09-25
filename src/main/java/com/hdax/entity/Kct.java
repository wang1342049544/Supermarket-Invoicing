package com.hdax.entity;


public class Kct {

  private long id;
  private long kcId;
  private String sName;
  private String danWei;
  private long nums;
  private double jprice;
  private double sprice;
  private long supplierId;
  private long storeId;
  private long typeId;
  private String yileld;
  private String pledge;
  private String expiration;
  private long queState;
  private long zuiD;
  private long jifen;


  public long getQueState() {
    return queState;
  }

  public void setQueState(long queState) {
    this.queState = queState;
  }

  public long getZuiD() {
    return zuiD;
  }

  public void setZuiD(long zuiD) {
    this.zuiD = zuiD;
  }

  public long getJifen() {
    return jifen;
  }

  public void setJifen(long jifen) {
    this.jifen = jifen;
  }

  private String remake;

  //供货商表
  private Supplier supplier;

  //分店表
  private Store store;

  //商品类型
  private Shoptype shoptype;

  public String getsName() {
    return sName;
  }

  public void setsName(String sName) {
    this.sName = sName;
  }

  public Supplier getSupplier() {
    return supplier;
  }

  public void setSupplier(Supplier supplier) {
    this.supplier = supplier;
  }

  public Store getStore() {
    return store;
  }

  public void setStore(Store store) {
    this.store = store;
  }

  public Shoptype getShoptype() {
    return shoptype;
  }

  public void setShoptype(Shoptype shoptype) {
    this.shoptype = shoptype;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getKcId() {
    return kcId;
  }

  public void setKcId(long kcId) {
    this.kcId = kcId;
  }


  public String getSName() {
    return sName;
  }

  public void setSName(String sName) {
    this.sName = sName;
  }


  public String getDanWei() {
    return danWei;
  }

  public void setDanWei(String danWei) {
    this.danWei = danWei;
  }


  public long getNums() {
    return nums;
  }

  public void setNums(long nums) {
    this.nums = nums;
  }


  public double getJprice() {
    return jprice;
  }

  public void setJprice(double jprice) {
    this.jprice = jprice;
  }


  public double getSprice() {
    return sprice;
  }

  public void setSprice(double sprice) {
    this.sprice = sprice;
  }


  public long getSupplierId() {
    return supplierId;
  }

  public void setSupplierId(long supplierId) {
    this.supplierId = supplierId;
  }


  public long getStoreId() {
    return storeId;
  }

  public void setStoreId(long storeId) {
    this.storeId = storeId;
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
