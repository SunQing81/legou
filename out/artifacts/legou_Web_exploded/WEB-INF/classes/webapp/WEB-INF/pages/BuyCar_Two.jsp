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

    <title>乐购-确认订单</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%-- 新增地址信息模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="add_address_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">新增地址信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="saveAddressForm">
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">收货人姓名</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-user"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" id="save_aName"
                                       onblur="check_save_aName_length()">
                            </div>
                            <span id="checkadsNameMsg" class="help-block">支持中文、英文、数字，4-20个字符</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">收货人电话</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-phone"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" id="save_aPhone"
                                       onblur="check_save_aPhone_length()">
                            </div>
                            <span id="checkadsPhoneMsg" class="help-block">请输入11位手机号</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="layui-form-item">
                            <label class="col-sm-2 control-label">请选择地区</label>
                            <div class="col-sm-10">
                                <div class="demo" id="demo"></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="layui-form-item">
                            <label class="col-sm-2 control-label">详细地址</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="3" id="detailAdsInfo"
                                          onblur="detailAddressLength()"></textarea>
                                <span id="checkadsAddressMsg" class="help-block"></span>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="saveAddressByCid()">保存地址</button>
            </div>
        </div>
    </div>
</div>
<%-- 地址信息修改模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="update_ads_Info_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">地址信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">收货人姓名</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-user"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" id="update_aName"
                                       onblur="check_update_aName_length()">
                            </div>
                            <span id="updateadsNameMsg" class="help-block">支持中文、英文、数字，4-20个字符</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">收货人电话</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-phone"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" id="update_aPhone"
                                       onblur="check_update_aPhone_length()">
                            </div>
                            <span id="updateadsPhoneMsg" class="help-block">请输入11位手机号</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="layui-form-item">
                            <label class="col-sm-2 control-label">请选择地区</label>
                            <div class="col-sm-10">
                                <div class="demo" id="demo-1"></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="layui-form-item">
                            <label class="col-sm-2 control-label">详细地址</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="3" id="update_aInfo"
                                          onblur="update_detailAddressLength()"></textarea>
                                <span id="updateadsAddressMsg" class="help-block"></span>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_address_btn">保存修改</button>
            </div>
        </div>
    </div>
</div>
<c:choose>
    <c:when test="${sessionScope.customer != null}">
        <div class="i_bg">
            <div class="content mar_20">
                <img src="${APP_PATH}/images/img2.jpg"/>
            </div>

            <!--Begin 第二步：确认订单信息 Begin -->
            <div class="content mar_20">
                <div class="two_bg">
                    <div class="container">
                        <div class="row">
                            <div class="two_t">
                                <span class="fr"><button type="button" class="btn btn-primary"
                                                         onclick="addAddressBtn()">新增收货地址</button></span>收货人信息
                            </div>
                        </div>
                        <div class="row" id="addressChoiceRow">
                            <table class="table table-hover" style="width:1110px;font-size: 15px;text-align: center">
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <div class="row" style="margin-top: 10px">

                        </div>
                        <div class="row">
                            <div class="two_t">
                                <span class="fr"><a href="${APP_PATH}/forwordPage?url=BuyCar">修改</a></span>商品列表
                            </div>
                        </div>
                        <div class="row" id="confirmGoodsRow">
                            <table class="table table-hover" style="width:1110px;font-size: 15px;">
                                <thead>
                                <tr>
                                    <th class="car_th" width="550">商品</th>
                                    <th class="car_th" width="150">购买数量</th>
                                    <th class="car_th" width="130">小计</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <div class="row" id="confirmOrderRow">
                            <table border="0" style="width:900px; margin-top:20px;" cellspacing="0" cellpadding="0">
                                <tr height="30px">
                                    <td class="fr"></td>
                                </tr>
                                <tr height="70px">
                                    <td align="right">
                                        <b style="font-size:14px;">应付款金额：<span
                                                style="font-size:22px; color:#ff4e00;"></span></b>
                                    </td>
                                </tr>
                                <tr height="70px">
                                    <td align="right"><a id="goAlipayBtn"><img
                                            src="${APP_PATH}/images/btn_sure.gif"/></a></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!--End 第二步：确认订单信息 End-->

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </c:when>
    <c:otherwise>
        <jsp:include page="Login.jsp"></jsp:include>
    </c:otherwise>
