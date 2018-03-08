package com.godlikehzj.brightdairy.controller;

import com.godlikehzj.brightdairy.bean.entity.Response;
import com.godlikehzj.brightdairy.bean.jpa.Dairy;
import com.godlikehzj.brightdairy.dao.DairyRepository;
import com.godlikehzj.brightdairy.utils.ApiStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "dairy")
public class DairyController {
    @Autowired
    private DairyRepository dairyRepository;

    @RequestMapping(value = "list")
    public String getDairyList(Model model){
        List<Dairy> dairies = dairyRepository.findAll();
        model.addAttribute("dairies", dairies);

        return "dairy/list";
    }

    @RequestMapping(value = "toAdd")
    public String toAddDairy(Model model){
        return "dairy/add";
    }

    @RequestMapping(value = "doAdd")
    @ResponseBody
    public Response doAddDairy(Dairy dairy){
        dairyRepository.save(dairy);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }

    @RequestMapping(value = "toModify")
    public String toModifyDairy(Model model, Long did){
        Dairy dairy = dairyRepository.findOne(did);
        model.addAttribute("dairy", dairy);

        return "dairy/modify";
    }

    @RequestMapping(value = "doModify")
    @ResponseBody
    public Response doModifyDairy(Dairy dairy){
        dairyRepository.save(dairy);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }

    @RequestMapping(value = "delete")
    @ResponseBody
    public Response deleteDairy(Long did){
        dairyRepository.delete(did);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }
}
