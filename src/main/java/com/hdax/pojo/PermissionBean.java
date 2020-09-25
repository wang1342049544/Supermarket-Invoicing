package com.hdax.pojo;

import java.util.List;

public class PermissionBean {

    private int id;
    private  String text;
    private StateBean state;
    private List<PermissionBean> nodes;

    public StateBean getState() {
        return state;
    }

    public void setState(StateBean state) {
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<PermissionBean> getNodes() {
        return nodes;
    }

    public void setNodes(List<PermissionBean> nodes) {
        this.nodes = nodes;
    }

    @Override
    public String toString() {
        return "PermissionBean{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", state=" + state +
                ", nodes=" + nodes +
                '}';
    }
}
