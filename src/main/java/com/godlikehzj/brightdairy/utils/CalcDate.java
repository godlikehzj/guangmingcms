package com.godlikehzj.brightdairy.utils;

import com.godlikehzj.brightdairy.bean.jpa.StopRule;

import java.text.SimpleDateFormat;
import java.util.*;

public class CalcDate {
    public static Date getEndDay(Date startDay, List<StopRule> rules, int days){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startDay);
        Set<Integer> month_day = new HashSet<>();
        Set<Integer> week_day = new HashSet<>();
        Set<String> simple_day = new HashSet<>();

        for(StopRule stopRule:rules){
            if (stopRule.getRuleType() == 0){
                String[] mds = stopRule.getRuleContent().split(",");
                for(String md:mds)
                    month_day.add(Integer.valueOf(md));
            }else if (stopRule.getRuleType() == 1){
                String[] wds = stopRule.getRuleContent().split(",");
                for(String wd : wds)
                    week_day.add(Integer.valueOf(wd));
            }else if (stopRule.getRuleType() == 2){
                String[] sds = stopRule.getRuleContent().split(",");
                Collections.addAll(simple_day, sds);
            }
        }
        for(int n = days; n > 0;){
            calendar.add(Calendar.DATE, 1);
            if (week_day.contains(calendar.get(Calendar.DAY_OF_WEEK)) ||
                month_day.contains(calendar.get(Calendar.DAY_OF_MONTH)) ||
                simple_day.contains(sdf.format(calendar.getTime())))
                continue;
            n--;
        }

        return calendar.getTime();
    }
}
