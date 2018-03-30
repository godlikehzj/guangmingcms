package com.godlikehzj.brightdairy.utils;

import com.godlikehzj.brightdairy.bean.jpa.StopRule;

import java.text.SimpleDateFormat;
import java.util.*;

public class CalcDate {
    private static Boolean checkSimpleRule(String cur, String[] rule){
        return rule != null &&  rule.length >= 2 && cur.compareTo(rule[0]) >=0 && cur.compareTo(rule[1]) <= 0;
    }

    public static Date getEndDay(Date startDay, List<StopRule> rules, int days){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startDay);
        Set<Integer> month_day = new HashSet<>();
        Set<Integer> week_day = new HashSet<>();
        String[] simple_day = null;

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
                simple_day = stopRule.getRuleContent().split(",");
            }
        }
        for(int n = days; n > 0;){
            if (week_day.contains(calendar.get(Calendar.DAY_OF_WEEK)) ||
                month_day.contains(calendar.get(Calendar.DAY_OF_MONTH)) ||
                    checkSimpleRule(sdf.format(calendar.getTime()), simple_day)){
                calendar.add(Calendar.DATE, 1);
                continue;
            }
            calendar.add(Calendar.DATE, 1);
            n--;
        }

        return calendar.getTime();
    }
}
