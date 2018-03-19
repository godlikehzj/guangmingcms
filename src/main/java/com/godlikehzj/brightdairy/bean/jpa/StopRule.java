package com.godlikehzj.brightdairy.bean.jpa;

import javax.persistence.*;

@Entity
@Table(name = "stop_rule", schema = "brightdairy", catalog = "")
public class StopRule {
    private long id;
    private long orderId;
    private byte ruleType;
    private String ruleContent;

    @Id
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "order_id")
    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    @Basic
    @Column(name = "rule_type")
    public byte getRuleType() {
        return ruleType;
    }

    public void setRuleType(byte ruleType) {
        this.ruleType = ruleType;
    }

    @Basic
    @Column(name = "rule_content")
    public String getRuleContent() {
        return ruleContent;
    }

    public void setRuleContent(String ruleContent) {
        this.ruleContent = ruleContent;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StopRule stopRule = (StopRule) o;

        if (id != stopRule.id) return false;
        if (orderId != stopRule.orderId) return false;
        if (ruleType != stopRule.ruleType) return false;
        if (ruleContent != null ? !ruleContent.equals(stopRule.ruleContent) : stopRule.ruleContent != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (int) (orderId ^ (orderId >>> 32));
        result = 31 * result + (int) ruleType;
        result = 31 * result + (ruleContent != null ? ruleContent.hashCode() : 0);
        return result;
    }
}
