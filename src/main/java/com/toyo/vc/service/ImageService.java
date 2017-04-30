package com.toyo.vc.service;


import com.toyo.vc.dao.ImageMapper;
import com.toyo.vc.entity.Image;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Lsr on 11/5/14.
 */

@Service
public class ImageService {

    @Resource
    ImageMapper imageMapper;

    /**弁IDにより、画像リストを取得*/
    public List<Image> getImagesByKikisysId(String kikiSysId) {

        return imageMapper.findImagesByKikiSysId(kikiSysId);
    }
}