</c:choose>
</body>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${APP_PATH}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/js/laydate.js"></script>
<script src="${APP_PATH}/js/iPicker.min.js"></script>
<script type="text/javascript">
    $(function () {
        //获取地址信息
        getAllAddressByCidInOrder();
        //获取确认订单商品信息
        getConfirmOrderGoods();
    });
</script>
<%--生成订单后付款--%>
<script type="text/javascript">
    $("#goAlipayBtn").click(function () {
        var aid = $("#addressChoiceRow").find("tr.success").attr("aid");
        var allGids = $("#confirmGoodsRow").attr("allGids");
        var allGoodsNum = $("#confirmGoodsRow").attr("allGoodsNum");
        var totalMoney = $("#confirmGoodsRow").attr("totalMoney");
        var orderInfo = aid + "_" + allGids + "_" + allGoodsNum + "_" + totalMoney;
        if (allGids.length > 0) {
            $.ajax({
                url: "${APP_PATH}/creatOrder/" + orderInfo,
                type: "POST",
                success: function (result) {
                    // console.log(result);
                    location.href = "${APP_PATH}/goAlipay/" + result.extendInfo.orderInfo.oId;
                }
            });
        } else {
            location.href = "${APP_PATH}/forwordPage?url=BuyCar";
        }

    });
</script>
<%--订单商品展示--%>
<script type="text/javascript">
    //获取订单的商品
    function getConfirmOrderGoods() {
        $.ajax({
            url: "${APP_PATH}/getConfirmOrderGoods",
            type: "GET",
            success: function (result) {
                // console.log(result);
                builder_confirmGoods_show(result);
            }
        });
    }

    //显示订单确认商品
    function builder_confirmGoods_show(result) {
        $("#confirmGoodsRow table tbody").empty();
        var totalMoney = 0;
        var allGids = "";
        var allGoodsNum = "";
        var totalNum = 0;
        $("#confirmGoodsRow").css("height", "auto");
        var buyCar = result.extendInfo.confrimOrderGoods;
        $.each(buyCar, function (index, item) {
            var price = item.goods.gPrice.toFixed(2);
            var totalPrice = (price * item.bNum).toFixed(2);

            totalMoney += parseFloat(totalPrice);
            allGids = allGids + item.gId + "-";
            allGoodsNum = allGoodsNum + item.bNum + "-";
            totalNum += parseInt(item.bNum);


            var gDetailinfoTd = $("<td></td>").append($("<div style='float: left'></div>")
                .append($("<img style='width: 80px'>").prop("src", "${APP_PATH}/" + item.goods.gImage)))
                .append($("<div style='float: left;width: 350px;margin-left: 10px;font-size: 13px'></div>")
                    .append(item.goods.gDetailinfo));
            var shoppingNum = $("<td></td>").append(item.bNum);
            var totalmoneyTd = $("<td style='font-weight: 700'></td>").append(totalPrice);
            $("<tr></tr>").append(gDetailinfoTd)
                .append(shoppingNum)
                .append(totalmoneyTd)
                .appendTo("#confirmGoodsRow table tbody");
        });
        $("#confirmGoodsRow").attr("totalMoney", totalMoney.toFixed(2))
            .attr("allGids", allGids.substring(0, allGids.length - 1))
            .attr("allGoodsNum", allGoodsNum.substring(0, allGoodsNum.length - 1));
        $("#confirmOrderRow").find("tr:first").children("td").text("共 " + totalNum + " 件商品");
        $("#confirmOrderRow").find("tr:first").next().children("td").find("span").text("￥ " + totalMoney.toFixed(2));
    }
