package com.godlikehzj.brightdairy.controller;

import com.godlikehzj.brightdairy.bean.jpa.User;
import com.godlikehzj.brightdairy.dao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {
    @Autowired
    private UserRepository userRepository;
    @RequestMapping("/")
    public String welcome(HttpServletRequest request, Model model) {
        String name = (String)request.getSession().getAttribute("user");
        if (name != null){
            User user = userRepository.getByName(name);
            model.addAttribute("user", user);
        }else{
            return "login";
        }
        return "index";
    }
}
