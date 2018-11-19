package com.user.call.bean;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TELBOOK")
public class TelBookBean
        implements Serializable {
    @Id
    private int TELBOOKID;
    private String MOBILE1;
    private String MOBILE2;
    private String OFFICEPHONENUMBER;
    private String PHONE1;
    private String PHONE2;
    private Date UPDATETIME;
    private String UNIT;
    private String USERNAMECN;
    private String USERNAMEEN;
    private String POSITION;
    private String SORTNUMBER;
    private String DEPNAME;
    private String FULLDEP;

    public String getFULLDEP() {
        return this.FULLDEP;
    }

    public void setFULLDEP(String FULLDEP) {
        this.FULLDEP = FULLDEP;
    }

    public String getDEPNAME() {
        return this.DEPNAME;
    }

    public void setDEPNAME(String DEPNAME) {
        this.DEPNAME = DEPNAME;
    }

    public int getTELBOOKID() {
        return this.TELBOOKID;
    }

    public void setTELBOOKID(int TELBOOKID) {
        this.TELBOOKID = TELBOOKID;
    }

    public String getMOBILE1() {
        return this.MOBILE1;
    }

    public void setMOBILE1(String MOBILE1) {
        this.MOBILE1 = MOBILE1;
    }

    public String getMOBILE2() {
        return this.MOBILE2;
    }

    public void setMOBILE2(String MOBILE2) {
        this.MOBILE2 = MOBILE2;
    }

    public String getOFFICEPHONENUMBER() {
        return this.OFFICEPHONENUMBER;
    }

    public void setOFFICEPHONENUMBER(String OFFICEPHONENUMBER) {
        this.OFFICEPHONENUMBER = OFFICEPHONENUMBER;
    }

    public String getPHONE1() {
        return this.PHONE1;
    }

    public void setPHONE1(String PHONE1) {
        this.PHONE1 = PHONE1;
    }

    public String getPHONE2() {
        return this.PHONE2;
    }

    public void setPHONE2(String PHONE2) {
        this.PHONE2 = PHONE2;
    }

    public Date getUPDATETIME() {
        return this.UPDATETIME;
    }

    public void setUPDATETIME(Date UPDATETIME) {
        this.UPDATETIME = UPDATETIME;
    }

    public String getUNIT() {
        return this.UNIT;
    }

    public void setUNIT(String UNIT) {
        this.UNIT = UNIT;
    }

    public String getUSERNAMECN() {
        return this.USERNAMECN;
    }

    public void setUSERNAMECN(String USERNAMECN) {
        this.USERNAMECN = USERNAMECN;
    }

    public String getUSERNAMEEN() {
        return this.USERNAMEEN;
    }

    public void setUSERNAMEEN(String USERNAMEEN) {
        this.USERNAMEEN = USERNAMEEN;
    }

    public String getPOSITION() {
        return this.POSITION;
    }

    public void setPOSITION(String POSITION) {
        this.POSITION = POSITION;
    }

    public String getSORTNUMBER() {
        return this.SORTNUMBER;
    }

    public void setSORTNUMBER(String SORTNUMBER) {
        this.SORTNUMBER = SORTNUMBER;
    }

    public String toString() {
        return "TelBookBean{TELBOOKID=" + this.TELBOOKID + ", MOBILE1='" + this.MOBILE1 + '\'' + ", MOBILE2='" + this.MOBILE2 + '\'' + ", OFFICEPHONENUMBER='" + this.OFFICEPHONENUMBER + '\'' + ", PHONE1='" + this.PHONE1 + '\'' + ", PHONE2='" + this.PHONE2 + '\'' + ", UPDATETIME=" + this.UPDATETIME + ", UNIT='" + this.UNIT + '\'' + ", USERNAMECN='" + this.USERNAMECN + '\'' + ", USERNAMEEN='" + this.USERNAMEEN + '\'' + ", POSITION='" + this.POSITION + '\'' + ", SORTNUMBER='" + this.SORTNUMBER + '\'' + ", DEPNAME='" + this.DEPNAME + '\'' + ", FULLDEP='" + this.FULLDEP + '\'' + '}';
    }
}
