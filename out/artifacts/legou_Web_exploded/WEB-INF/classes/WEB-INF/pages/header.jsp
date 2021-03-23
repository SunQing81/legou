<%--
  Created by IntelliJ IDEA.
  User: 孙庆
  Date: 2020/2/11
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH }/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${APP_PATH }/css/city-picker.css" rel="stylesheet" type="text/css"/>
    <link type="text/css" rel="stylesheet" href="${APP_PATH }/css/style.css"/>

    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js"></script>
    <script src="${APP_PATH }/js/city-picker.data.js"></script>
    <script src="${APP_PATH }/js/city-picker.js"></script>
    <script src="${APP_PATH }/js/main.js"></script>
    <script src="${APP_PATH }/js/bootstrap.js"></script>

    <script type="text/javascript">
        $(function () {
            //获取城市信息
            getCityInfo();
            //获取商品分类数据
            getGoodsType();
            //获取购物车数据
            getAllBuyCar_Index();
        });

        //获取城市信息
        function getCityInfo() {
            $.ajax({
                url: "${APP_PATH }/getCityInfo",
                type: "GET",
                success: function (result) {
                    $("span.placeholder").text(result.extendInfo.cityLocationInfo);
                }
            });
        }

        //请求商品分类数据
        function getGoodsType() {
            $.ajax({
                url: "${APP_PATH }/getGoodsType",
                type: "GET",
                success: function (result) {
                    // console.log(result);
                    //获取商品分类信息并显示在首页
                    if (${sessionScope.url eq 'Index'}) {
                        build_goodsType(result);
                    } else {
                        $("#leftNav").css("display", "none");
                        build_goodsType(result);
                    }
                }
            });
        }

        //获取商品分类信息并显示在首页
        function build_goodsType(result) {
            //清空商品分类数据
            $("#leftNav ul").empty();
            var zjTop = 70;
            var firstType = result.extendInfo.goodsFirstTypes;
            var secondType = result.extendInfo.goodsSecondTypes;
            var threeType = result.extendInfo.goodsThreeTypes;
            $.each(firstType, function (index, itemf) {
                zjTop -= 70;
                var goodsTypeDiv_fj = $("<div></div>").addClass("fj")
                    .append($("<span style=\"width: 210px;height: 80px;text-align: center;\"></span>")
                        .addClass("fl").append(itemf.gftName));
                var goodsTypeDiv_zj = $("<div style='border: #CCCCCC 1px solid'></div>").addClass("zj");
                goodsTypeDiv_zj.css("top", zjTop + "px");
                var goodsTypeDiv_zj_l = $("<div></div>").addClass("zj_l");
                // .append(.append($("<div></div>").addClass("zj_l_c")));
                $.each(secondType, function (index, items) {
                    if (itemf.gftId === items.gftId) {
                        var goodsTypeDiv_zj_l_c = $("<div></div>").addClass("zj_l_c").append($("<h2></h2>").append(items.gstName));
                        $.each(threeType, function (index, itemt) {
                            if (items.gstId === itemt.gstId) {
                                var goodsTypeDiv_zj_l_c_a = $("<a></a>")
                                    .prop("href", "${APP_PATH}/toGoodsPageByGtId?gtId=" + itemt.gtId).append(itemt.gtName);
                                goodsTypeDiv_zj_l_c.append(goodsTypeDiv_zj_l_c_a);
                            }
                        });
                        goodsTypeDiv_zj_l.append(goodsTypeDiv_zj_l_c);
                    }
                });
                goodsTypeDiv_zj.append(goodsTypeDiv_zj_l);
                $("<li></li>").attr("li_index", index).append(goodsTypeDiv_fj).append(goodsTypeDiv_zj).appendTo("#leftNav ul");
            });
        }

        //显示购物车详情
        $(document).on("mouseover", ".car_t", function () {
            //获取购物车数据
            getAllBuyCar_Index();
            $(this).find(".car_bg").show();
        });
        $(document).on("mouseout", ".car_t", function () {
            // $(".leftNav_ul li").find("span").css("border","0");
            $(this).find(".car_bg").hide();
        });

        //获取购物车数据
        function getAllBuyCar_Index() {
            $.ajax({
                url: "${APP_PATH}/getAllBuyCar",
                method: "GET",
                success: function (result) {
                    // console.log(result);
                    builder_buyCar_show_Index(result);
                }
            });
        }

        //显示购物车数据
        function builder_buyCar_show_Index(result) {
            $("#cars").empty();
            $("#total").empty();
            // console.log(result.extendInfo.buyCarInfo);
            if (result.extendInfo.buyCarInfo !== undefined) {
                if (result.extendInfo.buyCarInfo.length > 0) {
                    var buyCar = result.extendInfo.buyCarInfo;
                    $.each(buyCar, function (index, item) {
                        if (index < 5) {
                            $(".car_bg ul").css("height", "auto");
                        }
                        if (index >= 5) {
                            $(".car_bg ul").css("height", "400px").css("overflow", "scroll").css("overflow-x", "hidden");
                        }
                        var price = item.goods.gPrice.toFixed(2);
                        var imgDiv = $("<div></div>").addClass("img").append($("<a></a>").prop("href", "${APP_PATH}/getGoodsByGid?gid=" + item.gId)
                            .append($("<img width='58px' height='58px'/>").prop("src", "${APP_PATH}" + item.goods.gImage)));
                        var gDetailinfoDiv = $("<div></div>").addClass("name").append($("<a></a>").prop("href", "${APP_PATH}/getGoodsByGid?gid=" + item.gId)
                            .append(item.goods.gDetailinfo));
                        var gPriceDiv = $("<div></div>").addClass("price")
                            .append("￥").append(price).append("×" + item.bNum)
                            .append($("<div style='width: 28px;height: 20px;margin-top: -20px;margin-right: 15px;'></div>")
                                .append($("<a></a>").addClass("deleteGoodsForBuyCar").attr("delete-id", item.bId).append(" 删除")));
                        $("<li></li>")
                            .append(imgDiv)
                            .append(gDetailinfoDiv)
                            .append(gPriceDiv)
                            .appendTo("#cars");
                    });
                    $("#total").append($("<div></div>").addClass("price_a")
                        .append($("<a></a>").prop("href", "${APP_PATH}/forwordPage?url=BuyCar").text("去购物车")));
                } else {
                    $("#cars").append($("<li style='text-align: center'></li>").text("购物车为空，快去选购吧"));
                }
                $(".car_t").find("span").text(result.extendInfo.buyCarInfo.length);
            } else {
                location.reload();
            }
        }

        //在购物车删除商品
        $(document).on("click", ".deleteGoodsForBuyCar", function () {
            $.ajax({
                url: "${APP_PATH}/deleteGoodsInBuyCarByBid/" + $(this).attr("delete-id"),
                type: "DELETE",
                success: function (result) {
                    // location.reload();
                    getAllBuyCar_Index();
                }
            });
        });

        //搜索商品
        function searchGoods() {
            var searchContent = $("#searchContent").val();
            if (searchContent.length === 0) {
                return false;
            }
            location.href = "${APP_PATH}/toSearchGoodsPage?searchContent=" + searchContent;
        }
    </script>
    <%-- 首页分类效果--%>
    <script type="text/javascript">
        //当为.leftNav_ul 添加mouseover事件
        $(document).on("mouseover", ".leftNav_ul li", function () {
            // alert($(this).attr("li_index"));
            // console.log("绑定成功");
            $(this).css("border", "1px solid #CCCCCC");
            $(this).find(".zj").show();
        });
        //当为.leftNav_ul 添加mouseout事件
        $(document).on("mouseout", ".leftNav_ul li", function () {
            // alert("绑定成功");
            // console.log("绑定成功");
            $(this).css("border", "0");
            // $(".leftNav_ul li").find("span").css("border","0");
            $(this).find(".zj").hide();
        });
        //当为.leftNav_ul 添加mouseover事件
        $(document).on("mouseover", "#nav", function () {
            // alert($(this).attr("li_index"));
            // console.log("绑定成功");
            if (${sessionScope.url eq 'Index'}) {
                return false;
            } else {

                $("#leftNav").css("display", "");
            }
        });
        //当为.leftNav_ul 添加mouseout事件
        $(document).on("mouseout", "#nav", function () {
            // alert("绑定成功");
            // console.log("绑定成功");
            if (${sessionScope.url eq 'Index'}) {
                return false;
            } else {
                $("#leftNav").css("display", "none");
            }
        });
    </script>
