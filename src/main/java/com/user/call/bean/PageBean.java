package com.user.call.bean;

import java.util.List;

public class PageBean {
    private int page;
    private int nums;
    private int index;
    private int total;
    private int totalPage;
    private List<?> rows;

    public int getPage() {
        return this.page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getNums() {
        return this.nums;
    }

    public void setNums(int nums) {
        this.nums = nums;
    }

    public int getIndex() {
        this.index = ((this.page - 1) * this.nums);
        return this.index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public int getTotal() {
        return this.total;
    }

    public void setTotal(int total) {
        this.totalPage = (total % this.nums == 0 ? total / this.nums : total / this.nums + 1);
        this.total = total;
    }

    public int getTotalPage() {
        return this.totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<?> getRows() {
        return this.rows;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
    }

    public String toString() {
        return "PageBean{page=" + this.page + ", nums=" + this.nums + ", index=" + this.index + ", total=" + this.total + ", totalPage=" + this.totalPage + ", rows=" + this.rows + '}';
    }
}
