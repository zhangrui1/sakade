<%--
  Created by IntelliJ IDEA.
  User: 維瑞
  Date: 2016/01/23
  Time: 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../htmlframe/headFrame.jsp" />

<link type="text/css" rel="stylesheet" href="/sakade/css/kiki.css"/>
<html>
<style type="text/css">
    div.centerdiv { text-align: center; }
    /* loading */
    #image-box-base #loading {
        display:none;
        position:absolute;
        top:0;left:0;
        width:100%;height:100%;
        background:url("/sakade/img/loading.gif") no-repeat center center;
        border-style: none;
    }
</style>
<head>
    <title>工事支援</title>
</head>
<body class="skin-blue">
<!-- header logo: style can be found in header.less -->

<c:import url="../htmlframe/headerFrame.jsp" />

<div class="wrapper row-offcanvas row-offcanvas-left">
<!-- Left side column. contains the logo and sidebar -->
<c:import url="../htmlframe/leftFrame.jsp" />

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        工事側図面　&nbsp;&nbsp;&nbsp;${valve.locationName}
    </h1>
    <ol class="breadcrumb" style="font-size:20pt;">
        <li class="active"><a href="/sakade/item/filterValue/${valve.kikiSysId}">弁情報へ</a></li>
    </ol>
</section>
<input type="hidden" id="kikiSysId" value="${valve.kikiSysId}" />
<!-- Main content -->
<section class="content">
    <div class="row">
