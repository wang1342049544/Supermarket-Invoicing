package com.hdax.entity;


import com.hdax.pojo.StateBean;

public class Permission {

  private long permissionId;
  private String pName;
  private String type;
  private String url;
  private long parentid;

  private StateBean stateBean;

  public StateBean getStateBean() {
    return stateBean;
  }

  public void setStateBean(StateBean stateBean) {
    this.stateBean = stateBean;
  }

  public long getPermissionId() {
    return permissionId;
  }

  public void setPermissionId(long permissionId) {
    this.permissionId = permissionId;
  }

  public String getpName() {
    return pName;
  }

  public void setpName(String pName) {
    this.pName = pName;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public long getParentid() {
    return parentid;
  }

  public void setParentid(long parentid) {
    this.parentid = parentid;
  }

    @Override
    public String toString() {
        return "Permission{" +
                "permissionId=" + permissionId +
                ", pName='" + pName + '\'' +
                ", type='" + type + '\'' +
                ", url='" + url + '\'' +
                ", parentid=" + parentid +
                ", stateBean=" + stateBean +
                '}';
    }
}
