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
    <script src="${APP_PATH }/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
</head>
<body style="overflow-x: hidden">
<%-- 用户信息新增模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="create_customer_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">用户新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="create_customer_form">
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-user"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" id="create_cName" name="cName"
                                       onblur="check_create_cName()">
                            </div>
                            <span id="check_create_cNameMsg" class="help-block">支持中文、英文、数字，4-20个字符</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <label class="radio-inline">
                                    <input type="radio" name="cGender" id="create_male" value="1" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="cGender" id="create_female" value="0"> 女
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">出生日期</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <input class="laydate-icon form-control" id="create_cBirthday" name="cBirthday" value=""
                                       onclick="dateSelect('#create_cBirthday')"/>
                                <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                     aria-hidden="true"></span></div>
                            </div>
                            <span id="check_create_cBirthdayMsg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon">@</div>
                                <input type="text" id="create_cEmail" class="form-control" name="cEmail"
                                       onblur="check_create_cEmail()">
                            </div>
                            <span id="check_create_cEmailMsg" class="help-block">请输入正确的邮箱</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-phone"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" id="create_cPhone" name="cPhone"
                                       onblur="check_create_cPhone()">
                            </div>
                            <span id="check_create_cPhoneMsg" class="help-block">请输入11位手机号</span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="createCustomer_Btn">新增</button>
            </div>
        </div>
    </div>
</div>
<%-- 用户信息修改模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="update_customer_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">用户信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_customer_form">
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">用户ID</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <p id="cId"></p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-user"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" id="update_cName" name="cName"
                                       onblur="check_update_cName()">
                            </div>
                            <span id="check_cNameMsg" class="help-block">支持中文、英文、数字，4-20个字符</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <label class="radio-inline">
                                    <input type="radio" name="cGender" id="male" value="1"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="cGender" id="female" value="0"> 女
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">出生日期</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <input class="laydate-icon form-control" id="demo_cBirthday" name="cBirthday" value=""
                                       onclick="dateSelect('#demo_cBirthday')"/>
                                <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                     aria-hidden="true"></span></div>
                            </div>
                            <span id="check_cBirthdayMsg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon">@</div>
                                <input type="text" id="update_cEmail" class="form-control" name="cEmail"
                                       onblur="check_update_cEmail()">
                            </div>
                            <span id="check_cEmailMsg" class="help-block">请输入正确的邮箱</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-phone"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" id="update_cPhone" name="cPhone"
                                       onblur="check_update_cPhone()">
                            </div>
                            <span id="check_cPhoneMsg" class="help-block">请输入11位手机号</span>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_customer_btn">保存修改</button>
            </div>
        </div>
    </div>
