package com.godlikehzj.brightdairy.bean.jpa;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
public class Dorder {
    private long id;
    private long customerId;
    private String name;
    private String mobile;
    private String optionalMobile;
    private String addr;
    private long area;
    private byte channel;
    private long priceId;
    private int buyNum;
    private int freeNum;
    private int remainDeliver;
    private Date endDay;
    private int pay;
    private Timestamp createTime;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "customer_id")
    public long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(long customerId) {
        this.customerId = customerId;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "mobile")
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Basic
    @Column(name = "optional_mobile")
    public String getOptionalMobile() {
        return optionalMobile;
    }

    public void setOptionalMobile(String optionalMobile) {
        this.optionalMobile = optionalMobile;
    }

    @Basic
    @Column(name = "addr")
    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    @Basic
    @Column(name = "area")
    public long getArea() {
        return area;
    }

    public void setArea(long area) {
        this.area = area;
    }

    @Basic
    @Column(name = "channel")
    public byte getChannel() {
        return channel;
    }

    public void setChannel(byte channel) {
        this.channel = channel;
    }

    @Basic
    @Column(name = "price_id")
    public long getPriceId() {
        return priceId;
    }

    public void setPriceId(long priceId) {
        this.priceId = priceId;
    }

    @Basic
    @Column(name = "buy_num")
    public int getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(int buyNum) {
        this.buyNum = buyNum;
    }

    @Basic
    @Column(name = "free_num")
    public int getFreeNum() {
        return freeNum;
    }

    public void setFreeNum(int freeNum) {
        this.freeNum = freeNum;
    }

    @Basic
    @Column(name = "remain_deliver")
    public int getRemainDeliver() {
        return remainDeliver;
    }

    public void setRemainDeliver(int remainDeliver) {
        this.remainDeliver = remainDeliver;
    }

    @Basic
    @Column(name = "end_day")
    public Date getEndDay() {
        return endDay;
    }

    public void setEndDay(Date endDay) {
        this.endDay = endDay;
    }

    @Basic
    @Column(name = "pay")
    public int getPay() {
        return pay;
    }

    public void setPay(int pay) {
        this.pay = pay;
    }

    @Basic
    @Column(name = "create_time")
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Dorder dorder = (Dorder) o;

        if (id != dorder.id) return false;
        if (customerId != dorder.customerId) return false;
        if (area != dorder.area) return false;
        if (channel != dorder.channel) return false;
        if (priceId != dorder.priceId) return false;
        if (buyNum != dorder.buyNum) return false;
        if (freeNum != dorder.freeNum) return false;
        if (remainDeliver != dorder.remainDeliver) return false;
        if (pay != dorder.pay) return false;
        if (name != null ? !name.equals(dorder.name) : dorder.name != null) return false;
        if (mobile != null ? !mobile.equals(dorder.mobile) : dorder.mobile != null) return false;
        if (optionalMobile != null ? !optionalMobile.equals(dorder.optionalMobile) : dorder.optionalMobile != null)
            return false;
        if (addr != null ? !addr.equals(dorder.addr) : dorder.addr != null) return false;
        if (endDay != null ? !endDay.equals(dorder.endDay) : dorder.endDay != null) return false;
        if (createTime != null ? !createTime.equals(dorder.createTime) : dorder.createTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (int) (customerId ^ (customerId >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (mobile != null ? mobile.hashCode() : 0);
        result = 31 * result + (optionalMobile != null ? optionalMobile.hashCode() : 0);
        result = 31 * result + (addr != null ? addr.hashCode() : 0);
        result = 31 * result + (int) (area ^ (area >>> 32));
        result = 31 * result + (int) channel;
        result = 31 * result + (int) (priceId ^ (priceId >>> 32));
        result = 31 * result + buyNum;
        result = 31 * result + freeNum;
        result = 31 * result + remainDeliver;
        result = 31 * result + (endDay != null ? endDay.hashCode() : 0);
        result = 31 * result + pay;
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        return result;
    }
}
