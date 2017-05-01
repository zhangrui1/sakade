<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../htmlframe/headFrame.jsp" />
<body class="skin-black">
<c:import url="../htmlframe/headerFrame.jsp" />

<div class="container">
<!-- Left side column. contains the logo and sidebar -->
<style type="text/css">

    .master-li:hover{
        cursor:pointer;
        background-color: #eee;
    }
    .master-a:hover{
        cursor:pointer;
    }
</style>
<!-- Right side column. Contains the navbar and content of the page -->

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            新規登録
        </h1>
        <%--<ol class="breadcrumb">--%>
            <%--<li><a href="#"><i class="fa fa-dashboard"></i> Index</a></li>--%>
            <%--<li class="active">弁情報登録</li>--%>
        <%--</ol>--%>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-md-12">
                <div hidden id="checkValueForVno" class="alert alert-success alert-dismissable checkValueForVno"></div>
                <div hidden id="checkResult" class="checkResult">1</div>
            </div>
        </div>


        <div class="row">
        <form role="form" id="valveForm" name="valveForm"class="box-body-form" method="post" action="/sakade/item/add" onsubmit="return checkValve()">
            <!-- collection -->

            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header box-panel">
                        <h3 class="box-title">弁情報</h3>
                    </div>


                        <div class="box-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1">
                                        弁番号:
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="VNo" name="VNo" class="form-control" placeholder="弁番号(必須)" value="${valve.vNo}">
                                    </div>
                                    <div class="col-md-1">識番:</div>
                                    <div class="col-md-1">
                                        <input type="text" id="VNoSub" name="VNoSub" class="form-control" placeholder="識番" value="${valve.vNoSub}">
                                    </div>
                                    <div class="col-md-1">
                                        弁名称:
                                    </div>
                                    <div class="col-md-5">
                                        <input type="text" id="BenMeisyo" name="BenMeisyo" class="form-control" placeholder="弁名称(必須)" value="${valve.benMeisyo}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1">
                                        設置設備:
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="SetSetubi" name="SetSetubi" class="form-control" placeholder="設置設備" value="${valve.setSetubi}">
                                    </div>
                                    <div class="col-md-1">
                                        設置機器:
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="SetKiki" name="SetKiki" class="form-control" placeholder="設置機器" value="${valve.setKiki}">
                                    </div>
                                    <div class="col-md-1">
                                        設置場所:
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="SetBasyo" name="SetBasyo" class="form-control" placeholder="設置場所" value="${valve.setBasyo}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1">
                                        系統:
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="Keitou" name="Keitou" class="form-control" placeholder="系統" value="${valve.keitou}">
                                    </div>
                                    <%--<div class="col-md-6">--%>
                                        <%--<input type="text" id="Kougu" name="Kougu" class="form-control" placeholder="工具" value="${valve.kougu}">--%>
                                    <%--</div>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1">
                                        工具メガネ:
                                    </div>
                                    <div class="col-md-1">
                                        <input type="text" id="Kougu1M" name="Kougu1M" class="form-control" placeholder="工具 メガネ" value="${valve.kougu1M}">
                                    </div>
                                    <div class="col-md-1">
                                        工具スパナ:
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="Kougu2S" name="Kougu2S" class="form-control" placeholder="工具 スパナ" value="${valve.kougu2S}">
                                    </div>
                                    <div class="col-md-1">
                                        工具定盤:
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="Kougu3T" name="Kougu3T" class="form-control" placeholder="工具 定盤" value="${valve.kougu3T}">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        工具六角レンチ:
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="Kougu4L" name="Kougu4L" class="form-control" placeholder="工具 六角レンチ" value="${valve.kougu4L}">
                                    </div>
                                    <div class="col-md-2">
                                        工具その他:
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" id="Kougu5O" name="Kougu5O" class="form-control" placeholder="工具 その他" value="${valve.kougu5O}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        設置プラント(必須):
                                    </div>
                                    <div class="col-md-8" id="location-master-div">
                                        <input type="text" id="locationName" name="locationName" class="form-control master-toggle" readonly="true" value="${valve.locationName}">
                                        <div class="panel panel-default dropdown-panel" id="location-master">
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <input type="text" id="kCodeL-input" readonly="true" class="form-control" placeholder="会社名" />
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="text" id="kCodeM-input" readonly="true" class="form-control" placeholder="発電所" />
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input type="text" id="kCodeS-input" readonly="true" class="form-control" placeholder="機器名" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <select class="form-control" id="kCodeL-select">
                                                                <option></option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <select class="form-control" id="kCodeM-select">
                                                                <option></option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <select class="form-control" id="kCodeS-select">
                                                                <option></option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2"><input type="button" id="master-location-confirm" class="btn btn-block btn-success" value="確定"></div>
                                                    <div class="col-md-2"><input type="button" id="master-location-cancel" class="btn btn-block btn-default" value="取消"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <%--<button class="btn btn-success" onclick="CheckValueVno();return false;">弁番号チック</button>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <%--<div class="col-md-2">--%>
                                        <%--<input type="button" class="btn btn-primary"  value="ICS番号"/>--%>
                                    <%--</div>--%>
                                    <%--<div class="col-md-10">--%>
                                        <%--<input type="text" id="ics" name="ics" class="form-control" value="${valve.ics}">--%>
                                    <%--</div>--%>
                                    <div class="col-md-2">
                                        <input type="button" class="btn btn-primary master-ics" onclick="getIcsMaster(this)" data-toggle="modal" data-target="#masterModal" id="20" value="ICS番号" />
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" id="ics" name="ics" class="form-control ics" placeholder="ICS番号" value="${valve.ics}">
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.box-body -->

                </div>

                <div class="box box-danger">
                    <div class="box-header box-panel">
                        <h3 class="box-title">弁仕様</h3>
                    </div>

                        <div class="box-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1">
                                        圧力:
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="AturyokuMax" name="AturyokuMax" class="form-control" placeholder="圧力" value="${valve.aturyokuMax}">
                                    </div>
                                    <div class="col-md-1">
                                        単位:
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="Tani" name="Tani" class="form-control" placeholder="単位" value="${valve.tani}">
                                    </div>
                                    <div class="col-md-1">
                                        温度:
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="OndoMax" name="OndoMax" class="form-control" placeholder="温度℃" value="${valve.ondoMax}" >
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1">
                                        <input type="button" class="btn btn-danger master-ryutai" onclick="getMasterByType(this)" data-toggle="modal" data-target="#masterModal" value="流体" />
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="ryutaiRyaku" name="ryutaiRyaku" class="form-control ryutai" placeholder="略称" value="${valve.ryutaiRyaku}">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="ryutai" name="ryutai" class="form-control ryutai" placeholder="規格記号" value="${valve.ryutai}">
                                    </div>
                                    <div class="col-md-1">
                                        <input type="button" class="btn btn-danger master-keisiki" onclick="getMasterByType(this)" data-toggle="modal" data-target="#masterModal" id="7" value="形式" />

                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="keisikiRyaku" name="keisikiRyaku" class="form-control keisiki" placeholder="略称" value="${valve.keisikiRyaku}">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="keisiki" name="keisiki" class="form-control keisiki" placeholder="規格記号" value="${valve.keisiki}">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1">
                                        <input type="button" class="btn btn-danger master-sousa" onclick="getMasterByType(this)" data-toggle="modal" data-target="#masterModal" id="8" value="駆動方式" />
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="sousaRyaku" name="sousaRyaku" class="form-control sousa" placeholder="略称" value="${valve.sousaRyaku}">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="sousa" name="sousa" class="form-control sousa" placeholder="規格記号" value="${valve.sousa}">
                                    </div>
                                    <div class="col-md-1">
                                        <input type="button" class="btn btn-danger master-classType" onclick="getMasterByType(this)" data-toggle="modal" data-target="#masterModal" id="9" value="クラス" />

                                    </div>
                                    <div class="col-md-2" style="display:none">
                                        <input type="text" id="classRyaku" name="classRyaku" class="form-control classType" placeholder="略称" value="${valve.classRyaku}">
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="classType" name="classType" class="form-control classType" placeholder="規格記号" value="${valve.classType}">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1">
                                        <input type="button" class="btn btn-danger master-yobikei" onclick="getMasterByType(this)" data-toggle="modal" data-target="#masterModal" id="10" value="呼び径" />
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="yobikeiRyaku" name="yobikeiRyaku" class="form-control yobikei" placeholder="略称" value="${valve.yobikeiRyaku}">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="yobikei" name="yobikei" class="form-control yobikei" placeholder="規格記号" value="${valve.yobikei}">
                                    </div>
                                    <div class="col-md-1">
                                        <input type="button" class="btn btn-danger master-szHou" onclick="getMasterByType(this)" data-toggle="modal" data-target="#masterModal" id="11" value="接続入口" />

                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="szHouRyaku" name="szHouRyaku" class="form-control szHou" placeholder="略称" value="${valve.szHouRyaku}">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="szHou" name="szHou" class="form-control szHou" placeholder="規格記号" value="${valve.szHou}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1">
                                        <input type="button" class="btn btn-danger master-szKikaku" onclick="getMasterByType(this)" data-toggle="modal" data-target="#masterModal" id="12" value="接続規格" />
                                    </div>
                                    <div class="col-md-5">
                                        <input type="text" id="szKikaku" name="szKikaku" class="form-control szKikaku" placeholder="接続規格" value="${valve.szKikaku}">
                                    </div>
                                    <div class="col-md-1">
                                        <input type="button" class="btn btn-danger master-zaisitu" onclick="getMasterByType(this)" data-toggle="modal" data-target="#masterModal" id="13" value="本体材質" />

                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="zaisituRyaku" name="zaisituRyaku" class="form-control zaisitu" placeholder="略称" value="${valve.zaisituRyaku}">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="zaisitu" name="zaisitu" class="form-control zaisitu" placeholder="規格記号" value="${valve.zaisitu}">
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.box-body -->


                </div>

                <div class="box box-warning">
                    <div class="box-header box-panel">
                        <h3 class="box-title">付帯情報</h3>
                    </div>

                        <div class="box-body">
                            <div class="form-group">
                                <textarea class="form-control" id="Futai" name="Futai" rows="3" value="${valve.futai}"></textarea>
                            </div>
                        </div>
                </div>

                <div class="box box-solid">

                    <div class="box-body clearfix">
                        <div class="form-group">
                            <%--<a class="btn btn-default" onclick="valveForm.clear();return null">--%>
                                <%--<i class="fa fa-refresh"></i> リセット--%>
                            <%--</a>--%>
                            <button class="btn btn-success pull-right">
                                <i class="fa fa-save"></i> 保存
                            </button>
                        </div>
                    </div>
                </div>


            </div>
        </form>
        </div>
    </section><!-- /.content -->


