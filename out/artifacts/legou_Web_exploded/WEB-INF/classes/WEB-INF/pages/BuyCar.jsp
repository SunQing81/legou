<%--
  Created by IntelliJ IDEA.
  User: 孙庆
  Date: 2020/2/26
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>乐购-购物车</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link type="text/css" rel="stylesheet" href="${APP_PATH }/css/style.css"/>
    <link href="${APP_PATH }/css/bootstrap.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="i_bg">
    <div class="content mar_20">
        <img src="${APP_PATH}/images/img1.jpg"/>
    </div>
    <!--Begin 第一步：查看购物车 Begin -->
    <div class="content mar_20">
        <div class="container">
            <div class="row">
                <table class="table table-striped" id="buyCarInfo_table">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="check_all"/>全选</th>
                        <th>商品</th>
                        <th>单价</th>
                        <th>购买数量</th>
                        <th>小计</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <div class="row" id="workOutRow"></div>
        </div>
    </div>
    <!--End 第一步：查看购物车 End-->
    <!--Begin Footer Begin -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!--End Footer End -->
</div>
<script type="text/javascript">
    $(function () {
        //获取购物车数据
        getAllBuyCar();
    });
    //购物车中复选框选中的个数
    var count = 0;
    //购物车复选框选中对应的总金额
    var totalMoney = 0;

    //获取购物车数据
    function getAllBuyCar() {
        $.ajax({
            url: "${APP_PATH}/getAllBuyCar",
            method: "GET",
            success: function (result) {
                // console.log(result);
                builder_buyCar_show(result);
            }
        });
    }

    //显示购物车数据
    function builder_buyCar_show(result) {
        $("#buyCarInfo_table tbody").empty();
        $("#workOutRow").empty();
        // console.log(result.extendInfo.buyCarInfo);
        if (result.extendInfo.buyCarInfo.length > 0) {
            var buyCarInfo_totalMoney = 0;
            $("#buyCarInfo_table").parent("div").css("height", "auto");
            $("#check_all").attr("totalNum_check_all", result.extendInfo.buyCarInfo.length);
            var buyCar = result.extendInfo.buyCarInfo;
            $.each(buyCar, function (index, item) {
                var price = item.goods.gPrice.toFixed(2);
                var totalPrice = (price * item.bNum).toFixed(2);
                buyCarInfo_totalMoney += parseFloat(totalPrice);
                var checkBoxTd = $("<td></td>").attr("bid", item.bId).append("<input type='checkbox' class='check_item' />");
                var gDetailinfoTd = $("<td style='width: 410px'></td>").append($("<div style='float: left'></div>")
                    .append($("<img style='width: 80px'>").prop("src", "${APP_PATH}/" + item.goods.gImage)))
                    .append($("<div style='float: left;width: 300px;margin-left: 5px;font-size: 13px'></div>")
                        .append(item.goods.gDetailinfo));
                var gPriceTd = $("<td></td>").append(price);
                var numTableBtn = $("<td></td>").append($("<table border='0' style='margin-left: 0px'></table>")
                    .append($("<tr></tr>").attr("gnum", item.goods.gNum).attr("bid", item.bId)
                        .append($("<td></td>").append($("<button type='button'></button>").addClass("btn btn-default subBtn").text("-")))
                        .append($("<td></td>").append($("<input type='text' style='width: 80px'/>").addClass("form-control g_num").prop("value", item.bNum).attr("oldNum", item.bNum)))
                        .append($("<td></td>").append($("<button type='button'></button>").addClass("btn btn-default addBtn").text("+")))));
                var totalmoneyTd = $("<td style='font-weight: 700'></td>").append(totalPrice);
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除");
                //为删除按钮添加一个自定义的属性，来表示当前员工id
                delBtn.attr("delete-id", item.bId);
                // var collectBtn = $("<button></button>").addClass("btn btn-primary btn-sm collect_btn").append("加入收藏");
                //为编辑按钮添加一个自定义的属性，来表示当前地址id
                // collectBtn.attr("col-id",item.gId);
                // var btnTd = $("<td></td>").append(delBtn).append(" ").append(collectBtn);
                var btnTd = $("<td></td>").append(delBtn);
                $("<tr></tr>").append(checkBoxTd)
                    .append(gDetailinfoTd)
                    .append(gPriceTd)
                    .append(numTableBtn)
                    .append(totalmoneyTd)
                    .append(btnTd)
                    .appendTo("#buyCarInfo_table tbody");
            });
            $("#buyCarInfo_table").attr("buyCarInfo_totalMoney", buyCarInfo_totalMoney.toFixed(2));
            $("#workOutRow").css("margin-top", "20px").css("margin-bottom", "50px").css("background-color", "#f2f2f2").css("height", "80px").css("line-height", "80px").addClass("row")
                .append($("<button type='button' id='buyCar_delete_checked_btn'></button>").addClass("btn btn-danger").text("删除选中商品"))
                .append(" ")
                // .append($("<button type='button'></button>").addClass("btn btn-info").text("移入收藏"))
                // .append(" ")
                .append($("<button type='button' id='cleanBuyCar'></button>").addClass("btn btn-danger").text("清空购物车"))
                .append($("<span style='margin-left: 550px;width: auto'></span>")
                    .append($("<span style=''></span>").text("已选择 "))
                    .append($("<span style='color: red;font-size: 18px'></span>").addClass("totalNum").text("0"))
                    .append($("<span style=''></span>").text(" 件商品")))
                .append($("<div style='float: left;margin-top: -83px;margin-left: 900px'></div>")
                    .append($("<span style='margin-left: 54px;width: auto;'></span>")
                        .append($("<span style=''></span>").text("总价："))
                        .append($("<span style='color: red;font-weight: 700;font-size: 20px;padding-right: 10px'></span>")
                            .addClass("totalMoney").text("￥ 0.00"))))
                .append($("<div style='float: right;margin-top: -75px'></div>")
                    .append($("<a role='button' tabindex='0' style='border: 0px;height: 80px;margin-top: -7px;display: block;line-height: 65px;' id='toWorkOut'></a>")
                        .addClass("btn btn-danger").text("去结算")));
        } else {
            $("#buyCarInfo_table").parent("div").css("height", "500px");
            var isLogin_a;
            var span_text;
            var div_content;
            if (${sessionScope.customer == null}) {
                div_content = $("<div style='width: 400px;float: left;margin-left: 10px'></div>");
                isLogin_a = $("<a></a>").prop("href", "${APP_PATH}/forwordPage?url=Login").attr("role", "button").addClass("btn").addClass("btn-danger").addClass("btn-sm").text("登录");
                span_text = $("<span></span>").text("购物车内暂时没有商品，登录后将显示您之前加入的商品");
            } else {
                div_content = $("<div style='width: 180px;float: left;margin-left: 10px'></div>");
                isLogin_a = "";
                span_text = $("<span></span>").text("购物车内暂时没有商品");
            }
            $("#buyCarInfo_table tbody")
                .append($("<tr style='background-color: white;'></tr>")
                    .append($("<td colspan='6'></td>").append($("<div style='margin-top: 180px;'></div>")
                        .append($("<div style='float: left;margin-left: 378px'></div>")
                            .append($("<img/>").prop("src", "${APP_PATH}/images/no-login-icon.png")))
                        .append(div_content
                            .append(span_text)
                            .append(isLogin_a)
                            .append(" ")
                            .append($("<a style='color: red'></a>").prop("href", "${APP_PATH}/forwordPage?url=Index").text("去购物 >>"))))));
        }
    }


    //设置商品的数量 + 、 -  以及输入框的内容是否规范，并更改数据库的信息
    $(document).on("blur", ".g_num", function () {
        var oldNum = $(this).attr("oldNum");
        var maxNum = $(this).parent().parent("tr").attr("gnum");
        maxNum = parseInt(maxNum);
        var nowNum = $(this).val();
        var price = $(this).parents("table").parent("td").prev().text();
        price = parseFloat(price);
        var totalPrice = 0;
        var reg_num = /^[0-9]+$/g;
        if (reg_num.test(nowNum)) {
            nowNum = parseInt(nowNum);
            if (nowNum > maxNum) {
                totalPrice = price * maxNum;
                $(this).parent().parent("tr").find("input").prop("value", maxNum);
                updateGoodsNumByBid($(this).parent().parent("tr").attr("bid"), maxNum);
            } else if (nowNum < 1) {
                totalPrice = price;
                $(this).parent().parent("tr").find("input").prop("value", 1);
                updateGoodsNumByBid($(this).parent().parent("tr").attr("bid"), 1);
            } else {
                totalPrice = price * nowNum;
                updateGoodsNumByBid($(this).parent().parent("tr").attr("bid"), nowNum);
            }
        } else {
            totalPrice = price * oldNum;
            $(this).parent().parent("tr").find("input").prop("value", oldNum);
        }
        $(this).parents("table").parent("td").next().text(totalPrice.toFixed(2));
    });
    $(document).on("click", ".addBtn", function () {
        // alert("+");
        var maxNum = $(this).parent().parent("tr").attr("gnum");
        maxNum = parseInt(maxNum);
        var nowNum = $(this).parent().parent("tr").find("input").prop("value");
        nowNum = parseInt(nowNum);
        var price = $(this).parents("table").parent("td").prev().text();
        price = parseFloat(price);
        var totalPrice = 0;
        if (nowNum < maxNum) {
            totalPrice = price * (nowNum + 1);
            $(this).parent().parent("tr").find("input").prop("value", nowNum + 1);
            updateGoodsNumByBid($(this).parent().parent("tr").attr("bid"), nowNum + 1);
        } else {
            totalPrice = price * maxNum;
            $(this).parent().parent("tr").find("input").prop("value", maxNum);
            updateGoodsNumByBid($(this).parent().parent("tr").attr("bid"), maxNum);
        }
        $(this).parents("table").parent("td").next().text(totalPrice.toFixed(2));
    });
    $(document).on("click", ".subBtn", function () {
        // alert("-");
        var nowNum = $(this).parent().parent("tr").find("input").prop("value");
        nowNum = parseInt(nowNum);
        var price = $(this).parents("table").parent("td").prev().text();
        price = parseFloat(price);
        var totalPrice = 0;
        if (nowNum > 1) {
            totalPrice = price * (nowNum - 1);
            $(this).parent().parent("tr").find("input").prop("value", nowNum - 1);
            updateGoodsNumByBid($(this).parent().parent("tr").attr("bid"), nowNum - 1);
        } else {
            totalPrice = price;
            $(this).parent().parent("tr").find("input").prop("value", 1);
            updateGoodsNumByBid($(this).parent().parent("tr").attr("bid"), 1);
        }
        $(this).parents("table").parent("td").next().text(totalPrice.toFixed(2));
    });

    /**
     * 修改 ，更改商品数量
     */
    function updateGoodsNumByBid(bid, num) {
        var updateData = bid + "-" + num;
        $.ajax({
            url: "${APP_PATH}/updateGoodsNumByBid?updateNum=" + updateData,
            method: "PUT",
            success: function (result) {
                // location.reload();
            }
        });
    }

    /**
     *  删除
     */
    //为新生的delete_btn添加事件  .delete_btn"
    $(document).on("click", ".delete_btn", function () {
        //删除对应的商品信息
        deleteGoodsInBuyCarByBid($(this).attr("delete-id"));
    });

    //删除对应的商品信息
    function deleteGoodsInBuyCarByBid(bid) {
        if (confirm("确认删除吗？")) {
            $.ajax({
                url: "${APP_PATH}/deleteGoodsInBuyCarByBid/" + bid,
                type: "DELETE",
                success: function (result) {
                    getAllBuyCar();
                }
            });
        }
    }

    //为新生的cleanBuyCar添加事件  清空购物车
    $(document).on("click", "#cleanBuyCar", function () {
        if (window.confirm("确认清空购物车吗？")) {
            if (${sessionScope.customer != null}) {
                $.ajax({
                    url: "${APP_PATH}/cleanBuyCarByStatus",
                    type: "DELETE",
                    success: function (result) {
                        location.reload();
                    }
                });
            } else {
                $.ajax({
                    url: "${APP_PATH}/cleanBuyCarByStatus",
                    type: "DELETE",
                    success: function (result) {
                        location.reload();
                    }
                });
            }
        }
    });

    //完成全选、全不选
    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
        if ($(this).prop("checked")) {
            count = parseInt($(this).attr("totalNum_check_all"));
            totalMoney = parseFloat($(this).parents("table").attr("buyCarInfo_totalMoney"));
        } else {
            count = 0;
            totalMoney = 0;
        }
        setTotalNumAndMoney(count, totalMoney);
    });
    //为新生的CheckBox添加事件  .check_item"
    $(document).on("click", ".check_item", function () {
        //判断当前选择的元素是否5个
        var flag = $(".check_item:checked").length === $(".check_item").length;
        $("#check_all").prop("checked", flag);
        var money = $(this).parents("tr").find("td:eq(7)").text();
        var bid = $(this).parents("tr").find(".delete_btn").attr("delete-id") + "-";
        money = parseFloat(money);
        if ($(this).prop("checked")) {
            count++;
            totalMoney += money;
        } else {
            count--;
            totalMoney -= money;
        }
        setTotalNumAndMoney(count, totalMoney);
    });

    //设置结算总钱数
    function setTotalNumAndMoney(count, money) {
        $("#buyCarInfo_table").parent("div").parent("div").find(".totalNum").text(count);
        $("#buyCarInfo_table").parent("div").parent("div").find(".totalMoney").text("￥ " + money.toFixed(2));
    }

    //点击删除选中商品，就批量删除
    $(document).on("click", "#buyCar_delete_checked_btn", function () {
        var del_idstr = "";
        $.each($(".check_item:checked"), function () {
            // alert($(this).parents("tr").find("td:eq(2)").text());
            del_idstr += $(this).parents("tr").find(".delete_btn").attr("delete-id") + "-";
        });
        //去除del_idstr多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length - 1);
        console.log(del_idstr);
        if (del_idstr.length > 0) {
            if (confirm("确认删除所选中的内容吗？")) {
                //发送ajax请求删除
                $.ajax({
                    url: "${APP_PATH}/deleteGoodsInBuyCarByBid/" + del_idstr,
                    type: "DELETE",
                    success: function (result) {
                        // alert(result.msg);
                        location.reload();
                    }
                });
            }
        }
    });

    //去结算
    $(document).on("click", "#toWorkOut", function () {
        var allcheckBox = $("#buyCarInfo_table tbody").find(":checkbox");
        var bids = "";
        for (var i = 0; i < allcheckBox.length; i++) {
            if (allcheckBox.eq(i).prop("checked")) {
                bids = bids + allcheckBox.eq(i).parent("td").attr("bid") + "-";
            }
        }
        bids = bids.substring(0, bids.length - 1);
        // console.log(bids);
        if (bids.length > 0 && ${sessionScope.customer != null}) {
            location.href = "${APP_PATH}/toBuyCar_Two?bids=" + bids;
        } else {
            if (${sessionScope.customer != null}) {
                alert("未选择商品");
            } else {
                location.href = "${APP_PATH}/forwordPage?url=Login";
            }
        }
    });
</script>
</body>
</html>
