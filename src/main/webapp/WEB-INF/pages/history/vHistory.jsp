<%--
  Created by IntelliJ IDEA.
  User: Lsr
  Date: 2016/10/21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../htmlframe/headFrame.jsp" />
<c:import url="../htmlframe/headerFrame.jsp"/>
<link href="/sakade/css/main.css" rel="stylesheet" />

<%--<link rel="stylesheet" type="text/css" href="/sakade/css/main.css" />--%>
<body class="">
<!-- header logo: style can be found in header.less -->

<div class="wrapper row-offcanvas row-offcanvas-left">
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        操作履歴
    </h1>
</section>

<!-- Main content -->
<section class="content">


    <div class="row">

        <div class="col-md-1">
            <form  action="/sakade/HistoryValve/getHisotryByKey/${1}"  method="post" >
                <input type="submit" class="btn btn-default" style="color: #211f1f" value="今日"/>
            </form>
        </div>
        <div class="col-md-1">
            <form   action="/sakade/HistoryValve/getHisotryByKey/${2}"  method="post" >
                <input type="submit" class="btn btn-default" style="color: #211f1f" value="1週間"/>
            </form>
        </div>
        <div class="col-md-1">
            <form  action="/sakade/HistoryValve/getHisotryByKey/${3}"  method="post" >
                <input type="submit" class="btn btn-default"  style="color: #211f1f" value="1カ月"/>
            </form>
        </div>
        <div class="col-md-2">
            <div class="input-group">
                <input type="text" name="table_search" id="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Filter"  value="${filterValve}">
                <div class="input-group-btn">
                    <button class="btn btn-sm btn-default" id="table_search_btn" onclick="filterPage()"><i class="fa fa-search"></i></button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-xs-12">
            <div  class="row">
                <div class="col-md-10">
                    <div hidden id="loading" align="center"><img src="/sakade/img/loading.gif"></div>
                </div>
            </div></br><br>
            <!-- data tables -->
            <div class="box box-primary result-box">

                <div class="box-body no-padding">
                    <div class="list-group valve-list select-list">
                        <table class="table table-hover select-table">
                            <thead>
                            <tr>
                                <th  width=20%>ユーザ名</th>
                                <th  width=10%>テーブル名</th>
                                <th  width=10%>操作内容</th>
                                <th  width=40%>データID</th>
                                <th  width=10%>ユーザIP</th>
                                <th  width=10%>日付</th>
                            </tr>
                            </thead>
                            <tbody id="valveHistoryList">
                            <c:forEach items="${historyValveList}" var="tempHistory">
                                <tr>
                                    <td>${tempHistory.hUsername}</td>
                                    <td>${tempHistory.hTablename}</td>
                                    <td>${tempHistory.hDetail}</td>
                                    <td>${tempHistory.hTargetId}</td>
                                    <td>${tempHistory.hIp}</td>
                                    <td>${tempHistory.hTrkDate}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
       </div>
    </div>


</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->

<!-- add new calendar event modal -->

<script type="text/javascript">
    $(document).ready(function() {

    })

    //Filter
    function filterPage(){
        //Filter  keyword
        var FilterValveKey = $("#table_search").val();

        if(FilterValveKey.length > 0) {
            var trs = $(".select-table tbody tr");
            for (var i = 0; i < trs.length; i++) {
                $(trs[i]).hide();
                //是否是头
                var ths = $(trs[i]).find("th");
                if(ths.length > 0){
                    $(trs[i]).show();
                    continue;
                }
                //不是头的行
                var tds = $(trs[i]).find("td");

                for (var j = 0; j < tds.length; j++) {
                    var tmpHtml = new String(tds[j].innerHTML);
                    tmpHtml=tmpHtml.toLowerCase();
                    if (tmpHtml.match(FilterValveKey)) {
                        $(trs[i]).show();
                        break;
                    }
                }
            }
        } else {
            var trs = $(".select-table tbody tr");
            for (var i = 0; i < trs.length; i++) {
                $(trs[i]).show();
            }
        }

    };

</script>

<c:import url="../htmlframe/footerFrame.jsp" />

</body>

</html>
