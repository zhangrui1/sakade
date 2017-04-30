package com.toyo.vc.controller;

import com.google.gson.Gson;
import com.toyo.vc.dao.ReportImageMapper;
import com.toyo.vc.dto.SearchResultObject;
import com.toyo.vc.entity.*;
import com.toyo.vc.service.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Lsr on 12/5/14.
 * 画像
 */

@Controller
@RequestMapping("/HistoryValve")
public class HistoryValveController {

    @Autowired
    HistoryValveService historyValveService;
    @Autowired
    UserService userService;


    /**
     * 履歴情報取得
     *
     * @return String　ユーザ情報編集画面
     * */
    @RequestMapping(value = "/getHisotryByKey/{vStartDate}", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getHisotryByKey(@PathVariable String vStartDate,HttpSession session,
                                  ModelMap modelMap){
        User user=(User)session.getAttribute("user");
        if(user == null){
            modelMap.addAttribute("message",Config.TUserNull);
            return Config.LoginSession;
        }
        HistoryValve historyValve=new HistoryValve();
        //append Date
        Date date = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");
        String todaytmp=sdf1.format(date);

        // カレンダークラスのインスタンスを取得
        Calendar cal = Calendar.getInstance();
        // 現在時刻を設定
        cal.getTime();
//        historyValve.sethIp(todaytmp);
        if("1".equals(vStartDate)){
            //今日
            historyValve.sethTrkDate(todaytmp);

        }else if("2".equals(vStartDate)){
            //1週間
            cal.add(Calendar.DATE, -7);
            todaytmp=sdf1.format(cal.getTime());
            historyValve.sethTrkDate(todaytmp);

        }else if("3".equals(vStartDate)){
            //1カ月
            cal.add(Calendar.MONTH, -1);
            todaytmp=sdf1.format(cal.getTime());
            historyValve.sethTrkDate(todaytmp);
        }
        List<HistoryValve> historyValveList=historyValveService.getHistoryValve(historyValve);
        session.setAttribute("historyValveList",historyValveList);
        session.setAttribute("historyValveKey",historyValve);
//        session.setAttribute("historyValveTableName",historyValveForm.gethTablename());

        return "history/vHistory";

    }


    /**
     * 履歴情報取得
     *
     * @return String　ユーザ情報編集画面
     * */
    @RequestMapping(value = "/getHisotryForToday", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String getHisotryForToday(HttpSession session,
                                     ModelMap modelMap){
        User user=(User)session.getAttribute("user");
        if(user == null){
            modelMap.addAttribute("message",Config.TUserNull);
            return Config.LoginSession;
        }
        //履歴リスト
        List<HistoryValve> historyValveList=historyValveService.getHistoryForToday();
        session.setAttribute("historyValveList",historyValveList);

        return "history/vHistory";

    }


}
