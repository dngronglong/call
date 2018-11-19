package com.user.call.bean;

import java.io.Serializable;

public class ZxtBean
        implements Serializable {
    private String VALUE;
    private String DESCRIPTION;
    private int ALNDOMAINID;

    public String getVALUE() {
        return this.VALUE;
    }

    public void setVALUE(String VALUE) {
        this.VALUE = VALUE;
    }

    public String getDESCRIPTION() {
        return this.DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }

    public int getALNDOMAINID() {
        return this.ALNDOMAINID;
    }

    public void setALNDOMAINID(int ALNDOMAINID) {
        this.ALNDOMAINID = ALNDOMAINID;
    }

    public String toString() {
        return "ZxtBean{VALUE='" + this.VALUE + '\'' + ", DESCRIPTION='" + this.DESCRIPTION + '\'' + ", ALNDOMAINID=" + this.ALNDOMAINID + '}';
    }
}
