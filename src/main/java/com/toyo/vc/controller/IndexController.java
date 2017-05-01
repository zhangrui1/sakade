package com.toyo.vc.controller;

import com.toyo.vc.controller.utilities.StringUtil;
import com.toyo.vc.dao.KoujiMapper;
import com.toyo.vc.entity.Kouji;
import com.toyo.vc.entity.Location;
import com.toyo.vc.entity.TenkenRirekiUtil;
import com.toyo.vc.entity.User;
import com.toyo.vc.service.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by Lsr on 11/14/14.
 */

@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    KoujiService koujiService;
    @Autowired
    TenkenRirekiService tenkenRirekiService;
    @Autowired
    KenanService kenanService;
    @Autowired
    ItemService itemService;
    @Autowired
    KoujirelationService koujirelationService;
    @Autowired
    LuceneIndexService luceneIndexService;
    @Autowired
    LocationService locationService;
    @Resource
    KoujiMapper koujiMapper;
    @Autowired
    HistoryValveService historyValveService;

    /**
     * ログイン後のTopページ
     *
     * @return  String 最新作成、更新した弁(１０個)
     *
     * */
    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpSession session, ModelMap modelMap,HttpServletRequest request) throws IOException {
        //
        User user = (User) session.getAttribute("user");
        if(user == null){
            return Config.LoginSession;
        } else {
            //初期化
            Map<String,String> indexPath = (Map<String,String>)session.getAttribute("indexPath");
            if(indexPath==null) {
                indexPath = luceneIndexService.generateLocalIndex();
            }
            session.setAttribute("indexPath",indexPath);

            Directory indexKoujiFile= FSDirectory.open(new File(indexPath.get("indexKoujiFile")));
            Directory indexKoujirelationFile=FSDirectory.open(new File(indexPath.get("indexKoujirelationFile")));
            Directory indexTenkenRireki=FSDirectory.open(new File(indexPath.get("indexTenkenRireki")));
            Directory indexKoujiIDTenkenRireki=FSDirectory.open(new File(indexPath.get("indexKoujiIDTenkenRireki")));
            //最新工事、編集履歴をコメント　使わない
//            if(user.getKengen().equals("6")||user.getKengen().equals("5")){
//                List<Kouji> lastedKoujiList = koujiService.getLastedTenKoujiByPerson("");
//                List<Kouji> updatedKoujiList = koujiService.getUpdateTenKoujiByPerson("");
//                modelMap.addAttribute("lastedKoujiList",lastedKoujiList);
//                modelMap.addAttribute("updatedKoujiList",updatedKoujiList);
//
//                List<TenkenRirekiUtil> tenkenRirekiList=null;
//                modelMap.addAttribute("tenkenRirekiHistory",tenkenRirekiList);
//
//            } else {
//                List<Kouji> lastedKoujiList = koujiService.getLastedTenKoujiByPerson(user.getUserid());
//                List<Kouji> updatedKoujiList = koujiService.getUpdateTenKoujiByPerson(user.getUserid());
//                modelMap.addAttribute("lastedKoujiList",lastedKoujiList);
//                modelMap.addAttribute("updatedKoujiList",updatedKoujiList);
//
//                List<TenkenRirekiUtil> tenkenRirekiList=null;
//                modelMap.addAttribute("tenkenRirekiHistory",tenkenRirekiList);
//            }

            //get location
            List<Location> locationList = locationService.getAllLocation();
            List<String> nameList = new LinkedList<String>();
            for (int i = 0; i < locationList.size(); i++) {
                String tmpLocation= StringUtil.concatWithDelimit(" ", locationList.get(i).getkCodeL(), locationList.get(i).getkCodeM(), locationList.get(i).getkCodeS());
                if(!nameList.contains(tmpLocation)){
                    nameList.add(tmpLocation);
                }
            }
            //sessionにすでにある場合はsessionを使う
            String location=(String)session.getAttribute("locationNameSelectedForKouji");
            List<Kouji> koujiresult=(List<Kouji>)session.getAttribute("locationKoujiSelectedForKouji");
            if(StringUtil.isEmpty(location)){
                location="四国電力 坂出発電所 ２号機";
                koujiresult=koujiMapper.findKoujiByLocation(location);
            }

            session.setAttribute("locationNameSelectedForKouji",location);
            session.setAttribute("locationKoujiSelectedForKouji",koujiresult);
            session.setAttribute("locationKoujiNum",koujiresult.size());

            modelMap.addAttribute("nameList",nameList);
            session.setAttribute("locationList",locationList);
            modelMap.addAttribute("locationList", locationList);

            //historyテーブルを更新
            historyValveService.addHistoryValve("","",Config.TLogin,session,request);

            return "index";
        }
    }


    /**
     * ログアウト
     * */
    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout(HttpSession session,HttpServletRequest request){
        //historyテーブルを更新
        historyValveService.addHistoryValve("","",Config.TLogout,session,request);
        session.removeAttribute("user");
        return Config.LoginSession;
    }
}
