<%--
  Created by IntelliJ IDEA.
  User: Lsr
  Date: 10/20/14
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header">
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-vc" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/sakade/">sakade</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                <form class="navbar-form navbar-left" role="search" action="/sakade/kouji/search/">

                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/sakade/list/valve">弁検索</a></li>
                    <li><a href="/sakade/item/addNewvalve">新規弁</a></li>
                    <li><a href="/sakade/">工事検索</a></li>
                    <li class="kengen-operation"><a href="/sakade/kouji/add">新規工事</a></li>
                    <li class="kengen-operation"><a href="/sakade/HistoryValve/getHisotryForToday">操作履歴</a></li>
                    <li class="dropdown user user-menu">
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
                            <%--<i class="glyphicon glyphicon-user"></i>--%>
                            <%--<span>お疲れ様,${user.username} </span>--%>
                            <input type="hidden" id="userid" value="${user.userid}" />
                            <input type="hidden" id="username" value="${user.username}" />
                            <input type="hidden" id="userKengen" value="${user.kengen}" />
                        <%--</a>--%>
                    </li>
                   <li><a href="/sakade/logout">ログアウト</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</header>
<script type="text/javascript">
    $(document).ready(function(){
        //ユーザ権限
        var userKengen=$("#userKengen").val();
        if(userKengen=="6"){
            $(".kengen-operation").show();
        }else if(userKengen.length>0){
            $(".kengen-operation").hide();
        }else{
        }
    });

    // 英数字　全角英数字文字列を半角文字列に変換する
    String.prototype.toOneByteAlphaNumeric = function(){
        return this.replace(/[Ａ-Ｚａ-ｚ０-９]/g, function(s) {
            return String.fromCharCode(s.charCodeAt(0) - 0xFEE0);
        });
    }
    // カタカナ　全角を半角に変換する
    function tozenkaku(val){
        //配列を用意する
        hankaku = new Array("ｶﾞ", "ｷﾞ", "ｸﾞ", "ｹﾞ", "ｺﾞ", "ｻﾞ", "ｼﾞ", "ｽﾞ", "ｾﾞ", "ｿﾞ", "ﾀﾞ", "ﾁﾞ", "ﾂﾞ", "ﾃﾞ", "ﾄﾞ", "ﾊﾞ", "ﾊﾟ", "ﾋﾞ", "ﾋﾟ", "ﾌﾞ", "ﾌﾟ", "ﾍﾞ", "ﾍﾟ", "ﾎﾞ", "ﾎﾟ", "ｳﾞ", "ｧ", "ｱ", "ｨ", "ｲ", "ｩ", "ｳ", "ｪ", "ｴ", "ｫ", "ｵ", "ｶ", "ｷ", "ｸ", "ｹ", "ｺ", "ｻ", "ｼ", "ｽ", "ｾ", "ｿ", "ﾀ", "ﾁ", "ｯ", "ﾂ", "ﾃ", "ﾄ", "ﾅ", "ﾆ", "ﾇ", "ﾈ", "ﾉ", "ﾊ", "ﾋ", "ﾌ", "ﾍ", "ﾎ", "ﾏ", "ﾐ", "ﾑ", "ﾒ", "ﾓ", "ｬ", "ﾔ", "ｭ", "ﾕ", "ｮ", "ﾖ", "ﾗ", "ﾘ", "ﾙ", "ﾚ", "ﾛ", "ﾜ", "ｦ", "ﾝ");
        zenkaku  = new Array("ガ", "ギ", "グ", "ゲ", "ゴ", "ザ", "ジ", "ズ", "ゼ", "ゾ", "ダ", "ヂ", "ヅ", "デ", "ド", "バ", "パ", "ビ", "ピ", "ブ", "プ", "ベ", "ペ", "ボ", "ポ", "ヴ", "ァ", "ア", "ィ", "イ", "ゥ", "ウ", "ェ", "エ", "ォ", "オ", "カ", "キ", "ク", "ケ", "コ", "サ", "シ", "ス", "セ", "ソ", "タ", "チ", "ッ", "ツ", "テ", "ト", "ナ", "ニ", "ヌ", "ネ", "ノ", "ハ", "ヒ", "フ", "ヘ", "ホ", "マ", "ミ", "ム", "メ", "モ", "ャ", "ヤ", "ュ", "ユ", "ョ", "ヨ", "ラ", "リ", "ル", "レ", "ロ", "ワ", "ヲ", "ン");

        //変換開始
        for (i=0; i<=80; i++) { //80文字あるのでその分だけ繰り返す
            while (val.indexOf(hankaku[i]) >= 0){ //該当する半角カナがなくなるまで繰り返す
                val = val.replace(hankaku[i], zenkaku[i]); //半角カナに対応する全角カナに置換する
            }
        }
        return val;
    }
    //Logout 関数
    function logoutFun(){
        var href = window.location.href ;
        console.log("href="+href);
        var tmp=href.split("sakade");
        var newURL="";
//        for(i=0;i<tmp.length;i++){
//            console.log("tmp="+i+""    +tmp[i]);
//        }
        if(tmp.length>=1){
            newURL= tmp[0]+"sakade";
        }else{
            newURL="https://valdac.power-science.com/sakade/";
        }
        console.log("newURL="+newURL);
        window.location.href =newURL;
    }
</script>