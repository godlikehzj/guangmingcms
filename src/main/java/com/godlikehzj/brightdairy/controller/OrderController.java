package com.godlikehzj.brightdairy.controller;

import com.godlikehzj.brightdairy.dao.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "order")
public class OrderController {
    @Autowired
    private OrderRepository orderRepository;


}
