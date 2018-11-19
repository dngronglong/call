package com.user.call.bean;

import java.io.Serializable;

public class SiteBean
        implements Serializable {
    private int SITEID;
    private String DESCRIPTION;

    public int getSITEID() {
        return this.SITEID;
    }

    public void setSITEID(int SITEID) {
        this.SITEID = SITEID;
    }

    public String getDESCRIPTION() {
        return this.DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }

    public String toString() {
        return "SiteBean{SITEID=" + this.SITEID + ", DESCRIPTION='" + this.DESCRIPTION + '\'' + '}';
    }
}
