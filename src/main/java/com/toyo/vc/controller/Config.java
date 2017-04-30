package com.toyo.vc.controller;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by zhangrui on 15/01/29.
 * 共有部分を定義する
 */
public class Config {

    /**機器分類　種別*/
    public static final String KikiBunRuiA = "弁本体";
    public static final String KikiBunRuiB = "駆動部";
    public static final String KikiBunRuiC = "補助部";
    public static final String KikiBunRuiD = "付属部";

    /**機器部類　Map sort用*/
    public static Map<String, String> kikiBunruiMap = createKikiBunruiMap();
    public static Map<String, String> createKikiBunruiMap() {
        Map<String,String> kikiBunruiMapTmp=new HashMap<String, String>();
        kikiBunruiMapTmp.put(KikiBunRuiA,"1");
        kikiBunruiMapTmp.put(KikiBunRuiB,"2");
        kikiBunruiMapTmp.put(KikiBunRuiC,"3");
        kikiBunruiMapTmp.put(KikiBunRuiD,"4");
        return kikiBunruiMapTmp;
    }

    /**部品　種別*/
    public static final String BuhinBunRuiA = "パッキン";
    public static final String BuhinBunRuiB = "ガスケット";
    public static final String BuhinBunRuiC = "グランドパッキン";

    /**部品　非石綿化*/
    public static final String AsbkbnA = "A";
    public static final String AsbkbnN = "N";
    public static final String AsbkbnF = "F";

    /**懸案　対応種別*/
    public static final String KenanNoTaiyo = "未対応";
    public static final String KenanFlg = "1";

    /**画像DL　種別*/
    public static final String ImageTypeGP = "GP";
    public static final String ImageTypeValve01="図面仕様書";
    public static final String ImageTypeValve02="点検報告書";
    public static final String ImageTypeValve03="懸案事項一覧";
    public static final String ImageTypeValve04="完成図面";
    public static final String ImageTypeValve05="作業指示書";
    public static final String ImageTypeValve06="弁棒ねじ検索記録";

    /**操作履歴用  テーブル名*/
    public static final String TKouji="kouji";
    public static final String TKoujirelation = "koujirelation";
    public static final String TReportImage = "reportImage";
    public static final String TTenkenRireki = "tenkenRireki";
    public static final String TReportimagekikisystem = "reportimagekikisystem";
    public static final String TKenan = "kenan";
    public static final String Tkikisystem="kikisystem";
    public static final String Tkiki = "kiki";

    public static final String TNameKouji="工事";
    public static final String TNameKoujirelation = "工事関係表";
    public static final String TNameReportImage = "工事図面";
    public static final String TNameTenkenRireki = "点検機器";
    public static final String TNameReportimagekikisystem = "図面関係表";
    public static final String TNameKenan = "懸案";
    public static final String TNamekikisystem="弁";
    public static final String TNamekiki = "機器";

    /**弁　操作履歴用*/
    public static final String TKoujiValveMultList = "弁リスト-複数検索";
    public static final String TKoujiValveList = "弁リスト-弁検索";
    public static final String TKoujiValveKikiList = "弁リスト-機器検索";
    public static final String TKoujiValveBuhinList = "弁リスト-部品検索";
    public static final String TKikisysSearch="弁検索";
    public static final String TKikisysDetail = "弁詳細へ";
    public static final String TKikiDetail = "機器詳細へ";
    public static final String TTenkenList = "弁点検リストへ";
    public static final String TImageList = "弁図面リストへ";
    public static final String TKenanList = "弁懸案リストへ";
    //DL用
    public static final String TDLForKikisysDetailList = "弁DL-部品リスト印刷";
    public static final String TDLForKikisysValveKenan = "弁DL-懸案リスト印刷";
    public static final String TDLForKikisysValveDetailForGP = "弁DL-GP仕様印刷";
    public static final String TDLForKikisysValveDaityo = "弁DL-台帳履歴印刷";
    public static final String TDLForKikisysValveTokuBetuKako = "特別加工記録印刷";
    public static final String TDLForKikisysValveSijisyo = "弁DL-指示書印刷";

    /**工事　操作履歴用*/
    public static final String TInsert = "新規追加";
    public static final String TEdit = "更新";
    public static final String TImageSyuEdit = "図面種別更新";
    public static final String TDelete = "削除";
    public static final String TKoujiIndexDetail = "工事詳細へ";
    public static final String TKoujiInstructDetail = "工事編集へ";
    public static final String TKoujiHistoryDetail = "工事履歴へ";
    public static final String TKoujiImageDetail = "工事図面へ";
    public static final String TKoujiKenanDetail = "工事懸案へ";
    public static final String TKoujiKenanPastDetail = "工事過去懸案へ";
    public static final String TKoujiPrintDetail = "工事DLへ";
    public static final String TKoujiPrintGPDetail = "工事GPへ";

    public static final String TKoujiAddValvePage = "点検弁追加画面へ";
    public static final String TKoujiAddKikiPage = "点検機器追加画面へ";
    public static final String TKoujiAddValve = "点検弁追加";
    public static final String TKoujiAddKiki = "点検機器追加";
    public static final String TKoujiAddKikisysRelation = "点検関係追加";
    public static final String TKoujiAddTenkenResult = "点検結果";

    public static final String TKoujiTenkenRank = "点検ランク設定";
    public static final String TKoujiTenkenRankALL = "点検ランク一括設定";
    public static final String TKoujiTenkenNaiyo = "点検内容設定";
    public static final String TKoujiTenkenResult = "点検結果設定";
    public static final String TKoujiTenkenBikou = "点検備考設定";