<!-- collection -->
        <div class="col-lg-12">
            <div class="box box-kiki box-solid">
                <div class="box-header box-panel">
                    <h3 class="box-title"><i class="fa fa-fw fa-files-o"></i> ${valve.vNo}　弁の工事側図面</h3>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <input type="hidden" name="imageId" id="imageId" value="<c:if test="${not empty firstImageKoujiValve}">${firstImageKoujiValve.id}</c:if>" />

                        <%--図面種類--%>
                        <div class="form-group">
                            <div class="row col-md-12">
                                <div class="btn-group" role="group">
                                    <button type="button" id="typeImage0" class="btn btn-default" onclick="turnToImagesyu(0)"/>全部</button>
                                    <button type="button" id="typeImage1" class="btn btn-default" onclick="turnToImagesyu(1)"/>図面仕様書</button>
                                    <button type="button" id="typeImage2" class="btn btn-default" onclick="turnToImagesyu(2)"/>点検報告書</button>
                                    <button type="button" id="typeImage3" class="btn btn-default" onclick="turnToImagesyu(3)"/>懸案事項一覧</button>
                                    <button type="button" id="typeImage4" class="btn btn-default" onclick="turnToImagesyu(4)"/>完成図面</button>
                                    <button type="button" id="typeImage5" class="btn btn-default" onclick="turnToImagesyu(5)"/>作業指示書</button>
                                    <button type="button" id="typeImage6" class="btn btn-default" onclick="turnToImagesyu(6)"/>弁棒ねじ検索記録</button>
                                    <button type="button" id="typeImage7" class="btn btn-default" onclick="turnToImagesyu(7)"/>GP</button>
                                </div>
                            </div>
                        </div><br><br>

                        <div class="row centerdiv">
                                <button type="button" class="btn btn-default" onclick="printImage()" value=""/>印刷</button>

                                <button type="button" id="firstButton" class="btn btn-default" onclick="turnToFirstPage()" value=""/>先頭へ</button>

                                <button type="button" id="previousButton" class="btn btn-default" onclick="turnToPreviousPage()" value=""/>前ページ</button>

                                <span id="valueCurrent">${firstImageKoujiNum}</span>/<span id="valueTotal">${imageKoujiListSize}</span>

                                <button type="button" id="NextButton" class="btn btn-default" onclick="turnToNextPage()" value=""/>次ページ</button>

                                <button type="button" id="lastButton" class="btn btn-default" onclick="turnToLastPage()" value=""/>最終へ</button>

                                <input type="text"  name="jump_page_num" id="jump_page_num" style="width: 50px;" value=""/>&nbsp; &nbsp;&nbsp; &nbsp;

                                <button type="button" class="btn btn-default" onclick="turnToNumPage()" value=""/>ページに遷移</button>
                        </div></br></br>
                        <%--//管理者ユーザ用--%>
                        <div class="row" hidden id="imageForAdmin"  class="imageForAdmin">
                            <%--<div class="col-md-1"></div>--%>
                            <div class="col-md-2">
                                <select class="form-control input-sm imagesyu" readonly="true" id="currentSyu" onchange="saveChangeToDatabase(this)">
                                    <option <c:if test="${not empty firstImageKoujiValve}"></c:if><c:if test="${(firstImageKoujiValve.imagesyu eq '')}"> selected</c:if>></option>
                                    <option <c:if test="${not empty firstImageKoujiValve}"></c:if><c:if test="${(firstImageKoujiValve.imagesyu eq 'GP装填明細書')}"> selected</c:if>>GP装填明細書</option>
                                    <option <c:if test="${not empty firstImageKoujiValve}"></c:if><c:if test="${(firstImageKoujiValve.imagesyu eq '図面仕様書')}">selected</c:if>>図面仕様書</option>
                                    <option <c:if test="${not empty firstImageKoujiValve}"></c:if><c:if test="${(firstImageKoujiValve.imagesyu eq '点検報告書')}">selected</c:if>>点検報告書</option>
                                    <option <c:if test="${not empty firstImageKoujiValve}"></c:if><c:if test="${(firstImageKoujiValve.imagesyu eq '懸案事項一覧')}">selected</c:if>>懸案事項一覧</option>
                                    <option <c:if test="${not empty firstImageKoujiValve}"></c:if><c:if test="${(firstImageKoujiValve.imagesyu eq '完成図面')}">selected</c:if>>完成図面</option>
                                    <option <c:if test="${not empty firstImageKoujiValve}"></c:if><c:if test="${(firstImageKoujiValve.imagesyu eq '作業指示書')}">selected</c:if>>作業指示書</option>
                                    <option <c:if test="${not empty firstImageKoujiValve}"></c:if><c:if test="${(firstImageKoujiValve.imagesyu eq '弁棒ねじ検索記録')}">selected</c:if>>弁棒ねじ検索記録</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <input type="text" id="imagebikou"  readonly="true" class="form-control"  value="<c:if test="${not empty firstImageKoujiValve}">${firstImageKoujiValve.bikou}</c:if>" >
                            </div>
                        </div></br></br>
                        <%--//管理者ユーザ以外用--%>
                        <div class="row" hidden id="imageForOthers" class="imageForOthers">
                            <div class="col-md-2">
                                <input type="text" id="imageSyuForOther" readonly="true" class="form-control"  value="<c:if test="${not empty firstImageKoujiValve}">${firstImageKoujiValve.imagesyu}</c:if>" >
                            </div>
                            <div class="col-md-4">
                                <input type="text" id="imagebikouForOther" readonly="true" class="form-control"  value="<c:if test="${not empty firstImageKoujiValve}">${firstImageKoujiValve.bikou}</c:if>" >
                            </div>
                        </div>
                        <div class="row">
                            <div class="row previewDiv">
                                <button type="button" class="btn btn-default" onclick="routeImageForValve(1)" value=""/>右90度</button>
                                <button type="button" class="btn btn-default" onclick="routeImageForValve(0)" value=""/>左90度</button>
                                &nbsp;&nbsp;&nbsp;<input type="text"   name="index_page_num" id="index_page_num" style="width: 50px;" value=""/>
                                <button type="button" id="index_num" class="btn btn-default" onclick="changeNumPage()" value=""/>インデックス変更</button>
                                <span style="color:#ff0000;">「全部」タグを選択された状態に「インデックス変更」が可能です。</span>
                            </div>
                        </div>
                        <div class="row" id="image-box-base">
                            <div class="row previewDiv" id="valveImg">
                                <!-- image -->
                                <img  id="previewImage" class="previewImage"  style="border:solid 1px silver" width="65%"  src="" width="600" value="" />
                            </div>
                            <div id="loading"> </div>
                            <div id="previewImageName" style="display: none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- insert -->

<!-- add content modal -->
</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->

<script type="text/javascript">
//図面用
var BUCKETValdacConstruction = 'valdac-construction-test'; //テストサーバ用
//var BUCKETValdacConstruction = 'valdac-construction-asia'; //本番


