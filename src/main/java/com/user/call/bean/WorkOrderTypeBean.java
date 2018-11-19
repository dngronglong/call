package com.user.call.bean;

import java.io.Serializable;

public class WorkOrderTypeBean implements Serializable {
    private String DOMAINID;//
    private String VALUE;//值
    private String DESCRIPTION;//描述
    private String SITEID;
    private String ORGID;//
    private int ALNDOMAINID;//id

    public WorkOrderTypeBean() {
    }

    public String getDOMAINID() {
        return DOMAINID;
    }

    public void setDOMAINID(String DOMAINID) {
        this.DOMAINID = DOMAINID;
    }

    public String getVALUE() {
        return VALUE;
    }

    public void setVALUE(String VALUE) {
        this.VALUE = VALUE;
    }

    public String getDESCRIPTION() {
        return DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }

    public String getSITEID() {
        return SITEID;
    }

    public void setSITEID(String SITEID) {
        this.SITEID = SITEID;
    }

    public String getORGID() {
        return ORGID;
    }

    public void setORGID(String ORGID) {
        this.ORGID = ORGID;
    }

    public int getALNDOMAINID() {
        return ALNDOMAINID;
    }

    public void setALNDOMAINID(int ALNDOMAINID) {
        this.ALNDOMAINID = ALNDOMAINID;
    }

    @Override
    public String toString() {
        return "WorkOrderTypeBean{" +
                "DOMAINID='" + DOMAINID + '\'' +
                ", VALUE='" + VALUE + '\'' +
                ", DESCRIPTION='" + DESCRIPTION + '\'' +
                ", SITEID='" + SITEID + '\'' +
                ", ORGID='" + ORGID + '\'' +
                ", ALNDOMAINID=" + ALNDOMAINID +
                '}';
    }
}
