<%--
  Created by IntelliJ IDEA.
  User: 孙庆
  Date: 2020/2/11
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link type="text/css" rel="stylesheet" href="${APP_PATH }/css/style.css"/>
</head>
<body>
<div class="btmbg">
    <div class="btm">
        <span width="98px" height="35px"><a href="#">关于我们</a></span> &nbsp;| &nbsp;
        <span width="98px" height="35px"><a href="#">联系我们</a></span> &nbsp;| &nbsp;
        <span width="98px" height="35px"><a href="${APP_PATH}/forwordPage?url=endLogin">后台管理</a></span> &nbsp;| &nbsp;
        <span width="98px" height="35px"><a href="#">帮助中心</a></span> &nbsp;<br/><br/>
        <span width="200px" height="40px">Copyright © 2019-2020 乐购版权所有</span>
    </div>
</div>
<!--End Footer End -->
</body>
</html>
