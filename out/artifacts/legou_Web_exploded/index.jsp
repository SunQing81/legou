<%--
  Created by IntelliJ IDEA.
  User: 孙庆
  Date: 2020/2/2
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                url: "${APP_PATH}/cleanBuyCarByStatus",
                type: "DELETE",
                success: function (result) {
                    // alert("清空状态为0 的购物车商品");
                    location.href = "${APP_PATH}/forwordPage?url=Index";
                },
                error: function () {
                    alert("异常");
                    // location.reload();
                }
            });
        });
    </script>
    <%--    <jsp:forward page="WEB-INF/pages/Index.jsp"></jsp:forward>--%>
</head>
</html>