</div><!-- ./wrapper -->

<div id="masterModal" class="modal fade masterModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content model-content-master" style="height:600px;overflow:scroll;">
            <input id="master-type" type="hidden" value="" />
            <input type="hidden" id="master-class" value="" />
            <ul id="master-ul" class="list-group">
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){


        $(".box-panel").click(function(){
            $(this).next().toggle();
        });

        $(".master-toggle").focus(function(obj){
            var toggleInput = obj.currentTarget;

            var dropdownPanel = $(toggleInput).next(".dropdown-panel");

            $.get("/sakade/location/getKCodeLJson",function(data){
                $("#kCodeL-select").html("");
                var tmpHTML = "<option></option>";
                var masters = JSON.parse(data);
                for(var i = 0;i<masters.length;i++){
                    tmpHTML = tmpHTML+ "<option>" + masters[i] + "</option>";
                }
                $("#kCodeL-select").html(tmpHTML);
                $("#kCodeM-select").html("");
                $("#kCodeS-select").html("");
                //選択した行を空にする
                $("#kCodeL-input").val("");
                $("#kCodeM-input").val("");
                $("#kCodeS-input").val("");
                $(dropdownPanel).show();
            });
        });

        $("#master-location-confirm").click(function(){
            var locationValue = $("#kCodeL-input").val()+" "+$("#kCodeM-input").val();
            // 両端のスペースを削除
            locationValue=locationValue.trim();
            locationValue = locationValue+" "+$("#kCodeS-input").val();
            // 両端のスペースを削除
            locationValue=locationValue.trim();
            $("#locationName").val(locationValue);
            $(".dropdown-panel").hide();
        });

        $("#master-location-cancel").click(function(){
            $(".dropdown-panel").hide();
        });

        $("#kCodeL-select").change(function(){
            $("#kCodeL-input").val($("#kCodeL-select").val());
            $.post("/sakade/location/getKcodeMJsonBykCodeL",{"kCodeL":$("#kCodeL-select").val()},function(data){
                $("#kCodeM-select").html("");
                var tmpHTML = "<option></option>";
                var masters = JSON.parse(data);
                for(var i = 0;i<masters.length;i++){
                    tmpHTML = tmpHTML+ "<option>" + masters[i] + "</option>";
                }
                $("#kCodeM-select").html(tmpHTML);
            });
        });

        $("#kCodeM-select").change(function(){
            $("#kCodeM-input").val($("#kCodeM-select").val());
            $.post("/sakade/location/getKcodeSJsonBykCodeLkCodeM",{"kCodeL":$("#kCodeL-select").val(),"kCodeM":$("#kCodeM-select").val()},function(data){
                $("#kCodeS-select").html("");
                var tmpHTML = "<option></option>";
                var masters = JSON.parse(data);
                for(var i = 0;i<masters.length;i++){
                    tmpHTML = tmpHTML+ "<option>" + masters[i] + "</option>";
                }
                $("#kCodeS-select").html(tmpHTML);
            });
        });
        $("#kCodeS-select").change(function(){
            $("#kCodeS-input").val($("#kCodeS-select").val());
        });
    });



