package com.godlikehzj.brightdairy.dao;

import com.godlikehzj.brightdairy.bean.jpa.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