//図面回転用
valueBen=0;//valve 用
function routeImageForValve(type){
    var type=type;
    var tmpAngle;

    if(type==1){//右回り
        valueBen=(valueBen+90)%360;
        tmpAngle=valueBen-90;
    }else{//左回り
        valueBen=(valueBen-90)%360;
        tmpAngle=valueBen+90;
    }
    //クリックして回す
    $("#valveImg img").rotate({
        angle:tmpAngle,
        animateTo: valueBen,
        easing: $.easing.easeInOutExpo
    });
};
function routeImage(value) {
    $("#valveImg img").rotate({
        angle: 0,
        animateTo: value,
        easing: $.easing.easeInOutExpo
    });
};
$(window).load(function () {
    //最初の図面を表示する
    document.getElementById('previewImageName').value="${firstImageKoujiValve.imagename}";
    loadImg("${firstImageKoujiValve.imagename}");

    //first ボタン設定
    firstAndLastButton(1,"${imageKoujiListSize}","firstButton","previousButton","NextButton","lastButton");
    //全部タブに色をつける
    document.getElementById("typeImage0").style.background="#eeeeff";
});
$(document).ready(function(){
    //left menu status
    document.getElementById('left-menu-search').className="selected";
    document.getElementById('left-menu-new').className="kengen-operation";
    document.getElementById('left-menu-edit').className="";
    document.getElementById('left-menu-master').className="kengen-operation";
    document.getElementById('left-menu-ics').className="kengen-operation";
    //left menu end -------

    $(".box-panel").click(function(){
        $(this).next().toggle();
    });

    //ユーザ権限
    var userKengen=$("#userKengen").val();
    if(userKengen=="6"){
        $(".kengen-operation").show();
        document.getElementById("imageForOthers").style.display="none";
        document.getElementById("imageForAdmin").style.display="block";
    }else if(userKengen.length>0){
        $(".kengen-operation").hide();
        document.getElementById("imageForOthers").style.display="block";
        document.getElementById("imageForAdmin").style.display="none";
    }else{
    }
});

function progressBarController(num){
    $("#progressbar").attr({"aria-valuenow":num});
    $("#progressbar").css({"width":num+"%"});
}
function totalProgressBarController(numStr,totalStr){
    var num = parseInt(numStr);
    var totalNum = parseInt(totalStr);
    var p = parseFloat(num/totalNum);
    p = p * 100;
    $("#totalProgressbar").attr({"aria-valuenow":p});
    $("#totalProgressbar").css({"width":p+"%"});
}


function printImage(obj){
    var imageUrl=document.getElementById("previewImage").src;
    //画像名を取得
    imageUrl=imageUrl.replace("http://storage.googleapis.com/","");
    if(imageUrl.length>10){
        window.open("https://valdac.power-science.com/print.html?"+imageUrl);
    }
}

//set image for valve
function setImage(items,flg) {
    if(flg){
        //図面描画
        var tmpImgUrl=items.imagename;
        document.getElementById('previewImageName').value=tmpImgUrl;
        console.log("tmpImgUrl="+tmpImgUrl);
        loadImg(tmpImgUrl);
//        document.getElementById('previewImage').src="http://storage.googleapis.com/valdac/"+items.imagename;
        document.getElementById('imagebikou').value=items.bikou;
        document.getElementById('imageId').value=items.id;
        //図面種類表示
        $("#currentSyu").html("");
        //図面種類を定義する
        var array1 = new Array('GP装填明細書','図面仕様書','点検報告書','懸案事項一覧','完成図面','作業指示書','弁棒ねじ検索記録');
        var htmlitem="<option></option>";
        for(var i=0;i<array1.length;i++){
            if(array1[i]==items.imagesyu){
                htmlitem=htmlitem+"<option selected>"+array1[i]+"</option>"
            }else{
                htmlitem=htmlitem+"<option>"+array1[i]+"</option>"
            }
        }

        $("#currentSyu").html(htmlitem);
        $("#imageSyuForOther").val(items.imagesyu);
        $("#imagebikouForOther").val(items.bikou);

    }else{
        document.getElementById("valueCurrent").innerHTML ="0";
        document.getElementById("valueTotal").innerHTML="0";
        document.getElementById('previewImage').src="http://storage.googleapis.com/"+BUCKETValdacConstruction;
        document.getElementById('imagebikou').value="";
        document.getElementById('imageId').value="";
        //図面種類表示
        $("#currentSyu").html("");
        //図面種類を定義する
        var array1 = new Array('GP装填明細書','図面仕様書','点検報告書','懸案事項一覧','完成図面','作業指示書','弁棒ねじ検索記録');
        var htmlitem="<option></option>";
        for(var i=0;i<array1.length;i++){
            htmlitem=htmlitem+"<option>"+array1[i]+"</option>"
        }
        $("#currentSyu").html(htmlitem);
        $("#imageSyuForOther").val("");
        $("#imagebikouForOther").val("");


    }

    //図面を元の向けにする
    valueBen=0;//valve 用
    routeImage(0);
}
//種別毎に表示

