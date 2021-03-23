<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link type="text/css" rel="stylesheet" href="${APP_PATH }/css/style.css"/>
    <link href="${APP_PATH }/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${APP_PATH}/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js"></script>
    <title>乐购-商品详情</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!--End Menu End-->
<div class="i_bg">
    <div style="background-color: #f2f2f2;width: 100%;margin-bottom: 10px">
        <div class="postion">
            <span class="fl"></span>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <img src="${APP_PATH}/${sessionScope.goodsInfo.gImage}" width="390" height="390" class="img-thumbnail"/>
            </div>
            <div class="col-md-6">
                <div class="row gDetailinfo" style="margin-bottom: 50px"
                     gDetailinfo="${sessionScope.goodsInfo.gDetailinfo}">
                    <p style="font-size: 15px"><b>${sessionScope.goodsInfo.gDetailinfo}</b></p>
                </div>
                <div class="row gPrice" style="background-color: #f3f3f3;height: 40px;line-height: 40px">
                    <p>
                        价&nbsp;格&nbsp;
                        <span style="color: red;">￥&nbsp;</span>
                        <b style="color: red;font-size: 22px"></b>
                    </p>
                </div>
                <div class="row gnum" style="margin-top: 30px;margin-bottom: 70px">
                    <p gnum="${sessionScope.goodsInfo.gNum}">库&nbsp;存&nbsp;：${sessionScope.goodsInfo.gNum}&nbsp;份</p>
                </div>
                <div class="row addCar" style="margin-left: -345px">
                    <table border="0">
                        <tr>
                            <td>
                                <input type="text" class="form-control" id="g_num" aria-describedby="sizing-addon1"
                                       value="1" style="height: 50px;width: 60px" onkeyup="checkNumFormart()">
                            </td>
                            <td>
                                <div class="btn-group-vertical" role="group">
                                    <button type="button" class="btn btn-default" id="addNum"
                                            style="height: 25px;line-height: 14px">+
                                    </button>
                                    <button type="button" class="btn btn-default " id="subNum"
                                            style="height: 25px;line-height: 14px">-
                                    </button>
                                </div>
                            </td>
                            <td>
                                <button type="button" id="addBuyCar_btn" gid="${sessionScope.goodsInfo.gId}"
                                        style="border: 0;width: 150px;height: 50px;background-color: #df3033;font-size: 18px;font-weight: 700;color: white;margin-left: 10px"
                                        onclick="addBuyCar()">加入购物车
                                </button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="row" style="margin-top: 10px">
                    <p>温馨提示 ·不支持7天无理由退货</p>
                </div>
            </div>
        </div>
        <div class="row" id="commentRow" style="margin-bottom: 50px;margin-top: 50px;">
            <div class="row" style="background-color: #f2f2f2;height: 80px">
                <div class="col-md-4">
                    <h3 style="line-height: 80px">商品评价</h3>
                </div>
            </div>
            <div class="row" style="margin-top: 30px">
                <div class="col-md-2">
                    好评率：<span style="color:red;font-size: 25px"></span>
                </div>
                <div class="col-md-10">
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped active" role="progressbar"
                             aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 30px" id="commentInfoRow"></div>
            <div class="row">
                <%--            分页文字信息--%>
                <div class="col-md-6" id="page_info_area"></div>
                <%--            分页条信息--%>
                <div class="col-md-5 col-sm-offset-1" id="page_nav_area"></div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
<script src="${APP_PATH}/layui/layui.js"></script>
<script type="text/javascript">
    $(function () {
        //设置商品分类详情标签
        setTypeInfo();
        //设置价格保留两位小数，不够补0
        setFloatPrice();
        //获取商品有关评价
        to_page(1);
    });
