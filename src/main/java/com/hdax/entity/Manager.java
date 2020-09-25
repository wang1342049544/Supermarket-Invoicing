package com.hdax.entity;

import lombok.Data;

/**
 * 管理员表
 */
@Data
public class Manager {
  private long managerId;
  private String mname;
  private String password;
  private String photo;
  private String phone;
  private String address;
  private  long state;
  private  long roleId;
    private String salt;
  //职位
 private Role role;
}