function turnToImagesyu(type){

    var indexPageNumButton=document.getElementById("index_page_num");
    var indexNumButton=document.getElementById("index_num");
    console.log("type="+type);
    if(0==type){
        console.log("0");
        //全種類の図面が表示される場合のみ、インデックスを修正できる
        indexPageNumButton.disabled=false;
        indexNumButton.disabled=false;
    }else{
        console.log("0以外");
        indexPageNumButton.disabled=true;
        indexNumButton.disabled=true;
    }
    //図面種類選択された場合、ボタン色を修正
    for(var i=0;i<8;i++){
        var tmp="typeImage"+i;
        if(i==type){
            console.log("type="+type);
            document.getElementById(tmp).style.background="#eeeeff";
        }else{
            console.log("type no color="+type);
            document.getElementById(tmp).style.background="";
        }
    }
    //該種類のデータを設定
    $.post("/sakade/imageKouji/setImagesyuSession", {"type": type}, function (data) {
        if(data=="login"){
            logoutFun();
        }else{
            var items = JSON.parse(data);
            console.log("items length="+items.length);
            if(items.length>0){
                document.getElementById("valueCurrent").innerHTML = "1";
                document.getElementById("valueTotal").innerHTML = items.length + "";
                setImage(items[0], true)
            }else{
                setImage(null, false);
            }
            //先頭、最終へボタン設定
            var setNum=document.getElementById("valueCurrent").innerHTML;
            var totalNum=document.getElementById("valueTotal").innerHTML
            firstAndLastButton(setNum,totalNum,"firstButton","previousButton","NextButton","lastButton");
        }
    });
}

//turn to first page
function turnToFirstPage(){
    var setNum = 1;
    if(setNum > 0) {
        turnToSet(setNum);
    }
}

//turn to last page
function turnToLastPage(){
    var setNum = parseInt(document.getElementById("valueTotal").innerHTML);
    if(setNum > 0) {
        turnToSet(setNum);
    }
}
//turn to num page
function turnToNumPage(){
    var valueTotal = parseInt(document.getElementById("valueTotal").innerHTML);
    var valueCurrent = parseInt(document.getElementById("jump_page_num").value);
    //ページ数以内場合遷移する
    if(valueCurrent > 0 && valueCurrent<=valueTotal) {
        turnToSet(valueCurrent);
    }else{
        alert("ページ数以内に半角数字を入力ください");
    }
}

//turn to previous page
function turnToPreviousPage(){
    var setNum = parseInt(document.getElementById("valueCurrent").innerHTML);
    setNum = setNum - 1;
    if(setNum > 0) {
        turnToSet(setNum);
//            document.getElementById("valueCurrent").innerHTML = setNum+"";
    }
}

//turn to next page
function turnToNextPage(){
    var setNum = parseInt(document.getElementById("valueCurrent").innerHTML);
    var totalNum = parseInt(document.getElementById("valueTotal").innerHTML);
    setNum = setNum + 1;
    if(setNum <= totalNum) {
        turnToSet(setNum);
//            document.getElementById("valueCurrent").value = setNum + "";
    }
}

function turnToSet(setNumStr){
    //インデックス入力のinputを空にする
    document.getElementById("index_page_num").value="";
    var totalNum = parseInt(document.getElementById("valueTotal").innerHTML);
    var setNum = parseInt(setNumStr);
    //先頭、最終へボタン設定
    firstAndLastButton(setNum,totalNum,"firstButton","previousButton","NextButton","lastButton");

    if(setNum >= 1 && setNum <= totalNum){
        setNum = setNum - 1;
        $.post("/sakade/imageKouji/getimageForChangePage", {"setNum": setNum}, function (data) {

            if(data=="login"){
                logoutFun();
            }else{
                var items = JSON.parse(data);
//            document.getElementById('previewImage').src="http://storage.googleapis.com/valdac/"+items.imagename;
                document.getElementById("valueCurrent").innerHTML = setNum+1;
                document.getElementById("imagebikou").value = items.bikou;
                document.getElementById('imageId').value=items.id;
                //図面描画
                var tmpImgUrl=items.imagename;
                document.getElementById('previewImageName').value=tmpImgUrl;
                loadImg(tmpImgUrl);
                console.log("over");

                //図面種類表示
                $("#currentSyu").html("");
                //図面種類を定義する
                var array1 = new Array('GP装填明細書','図面仕様書','点検報告書','懸案事項一覧','完成図面','作業指示書','弁棒ねじ検索記録');
                var htmlitem="<option></option>";
                for(var i=0;i<array1.length;i++){
                    if(array1[i]==items.imagesyu){
                        htmlitem=htmlitem+"<option selected>"+array1[i]+"</option>"
                    }else{
                        htmlitem=htmlitem+"<option>"+array1[i]+"</option>"
                    }
                }


                $("#currentSyu").html(htmlitem);
                $("#imageSyuForOther").val(items.imagesyu);
                $("#imagebikouForOther").val(items.bikou);

                //図面を元の向けにする
                valueBen=0;//valve 用
                routeImage(0);
            }
            });
    }
}
//先頭、最終へボタン設定
function firstAndLastButton(firstNum,lastNum,firstButton,previousButton,NextButton,lastButton){
    var firstButtonName=document.getElementById(firstButton);
    var previousButtonName=document.getElementById(previousButton);
    var NextButtonName=document.getElementById(NextButton);
    var lastButtonName=document.getElementById(lastButton);
    console.log("firstNum="+firstNum+"      lastNum="+lastNum);
    if(firstNum<=1 && lastNum<=1){
        firstButtonName.disabled =true;
        previousButtonName.disabled =true;
        NextButtonName.disabled =true;
        lastButtonName.disabled =true;
    }else if((firstNum==1 && lastNum>1)){
        firstButtonName.disabled =true;
        previousButtonName.disabled =true;
        NextButtonName.disabled =false;
        lastButtonName.disabled =false;
    }else if(firstNum>1 && firstNum==lastNum){
        firstButtonName.disabled =false;
        previousButtonName.disabled =false;
        NextButtonName.disabled =true;
        lastButtonName.disabled =true;
    }else{
        firstButtonName.disabled =false;
        previousButtonName.disabled =false;
        NextButtonName.disabled =false;
        lastButtonName.disabled =false;
    }
}

