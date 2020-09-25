package com.hdax.entity;

/**
 * 供应商
 */
public class Supplier {

  private long supplierId;
  private String supName;
  private String phone;
  private String address;
  private long stateId;
  private long typeId;

  private Supptype supptype;

  public long getSupplierId() {
    return supplierId;
  }

  public void setSupplierId(long supplierId) {
    this.supplierId = supplierId;
  }

  public String getSupName() {
    return supName;
  }

  public void setSupName(String supName) {
    this.supName = supName;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public long getStateId() {
    return stateId;
  }

  public void setStateId(long stateId) {
    this.stateId = stateId;
  }


  public long getTypeId() {
    return typeId;
  }

  public void setTypeId(long typeId) {
    this.typeId = typeId;
  }

  public Supptype getSupptype() {
    return supptype;
  }

  public void setSupptype(Supptype supptype) {
    this.supptype = supptype;
  }
}
