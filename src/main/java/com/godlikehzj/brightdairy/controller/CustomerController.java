package com.godlikehzj.brightdairy.controller;

import com.godlikehzj.brightdairy.bean.entity.Response;
import com.godlikehzj.brightdairy.bean.jpa.Area;
import com.godlikehzj.brightdairy.bean.jpa.Customer;
import com.godlikehzj.brightdairy.dao.AreaRepository;
import com.godlikehzj.brightdairy.dao.CustomerRepository;
import com.godlikehzj.brightdairy.utils.ApiStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "customer")
public class CustomerController {
    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private AreaRepository areaRepository;

    @RequestMapping(value = "list")
    public String getCustomerList(Model model){
        List<Customer> customers = customerRepository.findAll();
        model.addAttribute("customers", customers);

        List<Area> areas = areaRepository.findAll();
        model.addAttribute("areas", areas);

        return "customer/list";
    }

    @RequestMapping(value = "toAdd")
    public String toAddCustomer(Model model){
        List<Area> areas = areaRepository.findAll();
        model.addAttribute("areas", areas);
        return "customer/add";
    }

    @RequestMapping(value = "doAdd")
    @ResponseBody
    public Response doAddCustomer(Customer customer){
        customerRepository.save(customer);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }

    @RequestMapping(value = "toModify")
    public String toModifyCustomer(Model model, Long cid){
        Customer customer = customerRepository.findOne(cid);
        model.addAttribute("customer", customer);

        List<Area> areas = areaRepository.findAll();
        model.addAttribute("areas", areas);
        return "customer/modify";
    }

    @RequestMapping(value = "doModify")
    @ResponseBody
    public Response doModifyCustomer(Customer customer){
        customerRepository.save(customer);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }

    @RequestMapping(value = "delete")
    @ResponseBody
    public Response deleteCustomer(Long cid){
        customerRepository.delete(cid);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }
}
