package com.toyo.vc.service;

import com.toyo.vc.dao.IcsMapper;
import com.toyo.vc.entity.Ics;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by zhangrui on 2015/2/4.
 */
@Service
public class IcsService {

    @Resource
    IcsMapper icsMapper;

    /**全部のicsデータを取得*/
    public List<Ics> getAllIcs() {

        List<Ics> icsList = icsMapper.findAllIcs();
        return  icsList;
    }

    /**IDにより、icsデータを取得*/
    public Ics getIcsByid(String id){
        Ics ics=icsMapper.findIcsById(id);
        return  ics;
    }

    /**ICS番号により、icsデータを取得*/
    public Ics getIcsByIcsNum(String icsNum){
        Ics tmpics=new Ics();
        tmpics.setIcsNum(icsNum);
        Ics ics=icsMapper.findIcsByIcsNum(icsNum);
        return  ics;
    }
}
