<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>乐购-后台</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="${APP_PATH }/layui/css/layui.css" media="all">
    <script src="${APP_PATH }/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
</head>
<body style="overflow-x: hidden">
<div class="container" style="width: 1585px;">
    <jsp:include page="endLeftNavAndHeader.jsp"></jsp:include>
    <div class="col-md-offset-2 col-md-9" style="margin-top: 60px;">
        <div class="panel panel-default">
            <div class="panel-body" style="height: auto;min-height: 680px;">
                <div class="container col-md-12">
                    <div class="row">
                        <div class="col-md-2">
                            <h3>订单管理</h3>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 30px;margin-left: 30px;">
                        <form class="form-inline" id="tiaojianSelectForm">
                            <div class="form-group">
                                <input type="text" class="form-control" name="oId" placeholder="按订单ID查询">&nbsp;&nbsp;
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="alipayId" placeholder="按支付宝交易ID查询">&nbsp;&nbsp;
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="payStatus">
                                    <option hidden value="">订单状态</option>
                                    <option value="0">未付款</option>
                                    <option value="1">已付款</option>
                                    <option value="2">发货中</option>
                                    <option value="3">已完成</option>
                                </select>
                            </div>
                            <button type="button" class="btn btn-default" onclick="selectorderBytiaojian(1)">条件查询
                            </button>
                        </form>
                    </div>
                    <div class="row" style="margin-top: 30px;">
                        <table class="table table-hover" id="order_table">
                            <thead>
                            <tr>
                                <td>订单ID</td>
                                <td>订单金额</td>
                                <td>下单时间</td>
                                <td>支付宝交易订单号</td>
                                <td>订单状态</td>
                                <td>操作</td>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <%--            分页文字信息--%>
                        <div class="col-md-6" id="page_info_area"></div>
                        <%--            分页条信息--%>
                        <div class="col-md-5 col-sm-offset-1" id="page_nav_area"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${APP_PATH}/js/laydate.js"></script>
<script src="${APP_PATH}/layui/layui.js"></script>
<%--工具函数--%>
<script type="text/javascript">
    //日期插件
    function dateSelect(obj) {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: obj});//绑定元素
    }

    //显示验证表单数据返回的信息
    function show_validate_msg(obj, checkStatus, validateMsg) {
        if (checkStatus === "success") {
            if ($(obj).parent("div").hasClass("has-error")) {
                $(obj).parent("div").removeClass("has-error");
            }
            $(obj).parent("div").addClass("has-success");
        } else if (checkStatus === "error") {
            if ($(obj).parent("div").hasClass("has-success")) {
                $(obj).parent("div").removeClass("has-success");
            }
            $(obj).parent("div").addClass("has-error");
        } else {
            $(obj).parent("div").removeClass("has-success").removeClass("has-error");
        }
        $(obj).text(validateMsg);
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
        if (timestamp == null || timestamp == "") {
            return "";
        } else {
            return Y + M + D;
        }
    }
