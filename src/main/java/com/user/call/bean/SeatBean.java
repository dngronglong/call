package com.user.call.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "USER_SEAT")
public class SeatBean {
    @Id
    private int USER_SEATID;
    private String LOGINID;
    private String QUEUEID;
    private String SEATID;
    private String MAXUSERID;
    private String EXTENSION;
    private String FWZ;

    public String getFWZ() {
        return this.FWZ;
    }

    public void setFWZ(String FWZ) {
        this.FWZ = FWZ;
    }

    public String getEXTENSION() {
        return this.EXTENSION;
    }

    public void setEXTENSION(String EXTENSION) {
        this.EXTENSION = EXTENSION;
    }

    public int getUSER_SEATID() {
        return this.USER_SEATID;
    }

    public void setUSER_SEATID(int USER_SEATID) {
        this.USER_SEATID = USER_SEATID;
    }

    public String getLOGINID() {
        return this.LOGINID;
    }

    public void setLOGINID(String LOGINID) {
        this.LOGINID = LOGINID;
    }

    public String getQUEUEID() {
        return this.QUEUEID;
    }

    public void setQUEUEID(String QUEUEID) {
        this.QUEUEID = QUEUEID;
    }

    public String getSEATID() {
        return this.SEATID;
    }

    public void setSEATID(String SEATID) {
        this.SEATID = SEATID;
    }

    public String getMAXUSERID() {
        return this.MAXUSERID;
    }

    public void setMAXUSERID(String MAXUSERID) {
        this.MAXUSERID = MAXUSERID;
    }

    public String toString() {
        return "SeatBean{USER_SEATID=" + this.USER_SEATID + ", LOGINID='" + this.LOGINID + '\'' + ", QUEUEID='" + this.QUEUEID + '\'' + ", SEATID='" + this.SEATID + '\'' + ", MAXUSERID='" + this.MAXUSERID + '\'' + ", EXTENSION='" + this.EXTENSION + '\'' + ", FWZ='" + this.FWZ + '\'' + '}';
    }
}
