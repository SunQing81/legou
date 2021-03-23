<%--
  Created by IntelliJ IDEA.
  User: 孙庆
  Date: 2020/3/8
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>乐购-搜索</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH }/css/bootstrap.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js"></script>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <span><a href="${APP_PATH}/forwordPage?url=Index">全部</a> ></span>
            <span></span>
        </div>
    </div>
    <div class="row" id="searchResultRow" style="min-height: 400px;margin-top: 20px"></div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="${APP_PATH }/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function () {
        //根据查找内容查找商品
        getSearchGoods();
    });

    //根据查找内容查找商品
    function getSearchGoods() {
        //根据搜索框的内容查询
        if (${sessionScope.searchContent != null}) {
            $.ajax({
                url: "${APP_PATH}/getSearchGoods",
                type: "GET",
                success: function (result) {
                    console.log(result);
                    setGoodsLable(result.extendInfo.searchContent);
                    build_search_show(result);
                }
            });
        }
        //根据一级分类查询
        if (${sessionScope.gftId != null}) {
            $.ajax({
                url: "${APP_PATH}/getGoodsByGftId",
                type: "GET",
                success: function (result) {
                    console.log(result);
                    setGoodsLable(result.extendInfo.goodsFirstType.gftName);
                    build_search_show(result);
                }
            });
        }
        //根据二级分类查询
        if (${sessionScope.gstId != null}) {
            $.ajax({
                url: "${APP_PATH}/getGoodsByGstId",
                type: "GET",
                success: function (result) {
                    console.log(result);
                    setGoodsLable(result.extendInfo.goodsSecondType.gstName);
                    build_search_show(result);
                }
            });
        }
        //根据三级分类查询
        if (${sessionScope.gtId != null}) {
            $.ajax({
                url: "${APP_PATH}/getGoodsByGtId",
                type: "GET",
                success: function (result) {
                    console.log(result);
                    setGoodsLable(result.extendInfo.goodsThreeType.gtName);
                    build_search_show(result);
                }
            });
        }

    }

    //构建查找商品的显示
    function build_search_show(result) {
        $(searchResultRow).empty();
        var goodsInfo = result.extendInfo.searchGoods;
        if (goodsInfo === undefined) {
            return false;
        }
        if (goodsInfo.length > 0) {
            $.each(goodsInfo, function (index, item) {
                var price = item.gPrice.toFixed(2);
                // alert(item.gId);
                var div = $("<div class=\"col-sm-2\"></div>")
                    .append($("<div class=\"thumbnail\" style='height: 230px'></div>")
                        .append($("<a></a>").prop("href", "${APP_PATH}/getGoodsByGid?gid=" + item.gId).prop("title", item.gDetailinfo)
                            .append($("<img style='width: 130px;height: 130px'/>").prop("src", "${APP_PATH}" + item.gImage)))
                        .append($("<div class=\"caption\"></div>")
                            .append($("<p></p>").addClass("gDetailinfo").text(item.gDetailinfo.substring(0, 22)))
                            .append($("<p></p>"))
                            .append($("<p style='color: red;font-size: 15px'></p>").addClass("gPrice").text("￥: " + price))
                            .append($("<div style='display: none;margin-top: -5px;margin-left: -13px;position: absolute'></div>").addClass("addcart").attr("gDetailinfo", item.gDetailinfo.substring(0, 22))
                                .append($("<button type='button' style='background:#98bf21;height:50px;width:164px;border: 0px;outline: none'></button>").attr("gid", item.gId).addClass("addBuyCar_btn")
                                    .append($("<span style='color: white;font-size: 16px;font-weight: 200'></span>").addClass("glyphicon").addClass("glyphicon-shopping-cart").text("加入购物车"))))));
                div.appendTo(searchResultRow);
            });
        } else {
            $(searchResultRow).append("对不起！没有查到此类商品");
        }
    }

    //为新生的.col-sm-2生成mouseover事件
    $(document).on("mouseover", ".col-sm-2", function () {
        $(this).find(".gDetailinfo").remove("p");
        $(this).find(".caption").children("div").show();
        return false;
    });
    $(document).on("mouseout", ".col-sm-2", function () {
        $(this).find(".caption").prepend(
            $("<p></p>").addClass("gDetailinfo").text($(this).find(".addcart").attr("gDetailinfo")));
        $(this).find(".caption").children("div").hide();
        return false;
    });
    //为新生的加入购物车按钮添加事件.addBuyCar_btn
    $(document).on("click", ".addBuyCar_btn", function () {
        var gid = $(this).attr("gid");
        var num = "1";
        var buyCarInfo = gid + "-" + num;
        $.ajax({
            url: "${APP_PATH}/addGoodsToBuyCar?buyCarInfo=" + buyCarInfo,
            method: "GET",
            success: function (result) {
                console.log(result);
                if (window.confirm("已加入购物车，是否查看购物车？")) {
                    location.href = "${APP_PATH}/forwordPage?url=BuyCar";
                }
            }
        });

    });

    //设置标签条
    function setGoodsLable(content) {
        $(".container").children("div.row:first").find("span:last").text("'" + content + "'");
    }
</script>
</html>