</div>
<div class="container" style="width: 1585px;">
    <jsp:include page="endLeftNavAndHeader.jsp"></jsp:include>
    <div class="col-md-offset-2 col-md-9" style="margin-top: 60px;">
        <div class="panel panel-default">
            <div class="panel-body" style="height: auto;min-height: 680px;">
                <div class="container col-md-12">
                    <div class="row">
                        <div class="col-md-2">
                            <h3>用户管理</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-md-offset-10">
                            <button type="button" id="createCustomerBtn" class="btn btn-primary" style="width: 110px">
                                新增
                            </button>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 30px;margin-left: 30px;">
                        <form class="form-inline" id="tiaojianSelectForm">
                            <div class="form-group">
                                <input type="text" class="form-control" name="cId" placeholder="按用户ID查询">&nbsp;&nbsp;
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="cName" placeholder="按姓名查询(模糊查询)">&nbsp;&nbsp;
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="cGender">
                                    <option hidden value="">性别</option>
                                    <optgroup label="性别"></optgroup>
                                    <option value="1">男</option>
                                    <option value="0">女</option>
                                </select>
                            </div>
                            <div class="form-group">
                                &nbsp;&nbsp;<input type="text" class="form-control" name="cPhone"
                                                   placeholder="按手机号查询(模糊查询)">&nbsp;&nbsp;
                            </div>
                            <button type="button" class="btn btn-default" onclick="selectCustomerBytiaojian(1)">条件查询
                            </button>
                        </form>
                    </div>
                    <div class="row" style="margin-top: 30px;">
                        <table class="table table-hover" id="employee_table">
                            <thead>
                            <tr>
                                <td><input type="checkbox" id="check_all">全选</td>
                                <td>用户ID</td>
                                <td>用户名</td>
                                <td>性别</td>
                                <td>出生日期</td>
                                <td>邮箱</td>
                                <td>手机号</td>
                                <td>积分</td>
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
        if (timestamp == null) {
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
            url: "${APP_PATH}/getAllCustomer",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result);
                //1.解析并显示地址数据
                build_customer_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    //1.解析并显示地址数据
    function build_customer_table(result) {
        //清空table tbody
        $("#employee_table tbody").empty();
        var customerList = result.extendInfo.pageInfo.list;
        if (result.extendInfo.pageInfo.total > 0) {
            $.each(customerList, function (index, item) {
                // alert(item.empName);
                var checkBoxTd = $("<td></td>").append("<input type='checkbox' class='check_item' />");
                var cIdTd = $("<td></td>").append(item.cId);
                var cNameTd = $("<td></td>").append(item.cName);
                var cGenderTd = $("<td></td>").append(item.cGender === 1 ? '男' : '女');
                var cBirthdayTd = $("<td></td>").append(timestampToTime(item.cBirthday) === '' ? '未设置' : timestampToTime(item.cBirthday));
                var cEmailTd = $("<td></td>").append(item.cEmail);
                var cPhoneTd = $("<td></td>").append(item.cPhone);
                var jifenTd = $("<td></td>").append(item.jifen);
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除");
                //为删除按钮添加一个自定义的属性，来表示当前员工id
                delBtn.attr("delete-id", item.cId);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" 编辑");
                //为编辑按钮添加一个自定义的属性，来表示当前地址id
                editBtn.attr("edit-id", item.cId);

                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                //apend()方法执行完成以后还是返回原来的元素
                $("<tr></tr>").append(checkBoxTd)
                    .append(cIdTd)
                    .append(cNameTd)
                    .append(cGenderTd)
                    .append(cBirthdayTd)
                    .append(cEmailTd)
                    .append(cPhoneTd)
                    .append(jifenTd)
                    .append(btnTd)
                    .appendTo("#employee_table tbody");
            });
        } else {
            $("<tr></tr>").append($("<td colspan='8'></td>").append("未查询到用户数据"))
                .appendTo("#employee_table tbody");
        }

    }

    //2.解析并显示分页信息
    function build_page_info(result) {
        //清空分页信息
        $("#page_info_area").empty();
        $("#page_info_area").append($("<button id='delete_checkedCustomer_btn'></button>").addClass("btn btn-danger btn-sm")
            .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除"))
            .append("<br>").append("<br>")
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
            selectCustomerBytiaojian(1);
        });
        prePageLi.click(function () {
            selectCustomerBytiaojian(result.extendInfo.pageInfo.pageNum - 1);
        });
        nextPageLi.click(function () {
            selectCustomerBytiaojian(result.extendInfo.pageInfo.pageNum + 1);
        });
        lastPageLi.click(function () {
            selectCustomerBytiaojian(result.extendInfo.pageInfo.pages);
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
                selectCustomerBytiaojian(item);
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
     * 条件查询员工
     */
    function selectCustomerBytiaojian(pn) {
        $.ajax({
            url: "${APP_PATH}/selectCustomerBytiaojian",
            type: "GET",
            data: $("#tiaojianSelectForm").serialize() + "&pn=" + pn,
            success: function (result) {
                console.log(result);
                //1.解析并显示地址数据
                build_customer_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析并显示分页条
                build_page_nav_condition(result);
            }
        });
    }

    /**
     * 更改
     */
    $(document).on("click", ".edit_btn", function () {
        $("#cId").text("");
        getCustomerByCid($(this).attr("edit-id"));
        // console.log($(this).attr("edit-id"));
        // location.reload();
        $("#update_customer_Modal").modal({
            backdrop: "static"
        });
        $("#update_customer_btn").attr("update-aid", $(this).attr("edit-id"));
    });

    //通过用户id获取用户信息并显示在表单中
    function getCustomerByCid(cId) {
        $.ajax({
            url: "${APP_PATH}/getCustomerByCid?cId=" + cId,
            type: "GET",
            success: function (result) {
                console.log(result);
                var customer = result.extendInfo.customer;
                $("#cId").append(customer.cId).attr("cId", customer.cId);
                $("#update_cName").prop("value", customer.cName).attr("cName", customer.cName);
                if (customer.cGender === 1) {
                    $("#male").prop("checked", true);
                } else {
                    $("#female").prop("checked", true);
                }
                $("#demo_cBirthday").prop("value", timestampToTime(customer.cBirthday));
                $("#update_cEmail").prop("value", customer.cEmail);
                $("#update_cPhone").prop("value", customer.cPhone);
            },
        });
    }

    //判断更新地址模态框信息是否完整
    //检查用户名的长度及格式以及是否可用
    function check_update_cName() {
        var update_cName = $("#update_cName").val();
        var reg_cName = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
        if (update_cName.length !== 0) {
            var reg = /^[0-9]+$/;
            if (reg.test(update_cName)) {
                show_validate_msg("#check_cNameMsg", "error", "不能是纯数字");
                return false;
            }
            if (!reg_cName.test(update_cName)) {
                show_validate_msg("#check_cNameMsg", "error", "格式不正确");
                return false;
            } else {
                if (update_cName.length > 20 || update_cName.length < 4) {
                    show_validate_msg("#check_cNameMsg", "error", "请输入4-20个字符");
                    return false;
                } else if (update_cName === $("#update_cName").attr("cName")) {
                    show_validate_msg("#check_cNameMsg", "", "支持中文、英文、数字，4-20个字符");
                    return false;
                } else {
                    //判断员工名是否可用
                    $.ajax({
                        url: "${APP_PATH}/checkCnameAndCphoneExist?cData=" + update_cName,
                        type: "GET",
                        success: function (result) {
                            if (result.code === 100) {
                                show_validate_msg("#check_cNameMsg", "success", "用户名可用");
                            } else {
                                show_validate_msg("#check_cNameMsg", "error", "用户名已存在，请输入其他");
                                return false;
                            }
                        }
                    });
                }
            }
        } else {
            show_validate_msg("#check_adminNameMsg", "", "支持中文、英文、数字，2-10个字符");
            return false;
        }
    }

    //检查用户手机的长度及格式
    function check_update_cPhone() {
        var update_cPhone = $("#update_cPhone").val();
        var reg_phone = /^[0-9]+$/;
        if (update_cPhone.length !== 0) {
            if (!reg_phone.test(update_cPhone)) {
                show_validate_msg("#check_cPhoneMsg", "error", "格式有误，请检查");
                return false;
            } else {
                if (update_cPhone.length !== 11) {
                    show_validate_msg("#check_cPhoneMsg", "error", "请输入11位手机号");
                    return false;
                } else {
                    show_validate_msg("#check_cPhoneMsg", "success", "手机号可用");
                }
            }
        } else {
            show_validate_msg("#check_cPhoneMsg", "", "请输入11位手机号");
            return false;
        }
    }

    //检查用户邮箱的格式
    function check_update_cEmail() {
        var update_cEmail = $("#update_cEmail").val();
        var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        if (update_cEmail.length !== 0) {
            if (!reg.test(update_cEmail)) {
                show_validate_msg("#check_cEmailMsg", "error", "格式有误，请检查");
                return false;
            } else {
                show_validate_msg("#check_cEmailMsg", "success", "邮箱格式正确");
            }
        } else {
            show_validate_msg("#check_cEmailMsg", "", "");
            return false;
        }
    }

    //检查用户新增表单是否有空
    function updateCustomerFormIsEmpty() {
        if ($("#update_cName").val().length === 0) {
            show_validate_msg("#check_cNameMsg", "error", "用户名为空");
            return false;
        } else if ($("#update_cEmail").val().length === 0) {
            show_validate_msg("#check_cEmailMsg", "error", "邮箱为空");
            return false;
        } else if ($("#update_cPhone").val().length === 0) {
            show_validate_msg("#check_cPhoneMsg", "error", "电话为空");
            return false;
        } else if ($("#demo_cBirthday").val().length === 0) {
            show_validate_msg("#check_cBirthdayMsg", "error", "出生日期为空");
        }
        return true;
    }

    //点击保存修改，用户更新，关闭模态框，到当前页
    $("#update_customer_btn").click(function () {
        if (!updateCustomerFormIsEmpty()) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/updateCustomer/" + $("#cId").attr("cId"),
            method: "PUT",
            data: $("#update_customer_form").serialize(),
            success: function (result) {
                $("#update_customer_Modal").modal("hide");
                to_page(currentPae);
            }
        });
    });

    /**
     *  删除
     */
    //为新生的delete_btn添加事件  .delete_btn"
    $(document).on("click", ".delete_btn", function () {
        //删除对应的地址信息
        deleteEmployee($(this).attr("delete-id"));
    });

    //删除对应的地址信息
    function deleteEmployee(cId) {
        if (confirm("确认删除吗？")) {
            $.ajax({
                url: "${APP_PATH}/deleteCustomer/" + cId,
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
        var flag = $(".check_item:checked").length === $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });
    //点击删除，就批量删除
    $(document).on("click", "#delete_checkedCustomer_btn", function () {
        var del_idstr = "";
        $.each($(".check_item:checked"), function () {
            // alert($(this).parents("tr").find("td:eq(2)").text());
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //去除del_idstr多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length - 1);
        console.log(del_idstr);
        if (del_idstr.length > 0) {
            if (confirm("确认删除所选中的内容吗？")) {
                //发送ajax请求删除
                $.ajax({
                    url: "${APP_PATH}/deleteCustomer/" + del_idstr,
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
    $("#createCustomerBtn").click(function () {
        $("#create_customer_form")[0].reset();
        $("#create_customer_Modal").modal({
            backdrop: "static"
        });
    });

    //检查用户名的长度及格式以及是否可用
    function check_create_cName() {
        var create_cName = $("#create_cName").val();
        var reg_cName = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
        if (create_cName.length !== 0) {
            var reg = /^[0-9]+$/;
            if (reg.test(create_cName)) {
                show_validate_msg("#check_create_cNameMsg", "error", "不能是纯数字");
                return false;
            }
            if (!reg_cName.test(create_cName)) {
                show_validate_msg("#check_create_cNameMsg", "error", "格式不正确");
                return false;
            } else {
                if (create_cName.length > 20 || create_cName.length < 4) {
                    show_validate_msg("#check_create_cNameMsg", "error", "请输入4-20个字符");
                    return false;
                } else if (create_cName === $("#create_cName").attr("cName")) {
                    show_validate_msg("#check_create_cNameMsg", "", "支持中文、英文、数字，4-20个字符");
                    return false;
                } else {
                    //判断员工名是否可用
                    $.ajax({
                        url: "${APP_PATH}/checkCnameAndCphoneExist?cData=" + create_cName,
                        type: "GET",
                        success: function (result) {
                            if (result.code === 100) {
                                show_validate_msg("#check_create_cNameMsg", "success", "用户名可用");
                            } else {
                                show_validate_msg("#check_create_cNameMsg", "error", "用户名已存在，请输入其他");
                                return false;
                            }
                        }
                    });
                }
            }
        } else {
            show_validate_msg("#check_adminNameMsg", "", "支持中文、英文、数字，2-10个字符");
            return false;
        }
    }

    //检查用户手机的长度及格式
    function check_create_cPhone() {
        var create_cPhone = $("#create_cPhone").val();
        var reg_phone = /^[0-9]+$/;
        if (create_cPhone.length !== 0) {
            if (!reg_phone.test(create_cPhone)) {
                show_validate_msg("#check_create_cPhoneMsg", "error", "格式有误，请检查");
                return false;
            } else {
                if (create_cPhone.length !== 11) {
                    show_validate_msg("#check_create_cPhoneMsg", "error", "请输入11位手机号");
                    return false;
                } else {
                    show_validate_msg("#check_create_cPhoneMsg", "success", "手机号可用");
                }
            }
        } else {
            show_validate_msg("#check_create_cPhoneMsg", "", "请输入11位手机号");
            return false;
        }
    }

    //检查用户邮箱的格式
    function check_create_cEmail() {
        var create_cEmail = $("#create_cEmail").val();
        var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        if (create_cEmail.length !== 0) {
            if (!reg.test(create_cEmail)) {
                show_validate_msg("#check_create_cEmailMsg", "error", "格式有误，请检查");
                return false;
            } else {
                show_validate_msg("#check_create_cEmailMsg", "success", "邮箱格式正确");
            }
        } else {
            show_validate_msg("#check_create_cEmailMsg", "", "");
            return false;
        }
    }

    //检查用户新增表单是否有空
    function createCustomerFormIsEmpty() {
        if ($("#create_cName").val().length === 0) {
            show_validate_msg("#check_create_cNameMsg", "error", "用户名为空");
            return false;
        } else if ($("#create_cEmail").val().length === 0) {
            show_validate_msg("#check_create_cEmailMsg", "error", "邮箱为空");
            return false;
        } else if ($("#create_cPhone").val().length === 0) {
            show_validate_msg("#check_create_cPhoneMsg", "error", "电话为空");
            return false;
        } else if ($("#create_cBirthday").val().length === 0) {
            show_validate_msg("#check_create_cBirthdayMsg", "error", "出生日期为空");
        }
        return true;
    }

    //提交表单数据
    $("#createCustomer_Btn").click(function () {
        if (!createCustomerFormIsEmpty()) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/saveCustomer",
            method: "POST",
            data: $("#create_customer_form").serialize(),
            success: function (result) {
                $("#create_customer_Modal").modal("hide");
                to_page(currentPae);
            }
        });
    });
</script>
</html>
