package com.godlikehzj.brightdairy.controller;

import com.godlikehzj.brightdairy.bean.entity.Response;
import com.godlikehzj.brightdairy.bean.jpa.*;
import com.godlikehzj.brightdairy.dao.*;
import com.godlikehzj.brightdairy.utils.ApiStatus;
import com.godlikehzj.brightdairy.utils.CalcDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

    @Autowired
    private DeliverRuleRepository deliverRuleRepository;

    @Autowired
    private StopRuleRepository stopRuleRepository;

    @InitBinder
    public void InitBinder(HttpServletRequest request,
                           ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(
                "yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, null, new CustomDateEditor(
                dateFormat, true));
    }

    @RequestMapping(value = "list")
    public String getOrderList(Model model){
        //test
        List<Dorder> order = orderRepository.findAll();
        model.addAttribute("orders", order);

        List<PriceType> priceTypes = priceTypeRepository.findAll();
        model.addAttribute("priceTypes", priceTypes);

        return "order/list";
    }

    @RequestMapping(value = "detail")
    public String getOrderDetail(Model model, Long orderId){
        List<PriceType> priceTypes = priceTypeRepository.findAll();
        model.addAttribute("priceTypes", priceTypes);

        List<Area> areas = areaRepository.findAll();
        model.addAttribute("areas", areas);

        Dorder dorder = orderRepository.findOne(orderId);
        model.addAttribute("order", dorder);

        model.addAttribute("tab", 1);

        List<DeliverRule> deliverRules = deliverRuleRepository.findAllByOrderId(orderId);
        model.addAttribute("deliverRules", deliverRules);

        List<StopRule> stopRules = stopRuleRepository.findAllByOrderId(orderId);
        model.addAttribute("stopRules", stopRules);

        return "order/detail";
    }

    @RequestMapping(value = "delete")
    @ResponseBody
    public Response deleteCustomer(Long oid){
        orderRepository.delete(oid);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }

    @RequestMapping(value = "doModify")
    public String modifyOrder(Model model, Dorder dorder){
        List<PriceType> priceTypes = priceTypeRepository.findAll();
        model.addAttribute("priceTypes", priceTypes);

        List<Area> areas = areaRepository.findAll();
        model.addAttribute("areas", areas);
        Dorder old = orderRepository.findOne(dorder.getId());
        dorder.setCreateTime(old.getCreateTime());
        dorder.setEndDay(old.getEndDay());
        dorder.setCustomerId(old.getCustomerId());
        orderRepository.save(dorder);

        model.addAttribute("order", dorder);

        model.addAttribute("tab", 1);

        return "order/detail";
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
    public Response doAddOrder(Dorder order, DeliverRule deliverRule, StopRule stopRule){
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
            customer2.setCreateTime(customer.getCreateTime());
            customer2.setId(customer.getId());
        }
        customerRepository.save(customer2);
        order.setCreateTime(new Timestamp(now.getTime()));
        order.setCustomerId(customer2.getId());
        List<StopRule> stopRules = new ArrayList<>();
        if (!stopRule.getRuleContent().isEmpty())
            stopRules.add(stopRule);

        Integer days = Math.abs(Math.floorDiv(Math.negateExact(order.getRemainDeliver()), deliverRule.getNum()));
        Date endDay = CalcDate.getEndDay(deliverRule.getStartDate(), stopRules, days - 1);

        order.setEndDay(new java.sql.Date(endDay.getTime()));
        orderRepository.save(order);

        deliverRule.setOrderId(order.getId());
        deliverRuleRepository.save(deliverRule);

        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }
}
