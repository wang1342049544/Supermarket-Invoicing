package com.hdax.entity;


public class Sales {

  private long id;
  private long buId;
  private String buName;
  private String danWei;
  private long num;
  private double price;
  private long typeId;
  private String yileld;
  private String pledge;
  private String expiration;
  private long jifen;
  private long dh;
  private  String touxiang;

    public String getTouxiang() {
        return touxiang;
    }

    public void setTouxiang(String touxiang) {
        this.touxiang = touxiang;
    }

    public long getDh() {
    return dh;
  }

  public void setDh(long dh) {
    this.dh = dh;
  }

  private Shoptype shoptype;

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


  public long getJifen() {
    return jifen;
  }

  public void setJifen(long jifen) {
    this.jifen = jifen;
  }

}
