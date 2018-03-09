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
    private long customerId;
    private long dairyId;
    private int num;
    private Date startDay;
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
    @Column(name = "customer_id")
    public long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(long customerId) {
        this.customerId = customerId;
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
        if (customerId != order.customerId) return false;
        if (dairyId != order.dairyId) return false;
        if (num != order.num) return false;
        if (pay != order.pay) return false;
        if (startDay != null ? !startDay.equals(order.startDay) : order.startDay != null) return false;
        if (createTime != null ? !createTime.equals(order.createTime) : order.createTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (int) (customerId ^ (customerId >>> 32));
        result = 31 * result + (int) (dairyId ^ (dairyId >>> 32));
        result = 31 * result + num;
        result = 31 * result + (startDay != null ? startDay.hashCode() : 0);
        result = 31 * result + pay;
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        return result;
    }
}