</script>
<%--商品--%>
<script type="text/javascript">
    //设置价格保留两位小数，不够补0
    function setFloatPrice() {
        if (${sessionScope.goodsInfo.gPrice}) {
            var num_str = "${sessionScope.goodsInfo.gPrice}";
            var floatPrice = parseFloat(num_str).toFixed(2);
            $(".gPrice").find("b").text(floatPrice);
        }
    }

    //设置商品分类详情标签
    function setTypeInfo() {
        var typeInfo = "<%=session.getAttribute("typeInfo").toString()%>";
        var gDetailinfo = $(".gDetailinfo").attr("gDetailinfo").toString().substring(0, 12);
        if (typeInfo) {
            var goodsType = typeInfo.split("-");
            var all_a = $("<a></a>").prop("href", "${APP_PATH}/forwordPage?url=Index").text("全部");
            var firstType = $("<a></a>").prop("href", "${APP_PATH}/toGoodsPageByGftId?gftId=" + goodsType[0]).text(goodsType[1]);
            var secondType = $("<a></a>").prop("href", "${APP_PATH}/toGoodsPageByGstId?gstId=" + goodsType[2]).text(goodsType[3]);
            var threeType = $("<a></a>").prop("href", "${APP_PATH}/toGoodsPageByGtId?gtId=" + goodsType[4]).text(goodsType[5]);
            $(".postion").find("span").append(all_a).append(" > ").append(firstType).append(" > ")
                .append(secondType).append(" > ").append(threeType).append(" > ").append(gDetailinfo);
        }
    }

    //设置商品的数量 + 、 -  以及输入框的内容是否规范
    var oldNum = $(".addCar").find("input").prop("value").toString();

    function checkNumFormart() {
        var maxNum = $(".gnum").find("p").attr("gnum");
        maxNum = parseInt(maxNum);
        var nowNum = $(".addCar").find("input").prop("value").toString();
        var reg_num = /^[0-9]+$/g;
        if (reg_num.test(nowNum)) {
            nowNum = parseInt(nowNum);
            if (nowNum > maxNum) {
                $(".addCar").find("input").prop("value", maxNum);
                return false;
            } else if (nowNum < 1) {
                $(".addCar").find("input").prop("value", 1);
                return false;
            } else {
                oldNum = nowNum;
            }
        } else {
            $(".addCar").find("input").prop("value", oldNum);
        }
    }

    $("#addNum").click(function () {
        // alert("+");
        var maxNum = $(".gnum").find("p").attr("gnum");
        maxNum = parseInt(maxNum);
        var nowNum = $(".addCar").find("input").prop("value");
        nowNum = parseInt(nowNum);
        if (nowNum < maxNum) {
            $(".addCar").find("input").prop("value", nowNum + 1);
        } else {
            $(".addCar").find("input").prop("value", maxNum);
        }
    });
    $("#subNum").click(function () {
        // alert("-");
        var nowNum = $(".addCar").find("input").prop("value");
        nowNum = parseInt(nowNum);
        if (nowNum > 1) {
            $(".addCar").find("input").prop("value", nowNum - 1);
        } else {
            $(".addCar").find("input").prop("value", 1);
        }
    });


    //加入购物车
    function addBuyCar() {
        var gid = $("#addBuyCar_btn").attr("gid");
        var num = $("#g_num").val();
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
    }
