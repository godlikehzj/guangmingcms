package com.godlikehzj.brightdairy.dao;

import com.godlikehzj.brightdairy.bean.jpa.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User getByName(String name);
}
