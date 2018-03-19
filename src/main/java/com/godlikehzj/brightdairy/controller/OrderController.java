package com.godlikehzj.brightdairy.controller;

import com.godlikehzj.brightdairy.bean.entity.Response;
import com.godlikehzj.brightdairy.bean.jpa.*;
import com.godlikehzj.brightdairy.dao.*;
import com.godlikehzj.brightdairy.utils.ApiStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "order")
public class OrderController {
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private PriceTypeRepository priceTypeRepository;

    @Autowired
    private AreaRepository areaRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @RequestMapping(value = "list")
    public String getOrderList(Model model){
        List<Dorder> order = orderRepository.findAll();
        model.addAttribute("orders", order);

        List<PriceType> priceTypes = priceTypeRepository.findAll();
        model.addAttribute("priceTypes", priceTypes);

        return "order/list";
    }

    @RequestMapping(value = "toAdd")
    public String toAddOrder(Model model){
        List<PriceType> priceTypes = priceTypeRepository.findAll();
        model.addAttribute("priceTypes", priceTypes);

        List<Area> areas = areaRepository.findAll();
        model.addAttribute("areas", areas);

        return "order/add";
    }

    @RequestMapping(value = "doAdd")
    @ResponseBody
    public Response doAddOrder(Dorder order){
        Date now = new Date();
        Customer customer = customerRepository.findByNameAndMobile(order.getName(), order.getMobile());

        Customer customer2 = new Customer();
        customer2.setName(order.getName());
        customer2.setMobile(order.getMobile());
        customer2.setAddr(order.getAddr());
        customer2.setArea(order.getArea());
        customer2.setOptionalMobile(order.getOptionalMobile());

        if (customer == null){
            customer2.setCreateTime(new Timestamp(now.getTime()));
        }else{
            customer2.setId(customer.getId());
        }
        customerRepository.save(customer2);

        Integer days = order.getRemainDeliver();
        order.setCreateTime(new Timestamp(now.getTime()));
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(order.getCreateTime());
        calendar.add(Calendar.DATE, days);

        order.setCustomerId(customer.getId());
        order.setEndDay(new java.sql.Date(calendar.getTimeInMillis()));
        orderRepository.save(order);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }
}