</script>
<%--评价相关信息--%>
<script type="text/javascript">

    /**
     * 查询
     */
    //获取商品有关评价(分页)
    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/getAllCommentByGid",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result);
                //1.解析并显示评论数据
                builder_comment_show(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    //1.构建评论显示
    function builder_comment_show(result) {
        $("#commentInfoRow").empty();
        var commentShowRow = $("#commentInfoRow");
        var comment = result.extendInfo.pageInfo.list;
        var favorableRate = 0;
        var table = $("<table></table>").addClass("table");
        if (comment === undefined) {
            commentShowRow.prev("div.row").empty();
            return false;
        }
        if (comment.length > 0) {
            $.each(comment, function (index, item) {
                favorableRate += item.score;

                var tr = $("<tr></tr>");
                tr.append($("<td></td>").addClass("col-md-2")
                    .append($("<p></p>").text(item.customer.cName))
                    .append($("<p style=\"font-size: 12px;color: #0f0303\"></p>").text(timestampToTime(item.createtime))))
                    .append($("<td></td>").addClass("col-md-10")
                        .append($("<div></div>").prop("id", item.commentId).attr("score", item.score))
                        .append($("<br>"))
                        .append($("<p></p>").text(item.commentContent)))
                    .appendTo(table.append($("<tbody></tbody>")));
                setScore("#" + item.commentId, item.score);
            });
            favorableRate = favorableRate * (1 / (comment.length * 5));
            favorableRate = favorableRate.toFixed(2);
            commentShowRow.prev("div.row").find("div.progress-bar").css("width", favorableRate * 100 + "%");
            commentShowRow.prev("div.row").children("div:first").find("span").text(favorableRate * 100 + "%");
        } else {
            commentShowRow.prev("div.row").empty();
            commentShowRow.next().empty();
            $("<tr></tr>").append($("<td colspan='2' style='text-align: center;height: 300px;color: red'></td>")
                .text("还没有评论呦！快下单吧")).appendTo(table);
        }
        commentShowRow.append(table);
    }

    //2.解析并显示分页信息
    function build_page_info(result) {
        //清空分页信息
        $("#page_info_area").empty();
        $("#page_info_area")
            .append("<br>")
            .append("当前" + result.extendInfo.pageInfo.pageNum + "页，" +
                "总" + result.extendInfo.pageInfo.pages + "页，" +
                "总" + result.extendInfo.pageInfo.total + "条记录");
        totalRecord = result.extendInfo.pageInfo.total;
        currentPae = result.extendInfo.pageInfo.pageNum;
    }

    //3.解析并显示分页条,以及完善分页条的功能
    function build_page_nav(result) {
        //清空分页条
        $("#page_nav_area").empty();
        var nav = $("<nav></nav>").attr("aria-label", "Page navigation");
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>")
            .append($("<span></span>").append("&laquo;").attr("aria-hidden", "true")))
            .attr("href", "#").attr("aria-label", "Previous");
        var nextPageLi = $("<li></li>").append($("<a></a>")
            .append($("<span></span>").append("&raquo;").attr("aria-hidden", "true")))
            .attr("href", "#").attr("aria-label", "Next");
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        //为元素添加点击翻页的事件
        firstPageLi.click(function () {
            to_page(1);
        });
        prePageLi.click(function () {
            to_page(result.extendInfo.pageInfo.pageNum - 1);
        });
        nextPageLi.click(function () {
            to_page(result.extendInfo.pageInfo.pageNum + 1);
        });
        lastPageLi.click(function () {
            to_page(result.extendInfo.pageInfo.pages);
        });
        //判断是否有前一页
        if (result.extendInfo.pageInfo.hasPreviousPage !== false) {
            ul.append(firstPageLi).append(prePageLi);
        } else {
            firstPageLi.addClass("disabled");
            ul.append(firstPageLi);
        }
        $.each(result.extendInfo.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            if (result.extendInfo.pageInfo.pageNum === item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //判断是否有下一页
        if (result.extendInfo.pageInfo.hasNextPage !== false) {
            ul.append(nextPageLi).append(lastPageLi);
        } else {
            ul.append(lastPageLi);
            lastPageLi.addClass("disabled");
        }
        nav.append(ul).appendTo("#page_nav_area");
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

    //设置每个评论的满意度
    function setScore(obj, i) {
        layui.use(['rate'], function () {
            var rate = layui.rate;
            //自定义文本
            rate.render({
                elem: obj
                , value: i
                , text: true
                , readonly: true
                , setText: function (value) { //自定义文本的回调
                    var arrs = {
                        '1': '极差'
                        , '2': '差'
                        , '3': '中等'
                        , '4': '好'
                        , '5': '极好'
                    };
                    this.span.text(arrs[value] || (value + "星"));
                }
            });
        });
    }
</script>
</html>