</script>
<script type="text/javascript">
    //valveの必須項目チェック
    function checkValve(){
        var flag=0;
        //必須項目設定
        if(document.valveForm.VNo.value==""){flag=1;}
        if(document.valveForm.BenMeisyo.value==""){flag=1;}
        if(document.valveForm.locationName.value==""){flag=1;}
        //長さ制限の項目設定
        //弁番号
        var tmpVNo=$("#VNo").val();;
        if(tmpVNo.length>16){
            window.alert("「弁番号」に最大16文字を入力ください");
            return false;
        }
        //識番
        var tmpVNoSub=$("#VNoSub").val();
        if(tmpVNoSub.length>4){
            window.alert("「識番」に最大4文字を入力ください");
            return false;
        }
        //弁名称
        var tmpBenMeisyo=$("#BenMeisyo").val();
        if(tmpBenMeisyo.length>60){
            window.alert("「弁名称」に最大60文字を入力ください");
            return false;
        }
        //設置設備
        var tmpSetSetubi=$("#SetSetubi").val();
        if(tmpSetSetubi.length>50){
            window.alert("「設置設備」に最大50文字を入力ください");
            return false;
        }
        //設置機器
        var tmpSetKiki=$("#SetKiki").val();
        if(tmpSetKiki.length>50){
            window.alert("「設置機器」に最大50文字を入力ください");
            return false;
        }
        //設置場所
        var tmpSetBasyo=$("#SetBasyo").val();
        if(tmpSetBasyo.length>50){
            window.alert("「設置場所」に最大50文字を入力ください");
            return false;
        }
        //系統
        var tmpKeitou=$("#Keitou").val();
        if(tmpKeitou.length>50){
            window.alert("「系統」に最大50文字を入力ください");
            return false;
        }
        //ICS番号
        var tmpIcs=$("#ics").val();
        if(tmpIcs.length>40){
            window.alert("「ICS番号」に最大40文字を入力ください");
            return false;
        }
        //圧力
        var tmpAturyokuMax=$("#AturyokuMax").val();
        if(tmpAturyokuMax.length>10){
            window.alert("「圧力」に最大10文字を入力ください");
            return false;
        }
        //圧力単位
        var tmpTani=$("#Tani").val();
        if(tmpTani.length>10){
            window.alert("「圧力単位」に最大10文字を入力ください");
            return false;
        }
        //温度
        var tmpOndoMax=$("#OndoMax").val();
        if(tmpOndoMax.length>10){
            window.alert("「温度」に最大10文字を入力ください");
            return false;
        }
        //流体略称
        var tmpRyutaiRyaku=$("#ryutaiRyaku").val();
        if(tmpRyutaiRyaku.length>10){
            window.alert("「流体略称」に最大10文字を入力ください");
            return false;
        }
        //流体
        var tmpRyutai=$("#ryutai").val();
        if(tmpRyutai.length>30){
            window.alert("「流体」に最大30文字を入力ください");
            return false;
        }

        //形式略称
        var tmpKeisikiRyaku=$("#keisikiRyaku").val();
        if(tmpKeisikiRyaku.length>10){
            window.alert("「形式略称」に最大10文字を入力ください");
            return false;
        }
        //形式
        var tmpKeisiki=$("#keisiki").val();
        if(tmpKeisiki.length>30){
            window.alert("「形式」に最大30文字を入力ください");
            return false;
        }

        //駆動方式略称
        var tmpSousaRyaku=$("#sousaRyaku").val();
        if(tmpSousaRyaku.length>10){
            window.alert("「駆動方式略称」に最大10文字を入力ください");
            return false;
        }
        //駆動方式
        var tmpSousa=$("#sousa").val();
        if(tmpSousa.length>30){
            window.alert("「駆動方式」に最大30文字を入力ください");
            return false;
        }
        //クラス
        var tmpClassType=$("#classType").val();
        if(tmpClassType.length>30){
            window.alert("「クラス」に最大30文字を入力ください");
            return false;
        }
        //呼び径略称
        var tmpYobikeiRyaku=$("#yobikeiRyaku").val();
        if(tmpYobikeiRyaku.length>10){
            window.alert("「呼び径略称」に最大10文字を入力ください");
            return false;
        }
        //呼び径
        var tmpYobikei=$("#yobikei").val();
        if(tmpYobikei.length>30){
            window.alert("「呼び径」に最大30文字を入力ください");
            return false;
        }
        //接続入口略称
        var tmpSzHouRyaku=$("#szHouRyaku").val();
        if(tmpSzHouRyaku.length>10){
            window.alert("「接続入口略称」に最大10文字を入力ください");
            return false;
        }
        //接続入口
        var tmpSzHou=$("#szHou").val();
        if(tmpSzHou.length>30){
            window.alert("「接続入口」に最大30文字を入力ください");
            return false;
        }
        //接続規格
        var tmpSzKikaku=$("#szKikaku").val();
        if(tmpSzKikaku.length>30){
            window.alert("「接続規格」に最大30文字を入力ください");
            return false;
        }
        //本体材質略称
        var tmpZaisituRyaku=$("#zaisituRyaku").val();
        if(tmpZaisituRyaku.length>10){
            window.alert("「本体材質略称」に最大10文字を入力ください");
            return false;
        }
        //本体材質
        var tmpZaisitu=$("#zaisitu").val();
        if(tmpZaisitu.length>30){
            window.alert("「本体材質」に最大30文字を入力ください");
            return false;
        }
        //付帯情報
        var tmpFutai=$("#Futai").val();
        if(tmpFutai.length>100){
            window.alert("「付帯情報」に最大100文字を入力ください");
            return false;
        }

        //必須項目チェック
        if(flag){
            window.alert("「弁番号,弁名称,設置プラント" +
                    "」の三つを全部入力ください");
            return false;
        }

        //valveの弁番号は重複かどうかチェック
        var ValveCheckResult=1;
        var flag=true;

        var valVno= $("#VNo").val();
        var location=$("#locationName").val();
        location=location.trim();
        console.log("valVno="+valVno+"   ;location="+location);
        //DBにてチェックする
        $.ajax({
            url:"/sakade/item/getResultForVNoCheck",
            type: "POST",
            data: { "valVno":valVno,"location":location },
            async:false,
            success: function(data){
                var resultTmp=JSON.parse(data);
                console.log("resultTmp="+resultTmp);
                if(resultTmp){
                    ValveCheckResult=0;//使える
                }else{
                    ValveCheckResult=1;//使えない
                }
                flag=false;
            }
        });
        while(flag){
        }
        console.log("flag2="+flag);
        console.log("ValveCheckResult2="+ValveCheckResult);
        if(ValveCheckResult==1){
            window.alert("この弁番号はすでに使われてます。");
            return false;
        }
        return true;
    }
    //valveの弁番号は重複かどうかチェック
