<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link type="text/css" rel="stylesheet" href="${APP_PATH }/css/style.css"/>

    <link href="${APP_PATH }/css/bootstrap.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js"></script>

    <title>乐购-订单完成</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<c:choose>
    <c:when test="${sessionScope.customer != null}">
        <div class="i_bg">
            <div class="content mar_20">
                <img src="${APP_PATH}/images/img3.jpg"/>
            </div>

            <!--Begin 第三步：提交订单 Begin -->
            <div class="content mar_20">

                <!--Begin 银行卡支付 Begin -->
                <div class="warning">
                    <table border="0" style="width:1000px; text-align:center;" cellspacing="0" cellpadding="0">
                        <tr height="35">
                            <td style="font-size:18px;">
                                感谢您在本店购物！您的订单已提交成功，您的订单号是: <font color="#ff4e00">${sessionScope.order.oId}</font>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="${APP_PATH}/forwordPage?url=Index">继续购物</a> &nbsp; &nbsp; <a
                                    href="${APP_PATH}/forwordPage?url=UserOrder">查看订单</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--Begin 银行卡支付 Begin -->
            </div>
            <!--End 第三步：提交订单 End-->
            <jsp:include page="footer.jsp"/>
        </div>
    </c:when>
    <c:otherwise>
        <jsp:forward page="Login.jsp"></jsp:forward>
    </c:otherwise>
</c:choose>

</body>
</html>
