package com.godlikehzj.brightdairy.controller;

import com.godlikehzj.brightdairy.bean.entity.Response;
import com.godlikehzj.brightdairy.bean.jpa.Dairy;
import com.godlikehzj.brightdairy.bean.jpa.PriceHistory;
import com.godlikehzj.brightdairy.bean.jpa.PriceType;
import com.godlikehzj.brightdairy.dao.DairyRepository;
import com.godlikehzj.brightdairy.dao.PriceHistoryRepository;
import com.godlikehzj.brightdairy.dao.PriceTypeRepository;
import com.godlikehzj.brightdairy.utils.ApiStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "dairy")
public class DairyController {
    @Autowired
    private DairyRepository dairyRepository;

    @Autowired
    private PriceTypeRepository priceTypeRepository;

    @Autowired
    private PriceHistoryRepository priceHistoryRepository;

    @RequestMapping(value = "list")
    public String getDairyList(Model model, Long pid){
        List<PriceType> priceTypes = priceTypeRepository.findAll();
        model.addAttribute("priceTypes", priceTypes);

        if (pid == null || pid == 0)
            if(priceTypes.size() > 0)
                pid = priceTypes.get(0).getId();

        List<Dairy> dairies = dairyRepository.findAllByPriceId(pid);
        model.addAttribute("dairies", dairies);

        List<PriceHistory> histories = priceHistoryRepository.findAllByPid(pid);
        model.addAttribute("histories", histories);

        model.addAttribute("pid", pid);

        Long did = 0L;
        if (dairies.size() > 0)
            did = dairies.get(0).getId();

        model.addAttribute("did", did);

        return "dairy/list";
    }

    @RequestMapping(value = "toAddPrice")
    public String toAddPrice(Model model){
        return "dairy/addPrice";
    }


    @RequestMapping(value = "toAddDairy")
    public String toAddDairy(Model model, Long pid){
        List<PriceType> priceTypes = priceTypeRepository.findAll();
        model.addAttribute("priceTypes", priceTypes);
        model.addAttribute("pid", pid);

        return "dairy/addDairy";
    }

    @RequestMapping(value = "doAddPrice")
    @ResponseBody
    public Response doAddPrice(PriceType priceType){
        priceTypeRepository.save(priceType);

        PriceHistory priceHistory = new PriceHistory();
        priceHistory.setPid(priceType.getId());
        priceHistory.setPrice(priceType.getPrice());
        priceHistory.setDeliverPrice(priceType.getDeliverPrice());
        priceHistory.setStartDate(new Timestamp(new Date().getTime()));
        priceHistory.setEndDate(null);
        priceHistoryRepository.save(priceHistory);

        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), priceType.getId());
    }

    @RequestMapping(value = "doAddDairy")
    @ResponseBody
    public Response doAddDairy(Dairy dairy){
        dairyRepository.save(dairy);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), dairy.getPriceId());
    }

    @RequestMapping(value = "toModifyPrice")
    public String toModifyPrice(Model model, Long pid){
        PriceType priceType = priceTypeRepository.findOne(pid);
        model.addAttribute("priceType", priceType);

        return "dairy/modifyPrice";
    }

    @RequestMapping(value = "toModifyDairy")
    public String toModifyDairy(Model model, Long did){
        List<PriceType> priceTypes = priceTypeRepository.findAll();
        model.addAttribute("priceTypes", priceTypes);

        Dairy dairy = dairyRepository.findOne(did);
        model.addAttribute("dairy", dairy);

        return "dairy/modifyDairy";
    }

    @RequestMapping(value = "doModifyPrice")
    @ResponseBody
    public Response doModifyPrice(PriceType priceType){
        PriceType old = priceTypeRepository.findOne(priceType.getId());

        if (old.getPrice() != priceType.getPrice() || old.getDeliverPrice() != priceType.getDeliverPrice()){
            Timestamp now = new Timestamp(new Date().getTime());

            List<PriceHistory> histories = priceHistoryRepository.findAllByPid(priceType.getId());
            if (histories.size() > 0){
                PriceHistory last = histories.get(histories.size() - 1);
                last.setEndDate(now);
            }

            PriceHistory priceHistory = new PriceHistory();
            priceHistory.setPid(priceType.getId());
            priceHistory.setPrice(priceType.getPrice());
            priceHistory.setDeliverPrice(priceType.getDeliverPrice());
            priceHistory.setStartDate(now);
            priceHistory.setEndDate(null);
            priceHistoryRepository.save(priceHistory);
        }

        priceTypeRepository.save(priceType);

        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), priceType.getId());
    }

    @RequestMapping(value = "doModifyDairy")
    @ResponseBody
    public Response doModifyDairy(Dairy dairy){
        dairyRepository.save(dairy);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), dairy.getPriceId());
    }

    @RequestMapping(value = "deletePrice")
    @ResponseBody
    public Response deletePrice(Long pid){
        priceTypeRepository.delete(pid);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
    }

    @RequestMapping(value = "deleteDairy")
    @ResponseBody
    public Response deleteDairy(Long did){
        Dairy dairy = dairyRepository.findOne(did);
        dairyRepository.delete(did);
        return new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), dairy.getPriceId());
    }
}