//    function CheckValueVno(){
//        var valVno= $("#VNo").val();
//        var location=$("#locationName").val();
//        location=location.trim();
//        console.log("valVno="+valVno+"   ;location="+location);
//        if(valVno=="" || location==""){
//            document.getElementById('checkValueForVno').innerHTML ="弁番号と設置プラント両方入力してからボタンを押してください";
//            document.getElementById('checkResult').innerHTML =1;//使えない
//            return false;
//       }else{
//            $.post("/sakade/item/getResultForVNoCheck",{"valVno":valVno,"location":location},function(data){
//                var resultTmp=JSON.parse(data);
//                var tmp="false";
//                console.log("resultTmp="+resultTmp);
//                if(resultTmp){
//                    console.log("true=");
//                    document.getElementById('checkValueForVno').innerHTML ="この弁番号は使えます";
//                    document.getElementById('checkResult').innerHTML =0;//使える
//                    return true;
//                }else{
//                    console.log("false=");
//                    document.getElementById('checkValueForVno').innerHTML ="この弁番号はすでに使われてます";
//                    document.getElementById('checkResult').innerHTML =1;//使えない
//                    return false;
//                }
//            });
//        }
//    };
</script>
<script type="text/javascript">


    function getMasterByType(obj){
        $("#master-ul").html("");
        var type=obj.value;
        var masterName = new String($(obj).attr("class"));
        var masterNames = masterName.split("master-");
        $("#master-class").val(masterNames[1]);
        //既値を取得
        var typeName=document.getElementById(masterNames[1]).value;

        $.post("/sakade/master/getMasterByTypeJson",{"type":type},function(data){
            $("#master-type").val(type);
            var masters = JSON.parse(data);

            $("#master-ul").html("");
            for(var i = 0;i<masters.length;i++){
                var tmp=masters[i].name;
                if(typeName==tmp){
                    var tmpHTML = '<li class="list-group-item master-li" style="background:lightseagreen" onclick="chooseThisMaster(this)">'+masters[i].ryaku+'   '+masters[i].name+'</li>'
                }else{
                    var tmpHTML = '<li class="list-group-item master-li" onclick="chooseThisMaster(this)">'+masters[i].ryaku+'   '+masters[i].name+'</li>'
                }
                $("#master-ul").html($("#master-ul").html()+tmpHTML);
            }
//            console.log($('.masterModal'));
        });
    }

    function getIcsMaster(obj){

        var type=obj.value;
        var masterName = new String($(obj).attr("class"));
        var masterNames = masterName.split("master-");
        $("#master-class").val(masterNames[1]);
        //既値を取得
        var typeName=document.getElementById(masterNames[1]).value;

        $.post("/sakade/ics/getAllIcsGson",function(data){

            $("#master-type").val(type);
            var icsList = JSON.parse(data);

            $("#master-ul").html("");
            for(var i = 0;i<icsList.length;i++){
                var tmp=icsList[i].name;
                if(typeName==tmp){
                    var tmpHTML = '<li class="list-group-item master-li"  style="background:lightseagreen" onclick="chooseThisMaster(this)">'+" "+'   '+icsList[i].icsNum+'</li>'
                }else{
                    var tmpHTML = '<li class="list-group-item master-li" onclick="chooseThisMaster(this)">'+" "+'   '+icsList[i].icsNum+'</li>'
                }
                $("#master-ul").html($("#master-ul").html()+tmpHTML);
            }
        });
    }

    function chooseThisMaster(obj) {
        $("#master-type").val();
        var masterName = $("#master-class").val();
        var values = new String(obj.innerHTML);
        //元値行の色を削除する
        var tmp=document.getElementsByClassName("list-group-item master-li");
        for(var i = 0;i<tmp.length;i++){
            tmp[i].setAttribute("style","background:white");
        }
        //新規値行を色付ける
        obj.setAttribute("style","background:lightseagreen");
        //新規値を設定する
        var masters = values.split("   ");
        var targets = $("."+masterName);
        for(var i = 0;i<targets.length;i++){
            if(targets.length < 2){
                targets[0].value = masters[1];
                break;
            }
            targets[i].value = masters[i];
        }
    }
</script>


<c:import url="../htmlframe/footerFrame.jsp" />

</body>
</html>