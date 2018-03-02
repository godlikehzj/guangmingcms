package com.godlikehzj.brightdairy.controller;

import com.godlikehzj.brightdairy.bean.jpa.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {
    @RequestMapping("/")
    public String welcome(HttpServletRequest request, Model model) {
//        User user = (User)request.getSession().getAttribute("user");
//        if (user != null){
//            model.addAttribute("user", user);
//        }else{
//            return "login";
//        }
        return "index";
    }
}
