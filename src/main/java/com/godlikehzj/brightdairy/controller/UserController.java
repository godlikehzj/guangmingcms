package com.godlikehzj.brightdairy.controller;

import com.godlikehzj.brightdairy.bean.entity.Response;
import com.godlikehzj.brightdairy.bean.jpa.Area;
import com.godlikehzj.brightdairy.bean.jpa.User;
import com.godlikehzj.brightdairy.dao.AreaRepository;
import com.godlikehzj.brightdairy.dao.UserRepository;
import com.godlikehzj.brightdairy.utils.ApiStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AreaRepository areaRepository;

    @RequestMapping(value = "login")
    @ResponseBody
    public Response login(HttpServletRequest request, User user){
        Response response = new Response();
        User user1 = userRepository.getByName(user.getName());
        if (user1 == null){
            response.setCode(201);
            response.setMsg("用户不存在");
        }else{
            if (!user1.getPassword().equals(user.getPassword())){
                response.setCode(202);
                response.setMsg("密码错误");
            }else{
                response.setCode(0);
                response.setMsg("登录成功");
                request.getSession().setAttribute("user", user1);
            }
        }
        return response;
    }

    @RequestMapping(value = "logout")
    @ResponseBody
    public Response logout(HttpServletRequest request){
        Response response = new Response();
        request.getSession().removeAttribute("user");
        response.setCode(0);
        return response;
    }

    @RequestMapping(value = "list")
    public String getUserList(Model model){
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "user/list";
    }

    @RequestMapping(value = "toAdd")
    public String toAddUser(Model model){
        List<Area> areas = areaRepository.findAll();
        model.addAttribute("areas", areas);
        return "user/add";
    }

    @RequestMapping(value = "doAdd")
    @ResponseBody
    public Response doAddUser(User user){
        userRepository.save(user);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }

    @RequestMapping(value = "toModify")
    public String toModifyUser(Model model, Long uid){
        User user = userRepository.findOne(uid);
        model.addAttribute("user", user);
        return "user/modify";
    }
}
