package com.hdax.entity;


public class Bills {

  private long id;
  private String number;
  private long typeId;
  private String danTime;
  private long storeId;
  private double yingF;
  private double shiF;
  private long managerId;
  private long czy;
  private long auditId;
  private String remake;

  private Billstype billstype;
  private Store store;
  private Manager manager;
  private Audit audit;

  public Billstype getBillstype() {
    return billstype;
  }

  public void setBillstype(Billstype billstype) {
    this.billstype = billstype;
  }

  public Store getStore() {
    return store;
  }

  public void setStore(Store store) {
    this.store = store;
  }

  public Manager getManager() {
    return manager;
  }

  public void setManager(Manager manager) {
    this.manager = manager;
  }

  public Audit getAudit() {
    return audit;
  }

  public void setAudit(Audit audit) {
    this.audit = audit;
  }

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


  public long getTypeId() {
    return typeId;
  }

  public void setTypeId(long typeId) {
    this.typeId = typeId;
  }


  public String getDanTime() {
    return danTime;
  }

  public void setDanTime(String danTime) {
    this.danTime = danTime;
  }


  public long getStoreId() {
    return storeId;
  }

  public void setStoreId(long storeId) {
    this.storeId = storeId;
  }


  public double getYingF() {
    return yingF;
  }

  public void setYingF(double yingF) {
    this.yingF = yingF;
  }


  public double getShiF() {
    return shiF;
  }

  public void setShiF(double shiF) {
    this.shiF = shiF;
  }


  public long getManagerId() {
    return managerId;
  }

  public void setManagerId(long managerId) {
    this.managerId = managerId;
  }


  public long getCzy() {
    return czy;
  }

  public void setCzy(long czy) {
    this.czy = czy;
  }


  public long getAuditId() {
    return auditId;
  }

  public void setAuditId(long auditId) {
    this.auditId = auditId;
  }


  public String getRemake() {
    return remake;
  }

  public void setRemake(String remake) {
    this.remake = remake;
  }

}
