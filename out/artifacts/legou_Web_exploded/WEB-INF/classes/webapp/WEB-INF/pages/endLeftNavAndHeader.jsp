<%--
  Created by IntelliJ IDEA.
  User: 孙庆
  Date: 2020/3/12
  Time: 23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap-theme.min.css"/>
    <script src="${APP_PATH }/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="row">
        <div class="col-md-4 col-md-offset-4" style="text-align: center;">
            <span style="line-height: 50px;font-size: 20px;">乐购-后台管理</span>
        </div>
        <div class="col-md-2 col-md-offset-2" style="line-height: 50px;">
            <!-- Single button -->
            <div class="dropdown">
                <button type="button" class="btn btn-default dropdown-toggle" id="dropdownMenu" data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="true" style="border: 0;min-width: 100px;height: auto;">
                    <img src="${APP_PATH}${sessionScope.admin.adminImage}" width="50px" class="img-circle">
                    ${sessionScope.admin.adminName}&nbsp;&nbsp;<span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
                    <li><a href="${APP_PATH}/forwordPage?url=endLogin">安全退出</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<div style="position: fixed;margin-top: 60px;width: 250px;">
    <div class="panel panel-default">
        <div class="panel-body" style="height: 500px;">
            <ul class="nav nav-pills nav-stacked" id="end_leftNav_ul">
                <li role="presentation" class="endIndex active"><a href="${APP_PATH}/forwordPage?url=endIndex">首页</a>
                </li>
                <li role="presentation" class="endAdmin"><a href="${APP_PATH}/forwordPage?url=endAdmin">个人中心</a></li>
                <c:if test="${sessionScope.admin.adminTypeId == 1}">
                    <li role="presentation" class="endEmployee"><a
                            href="${APP_PATH}/forwordPage?url=endEmployee">员工管理</a></li>
                    <li role="presentation" class="endCustomer"><a
                            href="${APP_PATH}/forwordPage?url=endCustomer">用户管理</a></li>
                </c:if>
                <li role="presentation" class="endGoods"><a href="${APP_PATH}/forwordPage?url=endGoods">商品管理</a></li>
                <li role="presentation" class="endOrder"><a href="${APP_PATH}/forwordPage?url=endOrder">订单管理</a></li>
                <li role="presentation" class="endNotice"><a href="${APP_PATH}/forwordPage?url=endNotice">公告管理</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
<script src="${APP_PATH }/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        navLeftLi();
    });

    //设置对应列表选中
    function navLeftLi() {
        $("#end_leftNav_ul li").removeClass("active");
        if (${sessionScope.url eq 'endIndex'}) {
            $("#end_leftNav_ul").find("li.endIndex").addClass("active");
        }
        if (${sessionScope.url eq 'endAdmin'}) {
            $("#end_leftNav_ul").find("li.endAdmin").addClass("active");
        }
        if (${sessionScope.url eq 'endEmployee'}) {
            $("#end_leftNav_ul").find("li.endEmployee").addClass("active");
        }
        if (${sessionScope.url eq 'endCustomer'}) {
            $("#end_leftNav_ul").find("li.endCustomer").addClass("active");
        }
        if (${sessionScope.url eq 'endGoods'}) {
            $("#end_leftNav_ul").find("li.endGoods").addClass("active");
        }
        if (${sessionScope.url eq 'endOrder'}) {
            $("#end_leftNav_ul").find("li.endOrder").addClass("active");
        }
        if (${sessionScope.url eq 'endComment'}) {
            $("#end_leftNav_ul").find("li.endComment").addClass("active");
        }
        if (${sessionScope.url eq 'endNotice'}) {
            $("#end_leftNav_ul").find("li.endNotice").addClass("active");
        }
    }
</script>
</html>