</script>
<%--地址展示以及功能--%>
<script type="text/javascript">
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

    //获取地址信息根据用户ID
    function getAllAddressByCidInOrder() {
        $.ajax({
            url: "${APP_PATH}/getAllAddressByCidInOrder",
            type: "GET",
            success: function (result) {
                console.log(result);
                //1.解析并显示地址数据
                build_address_table_inOrderPage(result, 0);
            }
        });
    }

    //构建订单页地址信息显示
    function build_address_table_inOrderPage(result) {
        //清空table tbody
        $("#addressChoiceRow table tbody").empty();
        $("#addressChoiceRow").next().empty();
        $("#addressChoiceRow").css("height", "50px").css("overflow", "").attr("addressNum", result.extendInfo.addressListInfo.length);
        $("#addressChoiceRow").next().append($("<a style='margin-left: 30px;' id='addressOpen'></a>").append("更多地址 ")
            .append($("<span></span>").addClass("glyphicon glyphicon-chevron-down")));
        var custAddress = result.extendInfo.addressListInfo;
        if (custAddress !== undefined) {
            if (custAddress.length > 0) {
                $.each(custAddress, function (index, item) {
                    // console.log(index);
                    var tr = $("<tr></tr>").attr("aid", item.aId);
                    var checkBoxTd = $("<td></td>").append($("<button type='button'></button>")
                        .addClass("btn btn-success btn-sm deliver").text("送至"));
                    var adsNameTd = $("<td></td>").append(item.aName);
                    var adsPhoneTd = $("<td></td>").append(item.aPhone);
                    var adsInfoTd = "";
                    var statusBtn;
                    var delBtn;
                    var reg_city = /(市辖区)/g;
                    var provice = item.aProvince.split("-");
                    var city = item.aCity.split("-");
                    var district = item.aDistrict.split("-");
                    if (reg_city.test(item.aCity)) {
                        adsInfoTd = $("<td></td>").append(provice[0]).append(district[0]).append(item.aInfo);
                    } else {
                        adsInfoTd = $("<td></td>").append(provice[0]).append(city[0]).append(district[0]).append(item.aInfo);
                    }
                    if (item.aStatus === 1) {
                        tr.addClass("success");
                        statusBtn = $("<button></button>").addClass("btn btn-primary btn-sm").attr("disabled", "disabled")
                            .append($("<span></span>").append("默认地址"));
                        //为编辑按钮添加一个自定义的属性，来表示当前地址id
                        statusBtn.attr("status-id", item.aId);
                        delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").attr("disabled", "disabled")
                            .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除");
                        //为删除按钮添加一个自定义的属性，来表示当前员工id
                        delBtn.attr("delete-id", item.aId);
                    } else {
                        // tr.style.display="none";
                        tr.css("display", "none");
                        statusBtn = $("<button></button>").addClass("btn btn-primary btn-sm status_btn")
                            .append($("<span></span>").append("设为默认"));
                        //为编辑按钮添加一个自定义的属性，来表示当前地址id
                        statusBtn.attr("status-id", item.aId);
                        delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                            .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除");
                        //为删除按钮添加一个自定义的属性，来表示当前员工id
                        delBtn.attr("delete-id", item.aId);
                    }
                    var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                        .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" 编辑");
                    //为编辑按钮添加一个自定义的属性，来表示当前地址id
                    editBtn.attr("edit-id", item.aId);
                    var btnTd = $("<td style='text-align: right'></td>").append(statusBtn).append(" ").append(editBtn).append(" ").append(delBtn);
                    tr.append(checkBoxTd)
                        .append(adsNameTd)
                        .append(adsPhoneTd)
                        .append(adsInfoTd)
                        .append(btnTd)
                        .appendTo("#addressChoiceRow table tbody");
                });
            } else {
                $("<tr></tr>").append($("<td style='text-align: center'></td>").text("还没有地址呢？请添加"))
                    .appendTo("#addressChoiceRow table tbody");
                ;
            }
        } else {
            // location.reload();
            $("<tr></tr>").append($("<td style='text-align: center'></td>").text("还没有地址呢？请添加"))
                .appendTo("#addressChoiceRow table tbody");
            ;
        }
    }

    //展开剩余的地址
    $(document).on("click", "#addressOpen", function () {
        $("#addressChoiceRow").next().empty();
        // console.log($("#addressChoiceRow").find("tr").length);
        var trNum = $("#addressChoiceRow").find("tr");
        trNum.css("display", "");
        if (parseInt($("#addressChoiceRow").attr("addressNum")) > 3) {
            $("#addressChoiceRow").css("height", "184px").css("overflow", "scroll").css("overflow-x", "hidden");
        } else {
            $("#addressChoiceRow").css("height", "auto").css("overflow", "");
        }
        $("#addressChoiceRow").next().append($("<a style='margin-left: 30px;' id='addressClose'></a>").append("收起地址 ")
            .append($("<span></span>").addClass("glyphicon glyphicon-chevron-up")));
    });
    //收起地址
    $(document).on("click", "#addressClose", function () {
        $("#addressChoiceRow").next().empty();
        //获取除class= success以外的其他tr元素
        $('#addressChoiceRow').find("tr:not(.success)").css('display', 'none');
        $("#addressChoiceRow").css("height", "50px").css("overflow", "");
        $("#addressChoiceRow").next().append($("<a style='margin-left: 30px;' id='addressOpen'></a>").append("更多地址 ")
            .append($("<span></span>").addClass("glyphicon glyphicon-chevron-down")));
    });
    //选定地址当做收货地址
    $(document).on("click", ".deliver", function () {
        $('#addressChoiceRow').find("tr").removeClass("success").css('display', 'none');
        $(this).parents("tr").addClass("success").css('display', '');
        $("#addressChoiceRow").next().empty();
        //获取除class= success以外的其他tr元素
        // $('#addressChoiceRow').find("tr:not(.success)").css('display','none');
        // $("#addressChoiceRow").css("height","46px");
        $("#addressChoiceRow").css("height", "50px").css("overflow", "");
        $("#addressChoiceRow").next().append($("<a style='margin-left: 30px;' id='addressOpen'></a>").append("更多地址 ")
            .append($("<span></span>").addClass("glyphicon glyphicon-chevron-down")));
    });

    //打开新增地址模态框
    function addAddressBtn() {
        $("#add_address_Modal").modal({
            backdrop: "static"
        });
    }

    //新增地址时显示省市区三级联动插件
    $.getJSON("${APP_PATH}/json/area.json").done(function (res) {
        $("#demo").iPicker({
            data: res,
            defaultValue: ["", "", ""],
            onSelect: function (v, t) {
                var text = "[ " + t + " ]";
                var value = "[ " + v + " ]";
            }
        });
    });

    /**
     *  地址删除
     */
    //为新生的delete_btn添加事件  .delete_btn"
    $(document).on("click", ".delete_btn", function () {
        //删除对应的地址信息
        deleteAddress($(this).attr("delete-id"));
    });

    //删除对应的地址信息
    function deleteAddress(aid) {
        if (confirm("确认删除吗？")) {
            $.ajax({
                url: "${APP_PATH}/deleteAddressByAid/" + aid,
                type: "DELETE",
                success: function (result) {
                    getAllAddressByCidInOrder();
                }
            });
        }
    }

    /**
     * 新增地址
     */
    //检查收货人姓名的长度
    function check_save_aName_length() {
        var save_aName = $("#save_aName").val();
        var reg = /-/g;
        if (save_aName.length !== 0) {
            if (reg.test(save_aName)) {
                show_validate_msg("#checkadsNameMsg", "error", "不能含有'-'");
                return false;
            } else {
                if (save_aName.length > 20 || save_aName.length < 2) {
                    show_validate_msg("#checkadsNameMsg", "error", "请输入2-20个字符");
                    return false;
                } else {
                    show_validate_msg("#checkadsNameMsg", "success", "姓名可用");
                }
            }
        } else {
            show_validate_msg("#checkadsNameMsg", "", "请输入2-20个字符");
            return false;
        }
    }

    //检查收货人手机的长度及格式
    function check_save_aPhone_length() {
        var save_aPhone = $("#save_aPhone").val();
        var reg_phone = /^[0-9]+$/;
        if (save_aPhone.length !== 0) {
            if (!reg_phone.test(save_aPhone)) {
                show_validate_msg("#checkadsPhoneMsg", "error", "格式有误，请检查");
                return false;
            } else {
                if (save_aPhone.length !== 11) {
                    show_validate_msg("#checkadsPhoneMsg", "error", "请输入11位手机号");
                    return false;
                } else {
                    show_validate_msg("#checkadsPhoneMsg", "success", "手机号可用");
                }
            }
        } else {
            show_validate_msg("#checkadsPhoneMsg", "", "请输入11位手机号");
            return false;
        }
    }

    //检查详细地址内容的长度
    function detailAddressLength() {
        var detailAdsInfo = $("#detailAdsInfo").val();
        var reg = /-/g;
        if (detailAdsInfo.length !== 0) {
            if (reg.test(detailAdsInfo)) {
                show_validate_msg("#checkadsAddressMsg", "error", "不能含有'-'");
                return false;
            } else {
                if (detailAdsInfo.length > 4 && detailAdsInfo.length <= 200) {
                    show_validate_msg("#checkadsAddressMsg", "", "");
                } else {
                    show_validate_msg("#checkadsAddressMsg", "error", "请输入5-200个字符");
                    return false;
                }
            }
        } else {
            show_validate_msg("#checkadsAddressMsg", "", "");
            return false;
        }
    }

    //检查地址新增表单是否有空
    function saveAddressFormIsEmpty() {
        if ($("#save_aName").val().length === 0) {
            show_validate_msg("#checkadsNameMsg", "error", "收货人姓名为空");
            return false;
        } else if ($("#save_aPhone").val().length === 0) {
            show_validate_msg("#checkadsPhoneMsg", "error", "收货人手机号为空");
            return false;
        } else if ($("#demo").children(":first").find("span").text() === "省"
            || $("#demo").children(":first").next().find("span").text() === "市"
            || $("#demo").children(":last").find("span").text() === "区"
            || $("#detailAdsInfo").val().length === 0
        ) {
            show_validate_msg("#checkadsAddressMsg", "error", "地址信息不完整，请检查");
            return false;
        }
        return true;
    }

    //提交表单数据
    function saveAddressByCid() {
        if (!saveAddressFormIsEmpty()) {
            return false;
        }
        var adsData = "";
        var save_aName = $("#save_aName").val();
        var save_aPhone = $("#save_aPhone").val();
        //省名及省邮编
        var provinceName = $("#demo").children(":first").find("span").text();
        var provinceCode = $("#demo").children(":first").find(".iPicker-list-active").attr("data-code");
        var province = provinceName + "-" + provinceCode;
        //市名及市邮编
        var cityName = $("#demo").children(":first").next().find("span").text();
        var cityCode = $("#demo").children(":first").next().find(".iPicker-list-active").attr("data-code");
        var city = cityName + "-" + cityCode;
        //区名及区邮编
        var districtName = $("#demo").children(":last").find("span").text();
        var districtCode = $("#demo").children(":last").find(".iPicker-list-active").attr("data-code");
        var district = districtName + "-" + districtCode;

        var address = province + "-" + city + "-" + district + "-" + $("#detailAdsInfo").val();

        // console.log(address);
        adsData = save_aName + "-" + save_aPhone + "-" + address;
        var addressInfo = window.encodeURIComponent(adsData);

        // console.log(addressInfo);
        $.ajax({
            url: "${APP_PATH}/saveAddressByCid?adsData=" + addressInfo,
            method: "GET",
            success: function (result) {
                // 局部刷新DIV
                // $(".saveAddressDiv").load(location.href+" .saveAddressDiv");
                $("#add_address_Modal").modal("hide");
                $("#saveAddressForm")[0].reset();
                show_validate_msg("#checkadsNameMsg", "", "请输入2-20个字符");
                show_validate_msg("#checkadsPhoneMsg", "", "请输入11位手机号");
                show_validate_msg("#checkadsAddressMsg", "", "");
                $("#demo").children(":first").find("span").text("省");
                $("#demo").children(":first").children(":first").addClass("iPicker-placeholder");
                $("#demo").children(":first").children(":last").find(".iPicker-list-active").removeClass("iPicker-list-active");
                $("#demo").children(":first").next().find("span").text("市");
                $("#demo").children(":first").next().children(":first").addClass("iPicker-placeholder");
                $("#demo").children(":first").next().children(":last").find(".iPicker-list-active").removeClass("iPicker-list-active");
                $("#demo").children(":last").find("span").text("区");
                $("#demo").children(":last").children(":first").addClass("iPicker-placeholder");
                $("#demo").children(":last").children(":last").find(".iPicker-list-active").removeClass("iPicker-list-active");
                getAllAddressByCidInOrder();
            }
        });
    }

    /**
     * 地址设为默认
     */
    $(document).on("click", ".status_btn", function () {
        setDefaultAdsWithCid($(this).attr("status-id"));
    });

    //将某一地址设为默认
    function setDefaultAdsWithCid(aid) {
        $.ajax({
            url: "${APP_PATH}/setDefaultAdsWithCid?aid=" + aid,
            method: "GET",
            success: function (result) {
                // location.reload();
                getAllAddressByCidInOrder();
            }
        });
    }

    /**
     * 更改地址
     */
    $(document).on("click", ".edit_btn", function () {
        //获取对应的地址信息显示在表单中
        getAddressByAid($(this).attr("edit-id"));
        // console.log($(this).attr("edit-id"));
        // location.reload();
        $("#update_ads_Info_Modal").modal({
            backdrop: "static"
        });
        $("#update_address_btn").attr("update-aid", $(this).attr("edit-id"));
    });

    //通过地址id获取地址信息并显示在表单中显示在表单中
    function getAddressByAid(aid) {
        $.ajax({
            url: "${APP_PATH}/getAddressByAid?aid=" + aid,
            type: "GET",
            success: function (result) {
                var addressInfo = result.extendInfo.updateAddressInfo;
                $("#update_aName").prop("value", addressInfo.aName);
                $("#update_aPhone").prop("value", addressInfo.aPhone);
                var provinceCode = addressInfo.aProvince.split("-");
                var cityCode = addressInfo.aCity.split("-");
                var districtCode = addressInfo.aDistrict.split("-");
                if (provinceCode && cityCode && districtCode) {
                    getLocationCode(provinceCode[1], cityCode[1], districtCode[1]);
                }
                $("#update_aInfo").val(addressInfo.aInfo);
            },
        });
    }

    //判断更新地址模态框信息是否完整
    //检查收货人姓名的长度
    function check_update_aName_length() {
        var update_aName = $("#update_aName").val();
        var reg = /-/g;
        if (update_aName.length !== 0) {
            if (reg.test(update_aName)) {
                show_validate_msg("#updateadsNameMsg", "error", "不能含有'-'");
                return false;
            } else {
                if (update_aName.length > 20 || update_aName.length < 2) {
                    show_validate_msg("#updateadsNameMsg", "error", "请输入2-20个字符");
                    return false;
                } else {
                    show_validate_msg("#updateadsNameMsg", "success", "姓名可用");
                }
            }
        } else {
            show_validate_msg("#updateadsNameMsg", "", "请输入2-20个字符");
            return false;
        }
    }

    //检查收货人手机的长度及格式
    function check_update_aPhone_length() {
        var update_aPhone = $("#update_aPhone").val();
        var reg_phone = /^[0-9]+$/;
        if (update_aPhone.length !== 0) {
            if (!reg_phone.test(update_aPhone)) {
                show_validate_msg("#updateadsPhoneMsg", "error", "格式有误，请检查");
                return false;
            } else {
                if (update_aPhone.length !== 11) {
                    show_validate_msg("#updateadsPhoneMsg", "error", "请输入11位手机号");
                    return false;
                } else {
                    show_validate_msg("#updateadsPhoneMsg", "success", "手机号可用");
                }
            }
        } else {
            show_validate_msg("#updateadsPhoneMsg", "", "请输入11位手机号");
            return false;
        }
    }

    //检查详细地址内容的长度
    function update_detailAddressLength() {
        var update_aInfo = $("#update_aInfo").val();
        var reg = /-/g;
        if (update_aInfo.length !== 0) {
            if (reg.test(update_aInfo)) {
                show_validate_msg("#updateadsAddressMsg", "error", "不能含有'-'");
                return false;
            } else {
                if (update_aInfo.length > 4 && update_aInfo.length <= 200) {
                    show_validate_msg("#updateadsAddressMsg", "", "");
                } else {
                    show_validate_msg("#updateadsAddressMsg", "error", "请输入5-200个字符");
                    return false;
                }
            }
        } else {
            show_validate_msg("#updateadsAddressMsg", "", "");
            return false;
        }
    }

    //检查地址新增表单是否有空
    function updateAddressFormIsEmpty() {
        if ($("#update_aName").val().length === 0) {
            show_validate_msg("#updateadsNameMsg", "error", "收货人姓名为空");
            return false;
        } else if ($("#update_aPhone").val().length === 0) {
            show_validate_msg("#updateadsPhoneMsg", "error", "收货人手机号为空");
            return false;
        } else if ($("#demo-1").children(":first").find("span").text() === "省"
            || $("#demo-1").children(":first").next().find("span").text() === "市"
            || $("#demo-1").children(":last").find("span").text() === "区"
            || $("#update_aInfo").val().length === 0
        ) {
            show_validate_msg("#updateadsAddressMsg", "error", "地址信息不完整，请检查");
            return false;
        }
        return true;
    }

    //点击保存修改，地址更新，关闭模态框，到当前页
    $("#update_address_btn").click(function () {
        if (!updateAddressFormIsEmpty()) {
            return false;
        }
        var adsData = "";
        var aid = $("#update_address_btn").attr("update-aid");
        var update_aName = $("#update_aName").val();
        var update_aPhone = $("#update_aPhone").val();
        //省名及省邮编
        var provinceName = $("#demo-1").children(":first").find("span").text();
        var provinceCode = $("#demo-1").children(":first").find(".iPicker-list-active").attr("data-code");
        var province = provinceName + "-" + provinceCode;
        //市名及市邮编
        var cityName = $("#demo-1").children(":first").next().find("span").text();
        var cityCode = $("#demo-1").children(":first").next().find(".iPicker-list-active").attr("data-code");
        var city = cityName + "-" + cityCode;
        //区名及区邮编
        var districtName = $("#demo-1").children(":last").find("span").text();
        var districtCode = $("#demo-1").children(":last").find(".iPicker-list-active").attr("data-code");
        var district = districtName + "-" + districtCode;

        var address = province + "-" + city + "-" + district + "-" + $("#update_aInfo").val();

        // console.log(address);
        adsData = aid + "-" + update_aName + "-" + update_aPhone + "-" + address;
        var addressInfo = window.encodeURIComponent(adsData);
        $.ajax({
            url: "${APP_PATH}/updateAddressByCid?adsData=" + addressInfo,
            method: "GET",
            success: function (result) {
                if (result.extendInfo.checkAdsInfo !== undefined) {
                    show_validate_msg("#updateadsAddressMsg", "error", result.extendInfo.checkAdsInfo);
                } else {
                    $("#update_ads_Info_Modal").modal("hide");
                    // to_page(currentPae);
                    getAllAddressByCidInOrder();
                }
            }
        });
    });

    //显示特定的城市信息
    function getLocationCode(provinceCode, cityCode, districtCode) {
        $.getJSON("${APP_PATH}/json/area.json").done(function (res) {
            $("#demo-1").iPicker({
                data: res,
                defaultValue: [provinceCode, cityCode, districtCode],
                onSelect: function (v, t) {
                    var text = "[ " + t + " ]";
                    var value = "[ " + v + " ]";
                }
            });
        });
    }
</script>
</html>
