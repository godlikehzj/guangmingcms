package com.godlikehzj.brightdairy.controller;

import com.godlikehzj.brightdairy.bean.entity.Response;
import com.godlikehzj.brightdairy.bean.jpa.Area;
import com.godlikehzj.brightdairy.dao.AreaRepository;
import com.godlikehzj.brightdairy.utils.ApiStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "area")
public class AreaController {
    @Autowired
    private AreaRepository areaRepository;

    @RequestMapping(value = "list")
    public String getAreaList(Model model){
        List<Area> areas = areaRepository.findAll();
        model.addAttribute("areas", areas);
        return "area/list";
    }

    @RequestMapping(value = "toAdd")
    public String toAreaUser(Model model){
        return "area/add";
    }

    @RequestMapping(value = "doAdd")
    @ResponseBody
    public Response doAddArea(Area area){
        areaRepository.save(area);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }

    @RequestMapping(value = "toModify")
    public String toModifyArea(Model model, Long aid){
        Area area = areaRepository.findOne(aid);
        model.addAttribute("area", area);
        return "area/modify";
    }

    @RequestMapping(value = "doModify")
    @ResponseBody
    public Response doModifyArea(Area area){
        areaRepository.save(area);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }

    @RequestMapping(value = "delete")
    @ResponseBody
    public Response deleteUser(Long aid){
        areaRepository.delete(aid);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }
}
