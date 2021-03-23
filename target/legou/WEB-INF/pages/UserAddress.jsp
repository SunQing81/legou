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
    <title>乐购-收货地址</title>
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
<%-- 地址信息修改模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="update_ads_Info_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">地址信息修改</h4>
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
        <jsp:include page="header.jsp"></jsp:include>
        <div class="i_bg bg_color">
            <!--Begin 用户中心 Begin -->
            <div class="m_content">
                    <%--                个人中心左面导航栏--%>
                <jsp:include page="u_leftnav.jsp"></jsp:include>
                <div class="m_right">
                    <div class="m_des">
                        <div class="container" style="width: 850px">
                            <div class="row">
                                <table class="table table-hover" id="cust_address_table">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" id="check_all"/></th>
                                        <th>收货人</th>
                                        <th>收货电话</th>
                                        <th>收货地址</th>
                                        <th>操作</th>
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
                    <div class="modal-body saveAddressDiv" style="width: 780px;height: 520px">
                        <form class="form-horizontal" id="saveAddressForm">
                            <div class="form-group" style="margin-bottom: 0">
                                <label class="col-sm-2 control-label">收货人姓名</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="glyphicon glyphicon-user"
                                                                             aria-hidden="true"></span></div>
                                        <input type="text" class="form-control" id="save_aName"
                                               onblur="check_save_aName_length()">
                                    </div>
                                    <span id="checkadsNameMsg" class="help-block">请输入2-20个字符</span>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom: 0">
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
                                    <label class="col-sm-2 control-label">所在地区</label>
                                    <div class="col-sm-10">
                                        <div class="demo" id="demo"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="layui-form-item">
                                    <label class="col-sm-2 control-label">详细地址</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" rows="3" placeholder="至少五个字符" id="detailAdsInfo"
                                                  onblur="detailAddressLength()"></textarea>
                                        <span id="checkadsAddressMsg" class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-4 col-sm-offset-9">
                                    <button type="button" class="btn btn-default">清空</button>
                                    <button type="button" class="btn btn-info" onclick="saveAddressByCid()">添加地址
                                    </button>
                                </div>
                            </div>
                        </form>
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
<script type="text/javascript" src="${APP_PATH}/js/laydate.js"></script>
<script src="${APP_PATH}/js/iPicker.min.js"></script>
<%--工具函数--%>
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
            url: "${APP_PATH}/getAllAddressByCid",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                // console.log(result);
                //1.解析并显示地址数据
                build_address_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    //1.解析并显示地址数据
    function build_address_table(result) {
        //清空table tbody
        $("#cust_address_table tbody").empty();
        var custAddress = result.extendInfo.pageInfo.list;
        $.each(custAddress, function (index, item) {
            // alert(item.empName);
            var checkBoxTd = $("<td></td>").append("<input type='checkbox' class='check_item' />");
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
                statusBtn = $("<button></button>").addClass("btn btn-primary btn-sm").attr("disabled", "disabled")
                    .append($("<span></span>").append("默认地址"));
                //为编辑按钮添加一个自定义的属性，来表示当前地址id
                statusBtn.attr("status-id", item.aId);
                delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").attr("disabled", "disabled")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除");
            } else {
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

            var btnTd = $("<td></td>").append(statusBtn).append(" ").append(editBtn).append(" ").append(delBtn);
            //apend()方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                // .append(adsIdTd)
                .append(adsNameTd)
                .append(adsPhoneTd)
                .append(adsInfoTd)
                .append(btnTd)
                .appendTo("#cust_address_table tbody");
        });
    }

    //2.解析并显示分页信息
    function build_page_info(result) {
        //清空分页信息
        $("#page_info_area").empty();
        $("#page_info_area").append($("<button id='ads_delete_all_btn'></button>").addClass("btn btn-danger btn-sm")
            .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除"))
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

    /**
     * 用常规的方式并不能绑定click
     * 解决方案
     *        1.在创建按钮时绑定，但是代码间过于耦合
     *        2.用.live()绑定，但是新版jQuery删除了该方法，使用on代替
     */

    /**
     * 更改
     */
    $(document).on("click", ".edit_btn", function () {
        //获取对应的地址信息显示在表单中
        getAddressByAid($(this).attr("edit-id"));
        console.log($(this).attr("edit-id"));
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
                    to_page(currentPae);
                }
            }
        });
    });

    /**
     *  删除
     */
    //为新生的delete_btn添加事件  .delete_btn"
    $(document).on("click", ".delete_btn", function () {
        //删除对应的地址信息
        deleteAddressByAid($(this).attr("delete-id"));
    });

    //删除对应的地址信息
    function deleteAddressByAid(aid) {
        if (confirm("确认删除吗？")) {
            $.ajax({
                url: "${APP_PATH}/deleteAddressByAid/" + aid,
                type: "DELETE",
                success: function (result) {
                    to_page(currentPae);
                }
            });
        }
    }

    //完成全选、全不选
    $("#check_all").click(function () {
        //attr获取checked是undefined
        //attr 获取自定义属性的值
        //对于dom原生的属性用prop来修改和读取
        // alert($(this).prop("checked"));
        $(".check_item").prop("checked", $(this).prop("checked"));
    });
    //为新生的CheckBox添加事件  .check_item"
    $(document).on("click", ".check_item", function () {
        //判断当前选择的元素是否5个
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });
    //点击全部删除，就批量删除
    $(document).on("click", "#ads_delete_all_btn", function () {
        var del_idstr = "";
        $.each($(".check_item:checked"), function () {
            // alert($(this).parents("tr").find("td:eq(2)").text());
            del_idstr += $(this).parents("tr").find("td:eq(4)").find(".delete_btn").attr("delete-id") + "-";
        });
        //去除del_idstr多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length - 1);
        // console.log(del_idstr);
        if (del_idstr.length > 0) {
            if (confirm("确认删除所选中的内容吗？")) {
                //发送ajax请求删除
                $.ajax({
                    url: "${APP_PATH}/deleteAddressByAid?aids=" + del_idstr,
                    type: "DELETE",
                    success: function (result) {
                        // alert(result.msg);
                        //回到本页
                        $("#check_all").prop("checked", false);
                        to_page(currentPae);
                    }
                });
            }
        }
    });

    /**
     * 新增
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
                to_page(totalRecord);
            }
        });
    }

    /**
     * 设为默认
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
                location.reload();
            }
        });
    }
</script>
<script type="text/javascript">
    var $picker = $(".picker");

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

    // console.log(provinceCode);
    $.getJSON("${APP_PATH}/json/area.json").done(function (res) {
        $("#demo").iPicker({
            data: res,
            defaultValue: ["", "", ""],
            onSelect: function (v, t) {
                var text = "[ " + t + " ]";
                var value = "[ " + v + " ]";
            }
        });
    })
</script>
</html>
