package com.user.call.bean;

public class PersonBean {
    private int PERSONUID;
    private String DISPLAYNAME;
    private String DEPARTMENT;
    private String PERSONID;
    private String LOCATIONSITE;
    private String LOCATIONORG;

    public int getPERSONUID() {
        return this.PERSONUID;
    }

    public void setPERSONUID(int PERSONUID) {
        this.PERSONUID = PERSONUID;
    }

    public String getDISPLAYNAME() {
        return this.DISPLAYNAME;
    }

    public void setDISPLAYNAME(String DISPLAYNAME) {
        this.DISPLAYNAME = DISPLAYNAME;
    }

    public String getDEPARTMENT() {
        return this.DEPARTMENT;
    }

    public void setDEPARTMENT(String DEPARTMENT) {
        this.DEPARTMENT = DEPARTMENT;
    }

    public String getPERSONID() {
        return this.PERSONID;
    }

    public void setPERSONID(String PERSONID) {
        this.PERSONID = PERSONID;
    }

    public String getLOCATIONSITE() {
        return this.LOCATIONSITE;
    }

    public void setLOCATIONSITE(String LOCATIONSITE) {
        this.LOCATIONSITE = LOCATIONSITE;
    }

    public String getLOCATIONORG() {
        return this.LOCATIONORG;
    }

    public void setLOCATIONORG(String LOCATIONORG) {
        this.LOCATIONORG = LOCATIONORG;
    }

    public String toString() {
        return "PersonBean{PERSONUID=" + this.PERSONUID + ", DISPLAYNAME='" + this.DISPLAYNAME + '\'' + ", DEPARTMENT='" + this.DEPARTMENT + '\'' + ", PERSONID='" + this.PERSONID + '\'' + ", LOCATIONSITE='" + this.LOCATIONSITE + '\'' + ", LOCATIONORG='" + this.LOCATIONORG + '\'' + '}';
    }
}
