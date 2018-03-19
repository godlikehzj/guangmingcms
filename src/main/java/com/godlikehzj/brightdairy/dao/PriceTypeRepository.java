package com.godlikehzj.brightdairy.dao;

import com.godlikehzj.brightdairy.bean.jpa.PriceType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PriceTypeRepository extends JpaRepository<PriceType, Long> {
}
