package com.user.call.bean;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "REPOSITORY")
public class RepositoryBean {
    @Id
    @SequenceGenerator(name = "repository_seq", sequenceName = "repository_seq", allocationSize = 1)
    @GeneratedValue(generator = "repository_seq", strategy = GenerationType.SEQUENCE)
    private int REPOSITORYID;
    private String CALLID;
    private String COMMODITYGROUP;
    private String COMMODITY;
    private String DEPARTMENT;
    private Date FILTERDATE;
    private String GDLX;
    private String LXFS;
    private String LYID;
    private String PERSON;
    private String UNIT;
    private String CALLNAME;
    private String HASLD;
    private String REMARK;
    private String DESCRIPTION;
    private String ZXXT;
    private String ZHIWEI;
    private String STATUS;
    private String UDSYSTEM;
    private String CJR;
    private String FR1CODE_LONGDESCRIPTION;//原因
    private String DESCRIPTION_LONGDESCRIPTION;//详细信息
    private String FR2CODE_LONGDESCRIPTION;//解决方案

    public String getFR1CODE_LONGDESCRIPTION() {
        return FR1CODE_LONGDESCRIPTION;
    }

    public void setFR1CODE_LONGDESCRIPTION(String FR1CODE_LONGDESCRIPTION) {
        this.FR1CODE_LONGDESCRIPTION = FR1CODE_LONGDESCRIPTION;
    }

    public String getDESCRIPTION_LONGDESCRIPTION() {
        return DESCRIPTION_LONGDESCRIPTION;
    }

    public void setDESCRIPTION_LONGDESCRIPTION(String DESCRIPTION_LONGDESCRIPTION) {
        this.DESCRIPTION_LONGDESCRIPTION = DESCRIPTION_LONGDESCRIPTION;
    }

    public String getFR2CODE_LONGDESCRIPTION() {
        return FR2CODE_LONGDESCRIPTION;
    }

    public void setFR2CODE_LONGDESCRIPTION(String FR2CODE_LONGDESCRIPTION) {
        this.FR2CODE_LONGDESCRIPTION = FR2CODE_LONGDESCRIPTION;
    }

    public String getCJR() {
        return this.CJR;
    }

    public void setCJR(String CJR) {
        this.CJR = CJR;
    }

    public String getCOMMODITY() {
        return this.COMMODITY;
    }

    public void setCOMMODITY(String COMMODITY) {
        this.COMMODITY = COMMODITY;
    }

    public String getUDSYSTEM() {
        return this.UDSYSTEM;
    }

    public void setUDSYSTEM(String UDSYSTEM) {
        this.UDSYSTEM = UDSYSTEM;
    }

    public String getZHIWEI() {
        return this.ZHIWEI;
    }

    public void setZHIWEI(String ZHIWEI) {
        this.ZHIWEI = ZHIWEI;
    }

    public String getSTATUS() {
        return this.STATUS;
    }

    public void setSTATUS(String STATUS) {
        this.STATUS = STATUS;
    }

    public String getZhiWei() {
        return this.ZHIWEI;
    }

    public void setZhiWei(String zhiWei) {
        this.ZHIWEI = zhiWei;
    }

    public String getZXXT() {
        return this.ZXXT;
    }

    public void setZXXT(String ZXXT) {
        this.ZXXT = ZXXT;
    }

    public String getREMARK() {
        return this.REMARK;
    }

    public void setREMARK(String REMARK) {
        this.REMARK = REMARK;
    }

    public String getDESCRIPTION() {
        return this.DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }

    public String getHASLD() {
        return this.HASLD;
    }

    public void setHASLD(String HASLD) {
        this.HASLD = HASLD;
    }

    public String getCALLNAME() {
        return this.CALLNAME;
    }

    public void setCALLNAME(String CALLNAME) {
        this.CALLNAME = CALLNAME;
    }

    public String getUNIT() {
        return this.UNIT;
    }

    public void setUNIT(String UNIT) {
        this.UNIT = UNIT;
    }

    public int getREPOSITORYID() {
        return this.REPOSITORYID;
    }

    public void setREPOSITORYID(int REPOSITORYID) {
        this.REPOSITORYID = REPOSITORYID;
    }

    public String getCALLID() {
        return this.CALLID;
    }

    public void setCALLID(String CALLID) {
        this.CALLID = CALLID;
    }

    public String getCOMMODITYGROUP() {
        return this.COMMODITYGROUP;
    }

    public void setCOMMODITYGROUP(String COMMODITYGROUP) {
        this.COMMODITYGROUP = COMMODITYGROUP;
    }

    public String getDEPARTMENT() {
        return this.DEPARTMENT;
    }

    public void setDEPARTMENT(String DEPARTMENT) {
        this.DEPARTMENT = DEPARTMENT;
    }

    public Date getFILTERDATE() {
        return this.FILTERDATE;
    }

    public void setFILTERDATE(Date FILTERDATE) {
        this.FILTERDATE = FILTERDATE;
    }

    public String getGDLX() {
        return this.GDLX;
    }

    public void setGDLX(String GDLX) {
        this.GDLX = GDLX;
    }

    public String getLXFS() {
        return this.LXFS;
    }

    public void setLXFS(String LXFS) {
        this.LXFS = LXFS;
    }

    public String getLYID() {
        return this.LYID;
    }

    public void setLYID(String LYID) {
        this.LYID = LYID;
    }

    public String getPERSON() {
        return this.PERSON;
    }

    public void setPERSON(String PERSON) {
        this.PERSON = PERSON;
    }

    public String toString() {
        return "RepositoryBean{REPOSITORYID=" + this.REPOSITORYID + ", CALLID='" + this.CALLID + '\'' + ", COMMODITYGROUP='" + this.COMMODITYGROUP + '\'' + ", DEPARTMENT='" + this.DEPARTMENT + '\'' + ", FILTERDATE=" + this.FILTERDATE + ", GDLX='" + this.GDLX + '\'' + ", LXFS='" + this.LXFS + '\'' + ", LYID='" + this.LYID + '\'' + ", PERSON='" + this.PERSON + '\'' + ", UNIT='" + this.UNIT + '\'' + ", CALLNAME='" + this.CALLNAME + '\'' + ", HASLD='" + this.HASLD + '\'' + ", REMARK='" + this.REMARK + '\'' + ", DESCRIPTION='" + this.DESCRIPTION + '\'' + ", ZXXT='" + this.ZXXT + '\'' + ", ZhiWei='" + this.ZHIWEI + '\'' + '}';
    }
}
