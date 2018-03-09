package com.godlikehzj.brightdairy.bean.jpa;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;

@Entity
public class Customer {
    private long id;
    private String name;
    private String mobile;
    private String addr;
    private long area;
    private byte channel;
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

        Customer customer = (Customer) o;

        if (id != customer.id) return false;
        if (area != customer.area) return false;
        if (channel != customer.channel) return false;
        if (name != null ? !name.equals(customer.name) : customer.name != null) return false;
        if (mobile != null ? !mobile.equals(customer.mobile) : customer.mobile != null) return false;
        if (addr != null ? !addr.equals(customer.addr) : customer.addr != null) return false;
        if (createTime != null ? !createTime.equals(customer.createTime) : customer.createTime != null) return false;

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
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        return result;
    }
}
