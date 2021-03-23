<%--
  Created by IntelliJ IDEA.
  User: 孙庆
  Date: 2020/3/6
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>乐购-商品评价</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link rel="stylesheet" href="${APP_PATH}/layui/css/layui.css" media="all">
    <link href="${APP_PATH }/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js"></script>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<c:if test="${sessionScope.commentOrder != null}">
    <div class="container" style="width: 1200px">
        <div class="row" style="margin-top: 20px">
            <p style="font-size: 16px;font-weight: 700;text-align: center">评价订单</p>
            <p style="text-align: center">订单号：${sessionScope.commentOrder.oId}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span></span>
            </p>
            <div style="height: 1px;background-color: #f3f3f3"></div>
        </div>
        <div class="row" id="commentRow" style="margin-top: 50px">
            <table border="0">
                <tr>
                    <td class="col-md-4">
                        <p style="text-align: center">
                            <a href="${APP_PATH}/getGoodsByGid?gid=${sessionScope.commentOrder.goodsList[0].gId}">
                                <img src="${APP_PATH}${sessionScope.commentOrder.goodsList[0].gImage}" width="100px"
                                     height="100px">
                            </a>
                        </p>
                        <p style="width: 320px;color: #666666;font-weight: 200;text-align: center">
                            <a href="${APP_PATH}/getGoodsByGid?gid=${sessionScope.commentOrder.goodsList[0].gId}">
                                    ${sessionScope.commentOrder.goodsList[0].gDetailinfo}
                            </a>
                        </p>
                        <p style="text-align: center"></p>
                    </td>
                    <td class="col-md-8">
                        <table class="table">
                            <tr>
                                <td style="vertical-align: middle;width: 20%">商品评分</td>
                                <td style="width: 80%">
                                    <div id="score"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>评价</td>
                                <td>
                                    <textarea rows="4" class="form-control" placeholder="1~200"
                                              id="commentText"></textarea>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div class="row" style="text-align: center;margin-bottom: 150px;margin-top: 60px">
            <button type="button" style="width: 200px" class="btn btn-danger btn-lg" id="createCommentBtn">发表</button>
        </div>
    </div>
</c:if>
<c:if test="${sessionScope.commentOrder == null}">
    <jsp:forward page="UserOrder.jsp"></jsp:forward>
</c:if>


<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="${APP_PATH}/layui/layui.js"></script>
<%--layui评分显示--%>
<script type="text/javascript" charset="UTF-8">
    layui.use(['rate'], function () {
        var rate = layui.rate;
        //显示文字
        rate.render({
            elem: '#score'
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        //时间戳转换成格式化时间
        setOrderCreatTime();
        //将订单价格保留两位有效数字
        setPriceToFixed();
    });

    //时间戳转换成格式化时间
    function timestampToTime(timestamp) {
        //时间戳为10位需*1000，时间戳为13位的话不需乘1000
        var date = new Date(timestamp * 1);
        Y = date.getFullYear() + '-';
        M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
        h = (date.getHours() < 10 ? '0' + (date.getHours()) : date.getHours()) + ':';
        m = (date.getMinutes() < 10 ? '0' + (date.getMinutes()) : date.getMinutes()) + ':';
        s = (date.getSeconds() < 10 ? '0' + (date.getSeconds()) : date.getSeconds());
        return Y + M + D + h + m + s;
    }

    //将订单时间转化为格式化时间
    function setOrderCreatTime() {
        if (${sessionScope.commentOrder.createtime}) {
            var creatTime = "${sessionScope.commentOrder.createtime}";
            creatTime = timestampToTime(creatTime);
            $(".container").children(".row:first").find("span").text(creatTime);
        } else {
            return false;
        }
    }

    //将订单价格保留两位有效数字
    function setPriceToFixed() {
        if (${sessionScope.commentOrder.goodsList[0].gPrice}) {
            var price = "${sessionScope.commentOrder.goodsList[0].gPrice}";
            price = parseFloat(price).toFixed(2);
            $("#commentRow").find("p:last").text("￥" + price);
        } else {
            return false;
        }
    }

    //发表评论
    $("#createCommentBtn").click(function () {
        var score = $("#score").find("i.layui-icon-rate-solid").length;
        var commentText = $("#commentText").val();
        if (score > 0 && commentText.length > 0) {
            $.ajax({
                url: "${APP_PATH}/createComment/" + score + "-" + commentText,
                type: "POST",
                success: function (result) {
                    alert("评论完成");
                    location.href = "${APP_PATH}/forwordPage?url=UserOrder";
                }
            });
            console.log(score);
            console.log(commentText);
        } else {
            return false;
        }
    });
</script>
</html>
