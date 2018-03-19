package com.godlikehzj.brightdairy.bean.jpa;

import javax.persistence.*;

@Entity
public class PriceType {
    private long id;
    private int price;
    private String name;
    private int deliverPrice;

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
    @Column(name = "price")
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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
    @Column(name = "deliver_price")
    public int getDeliverPrice() {
        return deliverPrice;
    }

    public void setDeliverPrice(int deliverPrice) {
        this.deliverPrice = deliverPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PriceType priceType = (PriceType) o;

        if (id != priceType.id) return false;
        if (price != priceType.price) return false;
        if (deliverPrice != priceType.deliverPrice) return false;
        if (name != null ? !name.equals(priceType.name) : priceType.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + price;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + deliverPrice;
        return result;
    }
}
