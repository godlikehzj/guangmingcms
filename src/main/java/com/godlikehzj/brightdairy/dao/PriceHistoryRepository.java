package com.godlikehzj.brightdairy.dao;

import com.godlikehzj.brightdairy.bean.jpa.PriceHistory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PriceHistoryRepository extends JpaRepository<PriceHistory, Long> {
    List<PriceHistory> findAllByPid(Long pid);
}
