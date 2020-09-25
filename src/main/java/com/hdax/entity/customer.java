package com.hdax.entity;

public class customer {
    private int id;
    private String cName;
    private String phone;
    private String address;
    private long jifen;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
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

    public long getJifen() {
        return jifen;
    }

    public void setJifen(long jifen) {
        this.jifen = jifen;
    }
}
