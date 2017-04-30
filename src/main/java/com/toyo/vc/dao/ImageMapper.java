package com.toyo.vc.dao;



import com.toyo.vc.entity.Image;

import java.util.List;

/**
 * Created by Lsr on 11/5/14.
 */
public interface ImageMapper {

    /**弁IDにより、画像リストを取得*/
    List<Image> findImagesByKikiSysId(String kikiSysId);

}
