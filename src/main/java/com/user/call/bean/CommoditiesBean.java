package com.user.call.bean;

import java.io.Serializable;

public class CommoditiesBean
        implements Serializable {
    private int COMMODITIESID;
    private String OWNER;
    private String DESCRIPTION;
    private String COMMODITY;

    public String getCOMMODITY() {
        return this.COMMODITY;
    }

    public void setCOMMODITY(String COMMODITY) {
        this.COMMODITY = COMMODITY;
    }

    public int getCOMMODITIESID() {
        return this.COMMODITIESID;
    }

    public void setCOMMODITIESID(int COMMODITIESID) {
        this.COMMODITIESID = COMMODITIESID;
    }

    public String getOWNER() {
        return this.OWNER;
    }

    public void setOWNER(String OWNER) {
        this.OWNER = OWNER;
    }

    public String getDESCRIPTION() {
        return this.DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }

    public String toString() {
        return "CommoditiesBean{COMMODITIESID=" + this.COMMODITIESID + ", OWNER='" + this.OWNER + '\'' + ", DESCRIPTION='" + this.DESCRIPTION + '\'' + ", COMMODITY='" + this.COMMODITY + '\'' + '}';
    }
}
