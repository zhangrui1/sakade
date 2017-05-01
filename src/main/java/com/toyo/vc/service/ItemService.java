package com.toyo.vc.service;


import com.toyo.vc.dao.ItemMapper;
import com.toyo.vc.dto.ValveKikiForm;
import com.toyo.vc.entity.Buhin;
import com.toyo.vc.entity.Kiki;
import com.toyo.vc.entity.Kouji;
import com.toyo.vc.entity.Valve;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by zhangrui on 14/11/14.
 */
@Service
public class ItemService {

    @Resource
    ItemMapper itemMapper;

    /**弁情報により、弁リストを取得*/
    public List<Valve> getItemByValve(Valve valve){
        List<Valve> valves=itemMapper.findByValve(valve);
        return valves;
    }

    /**機器情報により、機器リストを取得*/
    public List<Kiki> getItemByKiki(Kiki kiki){
        List<Kiki> kikis=itemMapper.findByKiki(kiki);
        return kikis;
    }

    /**機器情報により、機器リストを取得*/
    public List<Integer> getKikisystemIDByKiki(Kiki kiki){
        List<Integer> kikis=itemMapper.findKikisystemIDByKiki(kiki);
        return kikis;
    }

    /**部品情報により、部品リストを取得*/
    public List<Buhin> getItemByBuhin(Buhin buhin){
        List<Buhin> buhins=itemMapper.findByBuhin(buhin);
        return buhins;
    }

    /**部品情報により、部品リストを取得*/
    public List<Integer> getKikisystemIDByBuhin(Buhin buhin){
        List<Integer> buhins=itemMapper.findKikisystemIDByBuhin(buhin);
        return buhins;
    }

    /**場所により、弁リストを取得*/
    public List<Valve> getItemByLocationName(String locationName){
        Valve tmpValve=new Valve();
        tmpValve.setLocationName(locationName);
        List<Valve> valve=itemMapper.findByLocationName(tmpValve);
        return valve;
    }

    /**弁番号と弁場所により、弁リストを取得*/
    public List<Valve> getItemByVNo(Valve valve){
        List<Valve> valves=itemMapper.findByVNo(valve);
        return valves;
    }

    /**場所により、弁リストを取得*/
    public List<Valve> getKikisysByVNo(Valve valve){
        List<Valve> valves=itemMapper.findKikisysByVNo(valve);
        return valves;
    }

    /**工事IDにより、弁リストを取得*/
    public List<Valve> getKikisysByKoujiId(String id){
        List<Valve> valves=itemMapper.findKikisysByKoujiId(id);
        return valves;
    }

    /**弁IDと主管係により、機器リストを取得*/
    public List<Kiki> getKikiByKikisysIdSyukan(String kikiSysId,String syukan){
        ValveKikiForm valveKikiForm=new ValveKikiForm();
        valveKikiForm.setKikiSysId(kikiSysId);
        valveKikiForm.setSyukan(syukan);
        List<Kiki> kiki=itemMapper.findKikiByKikisysIdSyukan(valveKikiForm);
        return kiki;
    }

    /**弁IDにより、機器を取得*/
    public List<Kiki> getKikiByKikisysId(String kikiSysId){
        List<Kiki> kiki=itemMapper.findKikiByKikisysId(kikiSysId);
        return kiki;
    }

    /**弁IDにより、弁を取得*/
    public Valve getKikisysByKikisysId(String kikiSysId){
        Valve valve=itemMapper.findKikisysBykikisysId(kikiSysId);
        return valve;
    }

    /**機器IDにより、機器を取得*/
    public Kiki getKikiByKikiId(String kikiId){
        Kiki kiki=itemMapper.findKikiByKikiId(kikiId);
        return kiki;
    }

    /**弁IDにより、懸案フラグを更新*/
    public Valve updateKenanFlgByKikisysId(String kikiSysId,String kenanFlg){
        Valve tmpValve=new Valve();
        tmpValve.setKenanFlg(kenanFlg);
        tmpValve.setKikiSysId(Integer.valueOf(kikiSysId));

        //append Date
        Date date = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        tmpValve.setUpdDate(sdf1.format(date));

        itemMapper.updateKenanFlgByKikisys(tmpValve);
        Valve valve=itemMapper.findKikisysBykikisysId(kikiSysId);
        return valve;
    }


    /**弁をkikisysテーブルに追加*/
    public Valve addValve(Valve valve) {

        //make sub id
        valve.setkCode("");
        valve.setKikiSysSeq("");

        //append Date
        Date date = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        valve.setTrkDate(sdf1.format(date));
        valve.setUpdDate(sdf1.format(date));
        valve.setDelFlg("0");
        valve.setKenanFlg("");
        valve.setGpFlg("0");

        itemMapper.insertValve(valve);

        //append id
        valve.setKikiSysId(itemMapper.getLastInsertId());
        return valve;
    }
    /**弁を更新*/
    public void updateValve(Valve valve) {
        //append Date
        Date date = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        valve.setUpdDate(sdf1.format(date));
        itemMapper.updateValveByValve(valve);
    }

    /**弁IDにより、弁を取得*/
    public Valve getValveByKikiSysId(String kikiSysId) {
        return itemMapper.findValveByKikiSysId(Integer.valueOf(kikiSysId));
    }

    /**弁IDにより、機器リストを取得*/
    public List<Kiki> getKikiBySysId(String KikiSysId){
        List<Kiki> kikiList = itemMapper.findKikiBySysId(Integer.valueOf(KikiSysId));
        return kikiList;
    }

    /**弁IDにより、弁を削除*/
    public void deleteKikiSystemByKikiSysId(String kikiSysId) {
        //append Date
        Valve valve =new Valve();
        Date date = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        valve.setUpdDate(sdf1.format(date));
        valve.setKikiSysId(Integer.valueOf(kikiSysId));

        itemMapper.deleteKikiSystemByKikiSysId(valve);
    }



}