</script>
<script type="text/javascript">
    //保存总记录数，目的是添加地址后，跳到最后一页，因为此数一般大于总页数，数值不合理，就自动去最后一页
    var totalRecord;
    //保存当前页面，更新地址数据后，返回该页
    var currentPae;
    // 1.页面加载完成以后，直接去发送一个ajax请求，要到分页数据
    $(function () {
        to_page(1);
    });

    /**
     * 查询
     */
    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/getAllorder",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result);
                //1.解析并显示地址数据
                build_order_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    //1.解析并显示订单数据
    function build_order_table(result) {
        //清空table tbody
        $("#order_table tbody").empty();
        var orderList = result.extendInfo.pageInfo.list;
        if (result.extendInfo.pageInfo.total > 0) {
            $.each(orderList, function (index, item) {
                var oIdTd = $("<td></td>").append(item.oId);
                var totalMoneyTd;
                var alipayIdTd;
                if (item.totalMoney === 0) {
                    totalMoneyTd = $("<td></td>").append("积分订单");
                    alipayIdTd = $("<td></td>").append("无");
                } else {
                    totalMoneyTd = $("<td></td>").append(item.totalMoney.toFixed(2));
                    alipayIdTd = $("<td></td>").append(item.alipayId);
                }

                var createtimeTd = $("<td></td>").append(timestampToTime(item.createtime));
                var payStatusTd;
                if (item.payStatus === 0) {
                    payStatusTd = $("<td></td>").append("未付款");
                } else if (item.payStatus === 1) {
                    payStatusTd = $("<td></td>").append("待揽收");
                } else if (item.payStatus === 2) {
                    payStatusTd = $("<td></td>").append("发货中");
                } else if (item.payStatus === 3) {
                    payStatusTd = $("<td></td>").append("已完成");
                }
                var editBtn;
                if (item.payStatus !== 1) {
                    editBtn = $("<button disabled></button>").addClass("btn btn-primary btn-sm edit_btn")
                        .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" 发货状态");
                } else {
                    editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                        .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" 发货状态");
                }
                //为编辑按钮添加一个自定义的属性，来表示当前订单id
                editBtn.attr("edit-id", item.oId);
                var btnTd = $("<td></td>").append(editBtn);
                //apend()方法执行完成以后还是返回原来的元素
                $("<tr></tr>").append(oIdTd)
                    .append(totalMoneyTd)
                    .append(createtimeTd)
                    .append(alipayIdTd)
                    .append(payStatusTd)
                    .append(btnTd)
                    .appendTo("#order_table tbody");
            });
        } else {
            $("<tr></tr>").append($("<td colspan='6'></td>").append("未查询到订单数据"))
                .appendTo("#order_table tbody");
        }
    }

    //2.解析并显示分页信息
    function build_page_info(result) {
        //清空分页信息
        $("#page_info_area").empty();
        $("#page_info_area").append("当前" + result.extendInfo.pageInfo.pageNum + "页，" +
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
        if (result.extendInfo.pageInfo.hasPreviousPage != false) {
            ul.append(firstPageLi).append(prePageLi);
        } else {
            firstPageLi.addClass("disabled");
            ul.append(firstPageLi);
        }
        $.each(result.extendInfo.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            if (result.extendInfo.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //判断是否有下一页
        if (result.extendInfo.pageInfo.hasNextPage != false) {
            ul.append(nextPageLi).append(lastPageLi);
        } else {
            ul.append(lastPageLi);
            lastPageLi.addClass("disabled");
        }
        nav.append(ul).appendTo("#page_nav_area");
    }

    //条件查询的分页条
    function build_page_nav_condition(result) {
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
            selectorderBytiaojian(1);
        });
        prePageLi.click(function () {
            selectorderBytiaojian(result.extendInfo.pageInfo.pageNum - 1);
        });
        nextPageLi.click(function () {
            selectorderBytiaojian(result.extendInfo.pageInfo.pageNum + 1);
        });
        lastPageLi.click(function () {
            selectorderBytiaojian(result.extendInfo.pageInfo.pages);
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
                selectorderBytiaojian(item);
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

    /**
     * 条件查询订单
     */
    //获取条件查询的数据
    function selectorderBytiaojian(pn) {
        $.ajax({
            url: "${APP_PATH}/selectOrderBytiaojian",
            type: "GET",
            data: $("#tiaojianSelectForm").serialize() + "&pn=" + pn,
            success: function (result) {
                console.log(result);
                //1.解析并显示地址数据
                build_order_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析并显示分页条
                build_page_nav_condition(result);
            }
        });
    }

    /**
     * 更改 设置发货状态
     */
    $(document).on("click", ".edit_btn", function () {
        $.ajax({
            url: "${APP_PATH}/updateOrderDeliverStatus/" + $(this).attr("edit-id"),
            type: "PUT",
            success: function (result) {
                to_page(currentPae);
            }
        });
    });


</script>
</html>
