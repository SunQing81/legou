<%--
  Created by IntelliJ IDEA.
  User: 孙庆
  Date: 2020/2/18
  Time: 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>乐购-积分商城</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js"></script>
    <link type="text/css" rel="stylesheet" href="${APP_PATH }/css/style.css"/>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap.min.css"/>
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap-theme.min.css"/>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<c:choose>
    <c:when test="${sessionScope.customer != null}">
        <div class="i_bg bg_color">
            <!--Begin 用户中心 Begin -->
            <div class="m_content">
                    <%--                个人中心左面导航栏--%>
                <jsp:include page="u_leftnav.jsp"></jsp:include>
                <div class="m_right">
                    <div class="m_des" id="myJiFen">
                        我的积分：<span style="font-weight: 500;font-size: 15px;">${sessionScope.customer.jifen}</span>
                    </div>
                    <div class="container" style="width: 850px">
                        <div class="row" style="margin-bottom: 20px;margin-top: 20px">
                            <p class="text-center">===============================
                                <span style="font-size: 25px">&nbsp;积分商城&nbsp;</span>===============================</p>
                        </div>
                        <div class="row" id="jiFenGoodsRow">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </c:when>
    <c:otherwise>
        <script type="text/javascript">
            window.location.href = "${APP_PATH}/forwordPage?url=Login";
        </script>
    </c:otherwise>
</c:choose>

</body>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${APP_PATH}/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        //获取所有的商品，按照价格排序，取前12个
        getGoodsByPrice();
    });

    //根据价格获取商品
    function getGoodsByPrice() {
        $.ajax({
            url: "${APP_PATH}/getGoodsByPrice",
            type: "GET",
            success: function (result) {
                console.log(result);
                builder_JiFenGoods_show(result);
            }
        });
    }

    //商品具体样式显示
    function builder_JiFenGoods_show(result) {
        $("#jiFenGoodsRow").empty();
        var goodsInfo = result.extendInfo.GoodsByPrice;
        $.each(goodsInfo, function (index, item) {
            var price = item.gPrice.toFixed(2);
            var div = $("<div class=\"col-sm-3\"></div>")
                .append($("<div class=\"thumbnail\" style='height: 230px'></div>")
                    .append($("<a></a>").prop("href", "${APP_PATH}/getGoodsByGid?gid=" + item.gId).prop("title", item.gDetailinfo)
                        .append($("<img style='width: 130px;height: 130px'/>").prop("src", "${APP_PATH}" + item.gImage)))
                    .append($("<div class=\"caption\"></div>")
                        .append($("<p></p>").addClass("gDetailinfo").text(item.gDetailinfo.substring(0, 22)))
                        .append($("<p></p>"))
                        .append($("<p style='color: red;font-size: 15px'></p>").addClass("gPrice").text("积分: " + price * 100))
                        .append($("<div style='display: none;margin-top: -5px;margin-left: -13px;position: absolute'></div>").addClass("addcart")
                            .attr("gDetailinfo", item.gDetailinfo.substring(0, 22))
                            .append($("<button type='button' style='background:#98bf21;height:50px;width:181px;border: 0px;outline: none'></button>")
                                .attr("jifen", price * 100).attr("gid", item.gId).addClass("addBuyCar_btn")
                                .append($("<span style='color: white;font-size: 16px;font-weight: 200'></span>").addClass("glyphicon")
                                    .addClass("glyphicon-shopping-cart").text("兑 换"))))));
            div.appendTo("#jiFenGoodsRow");
        });
    }

    //为新生的.col-sm-2生成mouseover事件
    $(document).on("mouseover", ".col-sm-3", function () {
        $(this).find(".gDetailinfo").remove("p");
        $(this).find(".caption").children("div").show();
        return false;
    });
    $(document).on("mouseout", ".col-sm-3", function () {
        $(this).find(".caption").prepend(
            $("<p></p>").addClass("gDetailinfo").text($(this).find(".addcart").attr("gDetailinfo")));
        $(this).find(".caption").children("div").hide();
        return false;
    });
    //为新生的加入购物车按钮添加事件.addBuyCar_btn
    $(document).on("click", ".addBuyCar_btn", function () {
        var gid = $(this).attr("gid");
        var myJifen = "${sessionScope.customer.jifen}";
        myJifen = parseInt(myJifen);
        var jifen = $(this).attr("jifen");
        jifen = parseInt(jifen);
        if (myJifen < jifen) {
            alert("积分不足以兑换该商品！");
            return false;
        } else {
            location.href = "${APP_PATH}/toJiFenOrderPage/" + gid;
        }
        /*$.ajax({
            url:"
        ${APP_PATH}/addGoodsToBuyCar?buyCarInfo="+buyCarInfo,
            method:"GET",
            success:function (result) {
                console.log(result);
                if (window.confirm("已加入购物车，是否查看购物车？")){
                    location.href = "
        ${APP_PATH}/forwordPage?url=BuyCar";
                }
            }
        });*/
    });
</script>
</html>
