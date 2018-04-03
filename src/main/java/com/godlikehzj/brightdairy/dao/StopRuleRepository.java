package com.godlikehzj.brightdairy.dao;

import com.godlikehzj.brightdairy.bean.jpa.StopRule;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StopRuleRepository extends JpaRepository<StopRule, Long> {
    List<StopRule> findAllByOrderId(Long orderId);
}
