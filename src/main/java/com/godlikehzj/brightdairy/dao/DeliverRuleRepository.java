package com.godlikehzj.brightdairy.dao;

import com.godlikehzj.brightdairy.bean.jpa.DeliverRule;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DeliverRuleRepository extends JpaRepository<DeliverRule, Long> {
    List<DeliverRule> findAllByOrderId(Long orderId);
}
