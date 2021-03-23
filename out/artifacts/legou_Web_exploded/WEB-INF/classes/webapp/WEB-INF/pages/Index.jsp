<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!--必要样式-->
    <link href="${APP_PATH }/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${APP_PATH }/css/city-picker.css" rel="stylesheet" type="text/css"/>
    <link type="text/css" rel="stylesheet" href="${APP_PATH }/css/style.css"/>

    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js" charset="UTF-8"></script>
    <title>乐购</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!--Begin Menu Begin-->
<div class="i_bg bg_color">
    <div class="i_ban_bg">
        <!--Begin Banner Begin-->
        <div id="carousel-example-generic" class="carousel slide banner" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="${APP_PATH}/images/ban1.jpg" alt="..." width="740" height="401"/>
                </div>
                <div class="item">
                    <img src="${APP_PATH}/images/1002245.jpg" alt="..." width="740" height="401"/>
                </div>
                <div class="item">
                    <img src="${APP_PATH}/images/1001975.jpg" alt="..." width="740" height="401"/>
                </div>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!--End Banner End-->
        <div class="inews">
            <div class="news_t">
                <span class="fr"></span>公告栏
            </div>
            <div style="height: 150px">
                <center>通知</center>
                <br>
                <center style="font-size: 20px;" id="noticeContent"></center>
                <br>
                <span class="fr" style="margin-right: 20px"></span>
            </div>


            <div class="charge_t">话费充值
            </div>
            <form>
                <table border="0" style="width:205px; margin-top:10px;" cellspacing="0" cellpadding="0">
                    <tr height="35">
                        <td width="33">号码</td>
                        <td><input type="text" value="" class="c_ipt"/></td>
                    </tr>
                    <tr height="35">
                        <td>面值</td>
                        <td>
                            <select class="jj" name="city">
                                <option value="0" selected="selected">100元</option>
                                <option value="1">50元</option>
                                <option value="2">30元</option>
                                <option value="3">20元</option>
                                <option value="4">10元</option>
                            </select>
                            <span style="color:#ff4e00; font-size:14px;">￥99.5</span>
                        </td>
                    </tr>
                    <tr height="35">
                        <td colspan="2"><input type="submit" value="立即充值" class="c_btn"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="container" style="margin-top: 40px">
        <div class="row" style="margin-bottom: 20px">
            <p class="text-center">=======================================================<span style="font-size: 25px">&nbsp;热门商品&nbsp;</span>=======================================================
            </p>
        </div>
        <div class="row" id="hotGoods">

        </div>
        <div class="row freshAndfruitGoods" style="margin-bottom: 20px;margin-top: 20px">
            <p class="text-center">=======================================================<span style="font-size: 25px">&nbsp;生鲜水果&nbsp;</span>=======================================================
            </p>
        </div>
        <div class="row" id="freshAndfruitGoods">

        </div>
        <div class="row foodAndwaterGoods" style="margin-bottom: 20px;margin-top: 20px">
            <p class="text-center">=======================================================<span style="font-size: 25px">&nbsp;食品饮料&nbsp;</span>=======================================================
            </p>
        </div>
        <div class="row" id="foodAndwaterGoods">

        </div>
        <div class="row grainGoods" style="margin-bottom: 20px;margin-top: 20px">
            <p class="text-center">=======================================================<span style="font-size: 25px">&nbsp;粮油副食&nbsp;</span>=======================================================
            </p>
        </div>
        <div class="row" id="grainGoods">

        </div>
        <div class="row beautyGoods" style="margin-bottom: 20px;margin-top: 20px">
            <p class="text-center">=======================================================<span style="font-size: 25px">&nbsp;美容洗护&nbsp;</span>=======================================================
            </p>
        </div>
        <div class="row" id="beautyGoods">

        </div>
        <div class="row homeCleanGoods" style="margin-bottom: 20px;margin-top: 20px">
            <p class="text-center">=======================================================<span style="font-size: 25px">&nbsp;家居清洁&nbsp;</span>=======================================================
            </p>
        </div>
        <div class="row" id="homeCleanGoods">

        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
    $(function () {
        // alert("生鲜蔬果");
        builder_hotGoods("#hotGoods", 6);
        builder_IndexGoods_show("#freshAndfruitGoods", 1, 12);
        builder_IndexGoods_show("#foodAndwaterGoods", 2, 12);
        builder_IndexGoods_show("#grainGoods", 3, 12);
        builder_IndexGoods_show("#beautyGoods", 4, 12);
        builder_IndexGoods_show("#homeCleanGoods", 5, 12);
        //获取最新的公告信息
        getNoticeInfo();
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
        if (timestamp == null || timestamp === "") {
            return "";
        } else {
            return Y + M + D;
        }
    }

    //获取最新的公告信息
    function getNoticeInfo() {
        $.ajax({
            url: "${APP_PATH}/getAllNotice",
            type: "GET",
            success: function (result) {
                console.log(result.extendInfo.pageInfo.list[0]);
                $("#noticeContent").text(result.extendInfo.pageInfo.list[0].nContent);
                $("#noticeContent").next().next().text(timestampToTime(result.extendInfo.pageInfo.list[0].nCreatetime));
            }
        });
    }

    //热门商品展示，即根据点击量排序
    function builder_hotGoods(obj, num) {
        $.ajax({
            url: "${APP_PATH}/getHotGoods",
            method: "GET",
            success: function (result) {
                //清空对应栏的商品
                builder_IndexGoods_format(obj, num, result);
            }
        });
    }

    //构建首页商品展示
    function builder_IndexGoods_show(obj, gftId, num) {
        $.ajax({
            url: "${APP_PATH}/getGoods?gftId=" + gftId,
            method: "GET",
            success: function (result) {
                // console.log(result);
                builder_IndexGoods_format(obj, num, result);
            }
        });
    }

    //商品具体样式显示
    function builder_IndexGoods_format(obj, num, result) {
        $(obj).empty();
        var goodsInfo = result.extendInfo.GoodsInfo;
        $.each(goodsInfo, function (index, item) {
            if (index !== num) {
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
                div.appendTo(obj);
            } else {
                // 在each的回调函数中使用return false,是跳出each循环;return true 进入下一个循环；
                return false;
            }
        });
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
</script>
</html>