//関連弁追加画面の検索
function changeNumPage(){

    //arrayの中の番号　pageではない
    var setImageNumNew = parseInt(document.getElementById("index_page_num").value);
    var setImageNumOld=parseInt(document.getElementById("valueCurrent").innerHTML);
    if(isNaN(setImageNumNew)){
        alert("数字を入力してください");
        document.getElementById("index_page_num").value="";
        return false;
    }
    var kikiSysId = $("#kikiSysId").val();
    //page番号を修正されたかどうか
    if(setImageNumNew==setImageNumOld){
        console.log("setImageNumNew="+setImageNumNew+"; setImageNumOld"+setImageNumOld);
        return false;
    }
    //page番号を有効値かどうか
    if(setImageNumNew>"${imageKoujiListSize}" || setImageNumNew<1){
        console.log("範囲外　setImageNumNew="+setImageNumNew);
        alert("図面件数以内の数字を入力してください");
        return false;
    }

    var imagename= document.getElementById('previewImageName').value;

    //imagename により、page番号を修正する
    $.post("/sakade/imageKouji/changeValveImagePage",{"kikiSysId":kikiSysId,"imagename":imagename,"pageNew":setImageNumNew,"pageOld":setImageNumOld},function(data){
        console.log("data="+data);
        if(data=="login"){
            logoutFun();
        }else{
            document.getElementById("valueCurrent").innerHTML=setImageNumNew;
            //first ボタン設定
            firstAndLastButton(setImageNumNew,"${imageKoujiListSize}","firstButton","previousButton","NextButton","lastButton");
            alert("更新しました");
        }
    });


}

//imgPreloaderを作成
var imgPreloader=new Image();
function loadImg(imgUrl) {
    document.getElementById('previewImage').src="/sakade/img/black.png";
    var OBJECT_NAME=imgUrl;
    var totalSet = parseInt(document.getElementById("valueTotal").innerHTML);
    console.log("imgUrl="+imgUrl+"   totalSet="+totalSet);
    if(totalSet>0){
        //javaにて　signUrlを取得する
        $.post("/sakade/SingImageUrl/SignTest",{"OBJECT_NAME":OBJECT_NAME,"BUCKET_NAME":BUCKETValdacConstruction},function(data){
            console.log("data="+data);
            if(data=="login"){
                logoutFun();
            }else{
                //画像読み込みの直前にLoading画像を表示する
                $("#loading").css({'display':'block'});
                console.log("1=");
                //onloadイベントハンドラ
                console.log("2=");
                imgPreloader.onload=function() {
                    console.log("3=");
                    $("#loading").css({'display':'none'});
                    //img 設定
                    document.getElementById('previewImage').src=data;
                    console.log("4=");
                }
                imgPreloader.onerror=function(){
                    $("#loading").css({'display':'none'});
                    //エラー画像設定
                    document.getElementById('previewImage').src="/sakade/img/error.jpg";
                }
                console.log("5=");
                //url-Set
                imgPreloader.src=data;
            }
        });
    }else{
        document.getElementById('previewImage').src="";
    }
};
</script>

</body>
</html>