    //工事　DL用
    public static final String TDLForKoujiPrintReport = "工事DL-工事内容一覧DL";
    public static final String TDLForKoujiPrintKenanReport = "工事DL-懸案報告書DL";
    public static final String TDLForKoujiPrintKenan = "工事DL-過去未対応懸案リスト";
    public static final String TDLForKoujiPrintSagyo = "工事DL-作業ラベル";
    public static final String TDLForKoujiPrintValve = "工事DL-弁番号ラベル";
    public static final String TDLForKoujiPrintTenken = "工事DL-点検リストDL";
    public static final String TDLForKoujiPrintIcs = "工事DL-ICS点検リスト";
    public static final String TDLForKoujiPrintTool = "工事DL-工具点検リスト";

    public static final String TDLForKoujiPrintGP = "工事DL-GP";
    public static final String TDLForKoujiPrintGPIcs = "工事DL-ICS";
    public static final String TDLForKoujiPrintKanriDaiTyoForKikisysList = "工事DL-工場修理品入出荷管理台帳";


    public static final String TLogin="ログイン";
    public static final String TLogout="ログアウト";
    public static final String TUserNull = "サーバーへの接続がタイムアウトしました。 もう一度ログインしてください。";
    public static final String LoginSession="login";

    public static final Map<String, String> TableMap =
            new HashMap<String, String>() {{
                put(TNamekikisystem, Tkikisystem);
                put(TNamekiki, Tkiki);
                put(TNameKouji, TKouji);
                put(TNameKoujirelation, TKoujirelation);
                put(TNameReportImage, TReportImage);
                put(TNameTenkenRireki, TTenkenRireki);
                put(TNameReportimagekikisystem, TReportimagekikisystem);
                put(TNameKenan, TKenan);
            }};

    //guest　IP 取得
    public static String getIpAddr(HttpServletRequest request) {

        String ip = request.getHeader("x-forwarded-for");

        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {

            ip = request.getHeader("Proxy-Client-IP");

        }

        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {

            ip = request.getHeader("WL-Proxy-Client-IP");

        }

        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {

            ip = request.getRemoteAddr();

        }

        return ip;

    }

    /**弁単位で　DLファイル名*/
    //弁機器部品情報ファイル名
    public static final String ValveDetail="弁機器部品リスト.xlsx";
    public static final String ValveDetailTemplate="excel/KikisysBuhinDetail.xlsx";

    //弁GPファイル名
    public static final String ValveDetailForGP="弁GP仕様リスト.xlsx";
    public static final String ValveDetailForGPTemplate="excel/KikisysGP.xlsx";

    //弁懸案ファイル名
    public static final String  ValveKenan="弁懸案リスト.xlsx";
    public static final String ValveKenanTemplate="excel/KikisysKenan.xlsx";

    //弁台帳ファイル名
    public static final String  ValveDaityo="弁台帳リスト.xlsx";
    public static final String ValveDaityoTemplate="excel/KikisysDaityo.xlsx";

    //弁の特別加工記録明細書ファイル名
    public static final String  ValveTokuBetuKako="弁特別加工記録明細書.xlsx";
    public static final String ValveTokuBetuKakoTemplate="excel/KikisysTokuBetuKakoKiroku.xlsx";

    //弁の指示書ファイル名
    public static final String  ValveSijisyo="弁指示書.xlsx";
    public static final String ValveSijisyoTemplate="excel/KikisysSijisyo.xlsx";

    /**工事単位で　DLファイル名*/
    //未対応懸案ファイル名
    public static final String  KoujiKenan="工事の懸案リスト.xlsx";

    //作業ラベル
    public static final String  KoujiSagyoRabel="工事の作業ラベル.xlsx";
    public static final String  KoujiSagyoRabelTemplate="excel/KoujiSagyoRabel.xlsx";

    //弁ラベル
    public static final String  KoujiValveRabel="工事の弁ラベル.xlsx";
    public static final String  KoujiValveRabelNaikei="工事の弁ラベル（内径あり）.xlsx";
    public static final String  KoujiValveRabelTemplate="excel/KoujiValveRabel.xlsx";

    //点検リスト
    public static final String  KoujiTenkenList="工事の点検リスト.xlsx";
    public static final String  KoujiTenkenListTemplate="excel/KoujiTenkenList.xlsx";

    //点検報告書
    public static final String  KoujiTenkenReport="工事の点検内容一覧.xlsx";
    public static final String  KoujiTenkenReportTemplate="excel/KoujiTenkenReport.xlsx";

    //点検報告書new
    public static final String  KoujiTenkenReportNewTemplate="excel/KoujiTenkenReportNew.xlsx";

    //工具点検リスト
    public static final String  KoujiToolList="工事の工具点検リスト.xlsx";
    public static final String  KoujiToolListTemplate="excel/KoujiToolList.xlsx";

    //ICS点検リスト
    public static final String  KoujiIcsList="工事のICS点検リスト.xlsx";
    public static final String  KoujiIcsListTemplate="excel/KoujiIcsList.xlsx";

    //工場修理品入出荷管理台帳
    public static final String  KoujiKanriDaiTyoList="工事の工場修理品入出荷管理台帳.xlsm";
    public static final String  KoujiKanriDaiTyoListTemplate="excel/KoujiKanriDaiTyoList.xlsm";

}
