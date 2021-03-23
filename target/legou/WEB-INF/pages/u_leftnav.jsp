<%--
  Created by IntelliJ IDEA.
  User: 孙庆
  Date: 2020/2/18
  Time: 0:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js"></script>
</head>
<body onload="navLeftLi()">
<div class="m_left">
    <div class="left_m">
        <div class="left_m_t t_bg2">个人中心</div>
        <ul id="navleftul">
            <li><a href="${APP_PATH}/forwordPage?url=UserCenter">用户信息</a></li>
            <li><a href="${APP_PATH}/forwordPage?url=UserOrder">我的订单</a></li>
            <li><a href="${APP_PATH}/forwordPage?url=UserAddress">收货地址</a></li>
            <li><a href="${APP_PATH}/forwordPage?url=UserJiFen">积分兑换</a></li>
        </ul>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).on("mouseover", "#navleftul li", function () {
        // alert($(this).attr("li_index"));
        $(this).css("border", "1px solid #CCCCCC");
    });
    $(document).on("mouseout", "#navleftul li", function () {
        // alert("绑定成功");
        // console.log("绑定成功");
        $(this).css("border", "0");
        // $(".leftNav_ul li").find("span").css("border","0");
    });

    function navLeftLi() {
        if (${sessionScope.url eq 'UserCenter'}) {
            $("#navleftul li").eq(0).find("a").css("color", "#FF4E00");
        }
        if (${sessionScope.url eq 'UserOrder'}) {
            $("#navleftul li").eq(1).find("a").css("color", "#FF4E00");
        }
        if (${sessionScope.url eq 'UserAddress'}) {
            $("#navleftul li").eq(2).find("a").css("color", "#FF4E00");
        }
        if (${sessionScope.url eq 'UserJiFen'}) {
            $("#navleftul li").eq(3).find("a").css("color", "#FF4E00");
        }
    }
</script>
</html>