</head>
<body>
<!--Begin Header Begin-->
<div class="soubg">
    <div class="sou">
        <!--Begin 所在收货地区 Begin-->
        <span class="s_city_b">
                <span class="fl">送货至：</span>
                    <div style="position: relative; left: 54px">
                            <input id="city-picker3" class="form-control" readonly type="hidden" value=""
                                   data-toggle="city-picker" data-simple="true" size="70">
                    </div>
            </span>
        <!--End 所在收货地区 End-->
        <c:if test="${sessionScope.customer.cName != null}">
        <span class="fr" style="width: auto">
                <span class="fl">欢迎,<a style="color:#ff4e00;"
                                       href="${APP_PATH }/forwordPage?url=UserCenter">${sessionScope.customer.cName}</a>&nbsp;</span>
                <span class="fl exit"><a href="${APP_PATH }/safety_exit"
                                         style="text-decoration: none">退出</a>&nbsp;</span>
                <span class="fl"><a href="${APP_PATH}/forwordPage?url=UserOrder">我的订单</a>&nbsp;</span>
<%--                <span class="fl"><a href="#">收藏夹</a>&nbsp;</span>--%>
            </c:if>
            <c:if test="${sessionScope.customer.cName == null}">
                <span class="fr" style="width: 332px">
                <span class="fl">你好，请<a href="${APP_PATH}/forwordPage?url=Login"
                                        style="color:#ff4e00; text-decoration: none">登录</a>
                <a href="${APP_PATH}/forwordPage?url=Regist" style="color:#ff4e00;text-decoration: none">免费注册</a>&nbsp;</span>
                <span class="fl"><a href="${APP_PATH}/forwordPage?url=Login">我的订单</a>&nbsp;</span>
