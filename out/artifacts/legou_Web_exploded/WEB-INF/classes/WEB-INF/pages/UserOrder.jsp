<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js"></script>
    <link type="text/css" rel="stylesheet" href="${APP_PATH }/css/style.css"/>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap.min.css"/>
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap-theme.min.css"/>


    <title>乐购-我的订单</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
    <div class="m_content">
        <%--                个人中心左面导航栏--%>
        <jsp:include page="u_leftnav.jsp"></jsp:include>
        <div class="m_right">
            <p></p>
            <div class="mem_tit">我的订单</div>
            <div class="container" style="width: 900px" id="allOrderInfo">

            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript" src="${APP_PATH}/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function () {
        //获取所有的订单信息
        getAllOrderByCid();
    });

    //获取所有的订单信息
    function getAllOrderByCid() {
        $.ajax({
            url: "${APP_PATH}/getAllOrderByCid",
            type: "GET",
            success: function (result) {
                console.log(result);
                builder_orderInfo_show(result)
            }
        });
    }

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

    //构建订单页显示
    function builder_orderInfo_show(result) {
        var allOrderInfo = result.extendInfo.allOrderInfo;
        $("#allOrderInfo").empty();
        $.each(allOrderInfo, function (index, item) {
            var row = $("<div></div>").addClass("row");
            var table = $("<table></table>").addClass("table");
            var firstTr = $("<tr style='background-color: #f3f3f3;height: 40px;'></tr>")
                .prepend($("<td style='width: 150px'></td>").text(timestampToTime(item.createtime)))
                .append($("<td></td>").append("订单号：").append(item.oId));
            var aProvince = item.address.aProvince.split("-");
            var aCity = item.address.aCity.split("-");
            var aDistrict = item.address.aDistrict.split("-");
            if (aCity[0] === "市辖区") {
                firstTr.append($("<td></td>")
                    .attr("address", item.address.aName + "-" + aProvince[0] + " " + aDistrict[0] + " " + item.address.aInfo + "-" + item.address.aPhone)
                    .append("收货人：")
                    .append($("<a data-container='body' data-toggle='popover' data-placement='top' data-html='true'></a>")
                        .addClass("addressShow").append(item.address.aName)));
            } else {
                firstTr.append($("<td></td>")
                    .attr("address", item.address.aName + "-" + aProvince[0] + " "
                        + aCity[0] + " " + aDistrict[0] + " " + item.address.aInfo + "-" + item.address.aPhone)
                    .append("收货人：")
                    .append($("<a data-container='body' data-toggle='popover' data-placement='top' data-html='true'></a>")
                        .addClass("addressShow").append(item.address.aName)));
            }
            if (item.totalMoney === 0.00) {
                firstTr.append($("<td></td>").append("积分订单"));
            } else {
                firstTr.append($("<td></td>").append("订单金额：￥").append(item.totalMoney.toFixed(2)));
            }
            if (item.payStatus === 0) {
                firstTr.append($("<td></td>").append("订单状态：").append("未付款"))
                    .append($("<td></td>").append($("<a class='deleteOrder_a'></a>")
                        .attr("delete-oid", item.oId).append("取消订单"))
                        .append($("<a style='margin-left: 15px'></a>")
                            .prop("href", "${APP_PATH}/goAlipay/" + item.oId).append("去付款")));
            } else if (item.payStatus === 1) {
                firstTr.append($("<td colspan='2'></td>").append("订单状态：").append("待揽收"));
            } else if (item.payStatus === 2) {
                firstTr.append($("<td colspan='2'></td>").append("订单状态：").append("发货中").append("  ")
                    .append($("<button class='btn btn-danger btn-sm confirmReceive' style='margin-left: 30px'></button>")
                        .attr("oId", item.oId).append("确认收货")));
            } else if (item.payStatus === 3) {
                firstTr.append($("<td colspan='2'></td>").append("订单状态：").append("已完成"));
            }
            var num = item.gNums.split("-");
            var isComment = item.isComment.split("-");
            $.each(allOrderInfo[index].goodsList, function (i, ele) {
                // console.log(index +"  "+ele.gId+"  "+ele.gDetailinfo);
                var otherTr = $("<tr style='width: 80px'></tr>").append($("<td></td>").append($("<img width='80px' height='80px'>")
                    .prop("src", "${APP_PATH}/" + ele.gImage)))
                    .append($("<td colspan='2' style='width: 245px'></td>").text(ele.gDetailinfo))
                    .append($("<td style='text-align: center'></td>").text("× " + num[i]));
                if (item.totalMoney === 0.00) {
                    otherTr.append($("<td style='text-align: center'></td>").append("积分：").append((ele.gPrice * num[i]).toFixed(2) * 100));
                } else {
                    otherTr.append($("<td style='text-align: center'></td>").append("小计：￥").append((ele.gPrice * num[i]).toFixed(2)));
                }
                // .append($("<td style='text-align: center'></td>").append("小计：￥").append((ele.gPrice * num[i]).toFixed(2)));
                if (isComment[i] === "0" && item.payStatus === 3) {
                    otherTr.append($("<td style='text-align: right;'></td>")
                        .append($("<a style='margin-right: 15px'></a>")
                            .prop("href", "${APP_PATH}/toComment/" + item.oId + "-" + allOrderInfo[index].goodsList[i].gId).append("去评价")));
                } else if (isComment[i] !== "0") {
                    otherTr.append($("<td style='text-align: right;margin-right: 15px'></td>")
                        .append($("<span style='margin-right: 15px'></span>").text("已评价")));
                }
                otherTr.appendTo(table);
            });
            row.append(table.prepend(firstTr)).appendTo("#allOrderInfo");
        });

        var height = $("#allOrderInfo").height().toString();
        height = parseInt(height);
        // console.log(height);
        if (height > 960) {
            $("#allOrderInfo").css("height", "890px").css("overflow", "scroll").css("overflow-x", "hidden");
        } else {
            $("#allOrderInfo").css("height", "940px").css("overflow", "");
        }
    }

    //弹出框显示地址信息
    $(document).on("mouseover", ".addressShow", function () {
        var address = $(this).parent("td").attr("address").toString().split("-");
        $(this).attr("data-content", "<p>" + address[0] + "</p>" + "<p>" + address[1] + "</p>" + "<p>" + address[2] + "</p>")
        $(this).popover('show');
    });
    $(document).on("mouseout", ".addressShow", function () {
        $(this).popover('hide');
    });
    //取消订单
    $(document).on("click", ".deleteOrder_a", function () {
        if (window.confirm("确认取消该订单吗？")) {
            $.ajax({
                url: "${APP_PATH}/deleteOrderByOid/" + $(this).attr("delete-oid"),
                type: "DELETE",
                success: function (result) {
                    getAllOrderByCid();
                }
            });
        }
    });
    //确认收货
    $(document).on("click", ".confirmReceive", function () {
        if (window.confirm("确认收到商品吗？")) {
            $.ajax({
                url: "${APP_PATH}/updateOrderSuccessStatus/" + $(this).attr("oId"),
                type: "PUT",
                success: function (result) {
                    getAllOrderByCid();
                }
            });
        }
    });
</script>
</html>
