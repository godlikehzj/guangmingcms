package com.godlikehzj.brightdairy.dao;

import com.godlikehzj.brightdairy.bean.jpa.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
    Customer findByNameAndMobile(String name, String mobile);
}
