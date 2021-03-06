package com.toyo.vc.controller;

import com.toyo.vc.controller.utilities.StringUtil;
import com.toyo.vc.dao.ItemMapper;
import com.toyo.vc.entity.*;
import com.toyo.vc.service.HistoryValveService;
import com.toyo.vc.service.LocationService;
import com.toyo.vc.service.MasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Lsr on 12/4/14.
 */
@Controller
@RequestMapping("/list")
public class ListController {
    @Resource
    ItemMapper itemMapper;
    @Autowired
    LocationService locationService;
    @Autowired
    MasterService masterService;
    @Autowired
    HistoryValveService historyValveService;

    //工事検索結果画面へ遷移
    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap modelMap,HttpSession session){
        //session　check
        User user = (User) session.getAttribute("user");
        if(user == null){
            modelMap.addAttribute("message",Config.TUserNull);
            return Config.LoginSession;
        }

        List<Kouji> searchKoujiList = (List<Kouji>) session.getAttribute("searchKoujiList");
        List<TenkenRirekiUtil> tenkenRirekiList = (List<TenkenRirekiUtil>) session.getAttribute("tenkenRirekiHistory");
        modelMap.addAttribute("searchKoujiList",searchKoujiList);
        modelMap.addAttribute("tenkenRirekiHistory",tenkenRirekiList);
        modelMap.addAttribute("user",user);

        //get location
        List<Location> locationList = locationService.getAllLocation();
        List<String> nameList = new LinkedList<String>();
        for (int i = 0; i < locationList.size(); i++) {
            String tmpLocation= StringUtil.concatWithDelimit(" ",locationList.get(i).getkCodeL(),locationList.get(i).getkCodeM(),locationList.get(i).getkCodeS());
            if(!nameList.contains(locationList.get(i).getkCodeL())){
                nameList.add(locationList.get(i).getkCodeL());
            }
            if(!nameList.contains(tmpLocation)){
               nameList.add(tmpLocation);
            }
        }
        modelMap.addAttribute("nameList",nameList);
        session.setAttribute("locationList",locationList);
        modelMap.addAttribute("locationList", locationList);
        return "list/kouji";
    }


    //点検検索画面へ遷移
    @RequestMapping(value = "/tenken", method = RequestMethod.GET)
    public String tenken(){
        return "list/tenken";
    }

    //弁検索画面へ遷移
    @RequestMapping(value = "/valve", method = RequestMethod.GET)
    public String valve(ModelMap modelMap,HttpSession session,HttpServletRequest request){
        //session　check
        User user=(User)session.getAttribute("user");
        if(user == null){
            modelMap.addAttribute("message",Config.TUserNull);
            return Config.LoginSession;
        }
        //get location
        List<Location> locationList = locationService.getAllLocation();
        List<String> nameList = new LinkedList<String>();
        for (int i = 0; i < locationList.size(); i++) {
            String tmpLocation= StringUtil.concatWithDelimit(" ",locationList.get(i).getkCodeL(),locationList.get(i).getkCodeM(),locationList.get(i).getkCodeS());
            if(!nameList.contains(locationList.get(i).getkCodeL())){
                nameList.add(locationList.get(i).getkCodeL());
            }
            if(!nameList.contains(tmpLocation)){
                nameList.add(tmpLocation);
            }
        }

        //会社名をsessionから取得
        String location=(String)session.getAttribute("locationNameSelectedForValve");
        if(StringUtil.isEmpty(location)){
            location="全部会社名";
        }
        //valve取得
        List<Valve> valveResults=(List<Valve>)session.getAttribute("valveResultsForKikisys");
        if(CollectionUtils.isEmpty(valveResults)){
            valveResults=new ArrayList<Valve>();
        }
        //keyword取得
        String KikisysSearchKeyword=(String)session.getAttribute("KikisysSearchKeyword");
        if(KikisysSearchKeyword==null){
            KikisysSearchKeyword="";
        }
        //弁検索場合は１、機器検索場合は２、部品検索場合は３
        String kikiOrBenFlg="1";
        session.setAttribute("locationNameSelectedForValve",location);
        session.setAttribute("valveResultsForKikisys",valveResults);
        session.setAttribute("KikisysSearchKeyword",KikisysSearchKeyword);
        session.setAttribute("nameList",nameList);
        session.setAttribute("locationList",locationList);
        session.setAttribute("kikiOrBenFlg",kikiOrBenFlg);
        session.setAttribute("valveSearchitemNum",valveResults.size());
        modelMap.addAttribute("KikisysSearchKeyword",KikisysSearchKeyword);
        modelMap.addAttribute("nameList",nameList);
        modelMap.addAttribute("valveResultsForKikisys",valveResults);
        modelMap.addAttribute("valveSearchitemNum",valveResults.size());

        //historyテーブルを更新
        historyValveService.addHistoryValve("","",Config.TKoujiValveList,session,request);
        return "list/valve";
    }
    //弁検索➡機器検索画面へ遷移
    @RequestMapping(value = "/kikiSearch", method = RequestMethod.GET)
    public String kikiSearch(ModelMap modelMap,HttpSession session,HttpServletRequest request){
        //session　check
        User user=(User)session.getAttribute("user");
        if(user == null){
            modelMap.addAttribute("message",Config.TUserNull);
            return Config.LoginSession;
        }
        //get location
        List<String> nameList = (List<String>)session.getAttribute("nameList");
        if(CollectionUtils.isEmpty(nameList)){
            List<Location> locationList = locationService.getAllLocation();
            for (int i = 0; i < locationList.size(); i++) {
                String tmpLocation= StringUtil.concatWithDelimit(" ",locationList.get(i).getkCodeL(),locationList.get(i).getkCodeM(),locationList.get(i).getkCodeS());
                if(!nameList.contains(locationList.get(i).getkCodeL())){
                    nameList.add(locationList.get(i).getkCodeL());
                }
                if(!nameList.contains(tmpLocation)){
                    nameList.add(tmpLocation);
                }
            }
        }
        //sessionにすでにある場合はsessionを使う
        String locationKikiSearchSelected=(String)session.getAttribute("locationKikiSearchSelected");
        if(locationKikiSearchSelected==null){
            locationKikiSearchSelected="全部会社名";
        }

        List<ValveForDL> itemResults=(List<ValveForDL>)session.getAttribute("kikiSearchitemResults");
        if(CollectionUtils.isEmpty(itemResults)){
            itemResults=new ArrayList<ValveForDL>();
        }
        String keywordMessage=(String)session.getAttribute("keywordMessage");
        if(keywordMessage==null){
            keywordMessage="";
        }
        //弁検索場合は１、機器検索場合は２、部品検索場合は３
        String kikiOrBenFlg="2";
        modelMap.addAttribute("kikiSearchitemResults",itemResults);
        modelMap.addAttribute("kikiSearchitemNum",itemResults.size());
        modelMap.addAttribute("nameList",nameList);
        modelMap.addAttribute("locationKikiSearchSelected",locationKikiSearchSelected);
        session.setAttribute("kikiSearchitemResults",itemResults);
        session.setAttribute("kikiSearchitemNum",itemResults.size());
        session.setAttribute("keywordMessage",keywordMessage);
        session.setAttribute("kikiOrBenFlg",kikiOrBenFlg);
        session.setAttribute("nameList",nameList);
        session.setAttribute("locationKikiSearchSelected",locationKikiSearchSelected);
        //historyテーブルを更新
        historyValveService.addHistoryValve("","",Config.TKoujiValveKikiList,session,request);
        return "list/valvekikiList";
    }
    //弁検索➡機器検索画面へ遷移
    @RequestMapping(value = "/buhinSearch", method = RequestMethod.GET)
    public String buhinSearch(ModelMap modelMap,HttpSession session,HttpServletRequest request){
        //session　check
        User user=(User)session.getAttribute("user");
        if(user == null){
            modelMap.addAttribute("message",Config.TUserNull);
            return Config.LoginSession;
        }
        //get location
        List<String> nameList = (List<String>)session.getAttribute("nameList");
        if(CollectionUtils.isEmpty(nameList)){
            List<Location> locationList = locationService.getAllLocation();
            for (int i = 0; i < locationList.size(); i++) {
                String tmpLocation= StringUtil.concatWithDelimit(" ",locationList.get(i).getkCodeL(),locationList.get(i).getkCodeM(),locationList.get(i).getkCodeS());
                if(!nameList.contains(locationList.get(i).getkCodeL())){
                    nameList.add(locationList.get(i).getkCodeL());
                }
                if(!nameList.contains(tmpLocation)){
                    nameList.add(tmpLocation);
                }
            }
        }
        //sessionにすでにある場合はsessionを使う
        String locationBuhinSearchSelected=(String)session.getAttribute("locationBuhinSearchSelected");
        if(locationBuhinSearchSelected==null){
            locationBuhinSearchSelected="全部会社名";
        }

        List<ValveForDL> itemResults=(List<ValveForDL>)session.getAttribute("buhinSearchitemResults");
        if(CollectionUtils.isEmpty(itemResults)){
            itemResults=new ArrayList<ValveForDL>();
        }
        String buhinKeywordMessage=(String)session.getAttribute("buhinKeywordMessage");
        if(buhinKeywordMessage==null){
            buhinKeywordMessage="";
        }
        //弁検索場合は１、機器検索場合は２、部品検索場合は３
        String kikiOrBenFlg="3";
        modelMap.addAttribute("buhinSearchitemResults",itemResults);
        modelMap.addAttribute("buhinSearchitemNum",itemResults.size());
        modelMap.addAttribute("nameList",nameList);
        modelMap.addAttribute("locationBuhinSearchSelected",locationBuhinSearchSelected);
        session.setAttribute("buhinSearchitemResults",itemResults);
        session.setAttribute("buhinSearchitemNum",itemResults.size());
        session.setAttribute("buhinKeywordMessage",buhinKeywordMessage);
        session.setAttribute("kikiOrBenFlg",kikiOrBenFlg);
        session.setAttribute("nameList",nameList);
        session.setAttribute("locationBuhinSearchSelected",locationBuhinSearchSelected);

        //historyテーブルを更新
        historyValveService.addHistoryValve("","",Config.TKoujiValveBuhinList,session,request);
        return "list/valvebuhinList";
    }

    //弁、機器、部品複数　検索画面へ遷移
    @RequestMapping(value = "/valveMult", method = RequestMethod.GET)
    public String valveMult(ModelMap modelMap,HttpSession session,HttpServletRequest request){
        //session　check
        User user=(User)session.getAttribute("user");
        if(user == null){
            modelMap.addAttribute("message",Config.TUserNull);
            return Config.LoginSession;
        }
        //get location
        List<Location> locationList = locationService.getAllLocation();
        List<String> nameList = new LinkedList<String>();
        for (int i = 0; i < locationList.size(); i++) {
            String tmpLocation= StringUtil.concatWithDelimit(" ",locationList.get(i).getkCodeL(),locationList.get(i).getkCodeM(),locationList.get(i).getkCodeS());
            if(!nameList.contains(locationList.get(i).getkCodeL())){
                nameList.add(locationList.get(i).getkCodeL());
            }
            if(!nameList.contains(tmpLocation)){
                nameList.add(tmpLocation);
            }
        }


        //会社名をsessionから取得
//        String location=(String)session.getAttribute("locationNameSelectedForValve");
        String location="四国電力 坂出発電所 ２号機";
//        if(StringUtil.isEmpty(location)){
//            location="四国電力 坂出発電所 ２号機";
//        }
        //valve取得
        List<Valve> valveMultResults=(List<Valve>)session.getAttribute("valveMultResultsForKikisys");
        if(CollectionUtils.isEmpty(valveMultResults)){
            valveMultResults=new ArrayList<Valve>();
        }
        //get syukan
        List<Master> syukanList=new LinkedList<Master>();
        syukanList=masterService.getMasterByType("主管係");

        //弁検索場合は１、機器検索場合は２、部品検索場合は３,複数場合は4
        String kikiOrBenFlg="4";
        session.setAttribute("valveMultResultsForKikisys",valveMultResults);
        session.setAttribute("nameList",nameList);
        session.setAttribute("syukanList",syukanList);
        session.setAttribute("locationList",locationList);
        session.setAttribute("kikiOrBenFlg",kikiOrBenFlg);
        session.setAttribute("valveMultSearchitemNum",valveMultResults.size());

        //historyテーブルを更新
        historyValveService.addHistoryValve("","",Config.TKoujiValveMultList,session,request);
        return "list/valveMult";
    }

    //懸案検索画面へ遷移
    @RequestMapping(value = "/kenan", method = RequestMethod.GET)
    public String kenan(ModelMap modelMap,HttpSession session){
        User user = (User) session.getAttribute("user");
        String keyword=(String) session.getAttribute("keyword");
        //session　check
        if(user == null){
            modelMap.addAttribute("message",Config.TUserNull);
            return Config.LoginSession;
        }

        if(keyword!=null){
            modelMap.addAttribute("keyword",keyword);
            session.setAttribute("keyword",keyword);
            return "redirect:/kenan/search";
        }else{
            return "list/kenan";
        }
    }

}
