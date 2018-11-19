package com.user.call.bean;

import java.io.Serializable;
import java.util.List;

public class LayDataBean
        implements Serializable {
    private int code;
    private String msg;
    private int count;
    private List<?> data;

    public int getCode() {
        return this.code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return this.msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return this.count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<?> getData() {
        return this.data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    public String toString() {
        return "LayDataBean{code='" + this.code + '\'' + ", msg='" + this.msg + '\'' + ", count='" + this.count + '\'' + ", data=" + this.data + '}';
    }
}
