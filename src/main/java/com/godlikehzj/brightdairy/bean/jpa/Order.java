package com.godlikehzj.brightdairy.bean.jpa;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
public class Order {
    private long id;
    private String name;
    private String mobile;
    private String addr;
    private long area;
    private byte channel;
    private long dairyId;
    private int num;
    private Date startDay;
    private Date endDay;
    private int pay;
    private Timestamp createTime;

    @Id
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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
    @Column(name = "dairy_id")
    public long getDairyId() {
        return dairyId;
    }

    public void setDairyId(long dairyId) {
        this.dairyId = dairyId;
    }

    @Basic
    @Column(name = "num")
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Basic
    @Column(name = "start_day")
    public Date getStartDay() {
        return startDay;
    }

    public void setStartDay(Date startDay) {
        this.startDay = startDay;
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

        Order order = (Order) o;

        if (id != order.id) return false;
        if (area != order.area) return false;
        if (channel != order.channel) return false;
        if (dairyId != order.dairyId) return false;
        if (num != order.num) return false;
        if (pay != order.pay) return false;
        if (name != null ? !name.equals(order.name) : order.name != null) return false;
        if (mobile != null ? !mobile.equals(order.mobile) : order.mobile != null) return false;
        if (addr != null ? !addr.equals(order.addr) : order.addr != null) return false;
        if (startDay != null ? !startDay.equals(order.startDay) : order.startDay != null) return false;
        if (endDay != null ? !endDay.equals(order.endDay) : order.endDay != null) return false;
        if (createTime != null ? !createTime.equals(order.createTime) : order.createTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (mobile != null ? mobile.hashCode() : 0);
        result = 31 * result + (addr != null ? addr.hashCode() : 0);
        result = 31 * result + (int) (area ^ (area >>> 32));
        result = 31 * result + (int) channel;
        result = 31 * result + (int) (dairyId ^ (dairyId >>> 32));
        result = 31 * result + num;
        result = 31 * result + (startDay != null ? startDay.hashCode() : 0);
        result = 31 * result + (endDay != null ? endDay.hashCode() : 0);
        result = 31 * result + pay;
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        return result;
    }
}
