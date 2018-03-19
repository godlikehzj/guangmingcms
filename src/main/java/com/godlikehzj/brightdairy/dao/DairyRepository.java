package com.godlikehzj.brightdairy.dao;

import com.godlikehzj.brightdairy.bean.jpa.Dairy;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DairyRepository extends JpaRepository<Dairy, Long> {
    List<Dairy> findAllByPriceId(Long priceId);
 }