<%--                <span class="fl"><a href="${APP_PATH}/forwordPage?url=Login">收藏夹</a>&nbsp;</span>--%>
            </c:if>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh fr"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            </span>
    </div>
</div>
<div class="top">
    <div class="logo">
        <a href="${APP_PATH}/forwordPage?url=Index"><img src="${APP_PATH}/images/logo.png"/></a>
    </div>
    <div class="search">
        <form>
            <input type="text" value="" class="s_ipt" id="searchContent"/>
            <input type="button" value="搜索" class="s_btn" onclick="searchGoods()"/>
        </form>
        <span class="fl">
                <a href="${APP_PATH}/toSearchGoodsPage?searchContent=苹果">苹果</a>
                <a href="${APP_PATH}/toSearchGoodsPage?searchContent=牛奶">牛奶</a>
                <a href="${APP_PATH}/toSearchGoodsPage?searchContent=猪肉脯">猪肉脯</a>
                <a href="${APP_PATH}/toSearchGoodsPage?searchContent=花生油">花生油</a>
                <a href="${APP_PATH}/toSearchGoodsPage?searchContent=口罩">口罩</a>
                <a href="${APP_PATH}/toSearchGoodsPage?searchContent=方便面">方便面</a>
            </span>
    </div>
    <div class="i_car">
        <div class="car_t">购物车 [ <span>0</span> ]</div>
        <div class="car_bg">
            <ul class="cars" id="cars"></ul>
            <div id="total"></div>
        </div>
    </div>
</div>
<!--End Header End-->
<div class="menu_bg">
    <div class="menu">
        <!--Begin 商品分类详情 Begin-->
        <div class="nav" id="nav">
            <div class="nav_t" style="padding-left: 20px">全部商品分类</div>
            <div class="leftNav" id="leftNav" style="margin-top: -1px">
                <ul class="leftNav_ul">
                </ul>
            </div>
        </div>
        <!--End 商品分类详情 End-->
        <ul class="menu_r">
            <li><a href="${APP_PATH}/forwordPage?url=Index">首页</a></li>
        </ul>
        <div class="m_ad"><span class="glyphicon glyphicon-shopping-cart"></span> 满68免运费</div>
    </div>
</div>
</body>
</html>
