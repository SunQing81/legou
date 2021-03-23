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
<%-- 员工信息新增模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="create_employee_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="createEmployeeForm">
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">员工名</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-user"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" id="create_adminName" name="adminName"
                                       onblur="check_create_adminName()">
                            </div>
                            <span id="check_createAdminNameMsg" class="help-block">支持中文、英文、数字，2-10个字符</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <label class="radio-inline">
                                    <input type="radio" name="adminGender" id="create_male" value="1" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="adminGender" id="create_female" value="0"> 女
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon">@</div>
                                <input type="text" id="create_adminEmail" class="form-control" name="adminEmail"
                                       onblur="check_create_adminEmail()">
                            </div>
                            <span id="check_createAdminEmailMsg" class="help-block">请输入正确的邮箱</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-phone"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" id="create_adminPhone" name="adminPhone"
                                       onblur="check_create_adminPhone()">
                            </div>
                            <span id="check_createAdminPhoneMsg" class="help-block">请输入11位手机号</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">入职日期</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <input class="laydate-icon form-control" id="demo" name="adminCreatetime" value=""/>
                                <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                     aria-hidden="true"></span></div>
                            </div>
                            <span id="check_createAdminCreatetimeMsg" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="createEmployee_Btn">新增</button>
            </div>
        </div>
    </div>
</div>
<%-- 员工信息修改模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="update_employee_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">员工信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">员工ID</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <p id="adminId"></p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">员工名</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-user"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" id="update_adminName"
                                       onblur="check_update_adminName()">
                            </div>
                            <span id="check_adminNameMsg" class="help-block">支持中文、英文、数字，2-10个字符</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="male" value="1"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="female" value="0"> 女
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon">@</div>
                                <input type="text" id="update_adminEmail" class="form-control"
                                       onblur="check_update_adminEmail()">
                            </div>
                            <span id="check_adminEmailMsg" class="help-block">请输入正确的邮箱</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-phone"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" id="update_adminPhone"
                                       onblur="check_update_adminPhone()">
                            </div>
                            <span id="check_adminPhoneMsg" class="help-block">请输入11位手机号</span>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_employee_btn">保存修改</button>
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
                            <h3>员工管理</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-md-offset-10">
                            <button type="button" id="createEmployeeBtn" class="btn btn-primary" style="width: 110px">
                                新增
                            </button>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 30px;margin-left: 30px;">
                        <form class="form-inline" id="detailSelectForm">
                            <div class="form-group">
                                <input type="text" class="form-control" name="adminId" placeholder="按员工ID查询">&nbsp;&nbsp;
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="adminName" placeholder="按姓名查询(模糊查询)">&nbsp;&nbsp;
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="adminGender">
                                    <option hidden value="">性别</option>
                                    <optgroup label="性别"></optgroup>
                                    <option value="1">男</option>
                                    <option value="0">女</option>
                                </select>
                            </div>
                            <div class="form-group">
                                &nbsp;&nbsp;<input type="text" class="form-control" name="adminPhone"
                                                   placeholder="按手机号查询(模糊查询)">&nbsp;&nbsp;
                            </div>
                            <button type="button" class="btn btn-default" onclick="selectEmployee(1)">条件查询</button>
                        </form>
                    </div>
                    <div class="row" style="margin-top: 30px;">
                        <table class="table table-hover" id="employee_table">
                            <thead>
                            <tr>
                                <td><input type="checkbox" id="check_all">全选</td>
                                <td>员工ID</td>
                                <td>员工名</td>
                                <td>性别</td>
                                <td>邮箱</td>
                                <td>手机号</td>
                                <td>入职时间</td>
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
    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo'});//绑定元素
    }();

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
        return Y + M + D;
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
            url: "${APP_PATH}/getAllEmployees",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result);
                //1.解析并显示地址数据
                build_employee_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    //1.解析并显示地址数据
    function build_employee_table(result) {
        //清空table tbody
        $("#employee_table tbody").empty();
        var employeeList = result.extendInfo.pageInfo.list;
        if (result.extendInfo.pageInfo.total > 0) {
            $.each(employeeList, function (index, item) {
                // alert(item.empName);
                var checkBoxTd = $("<td></td>").append("<input type='checkbox' class='check_item' />");
                var adminIdTd = $("<td></td>").append(item.adminId);
                var adminNameTd = $("<td></td>").append(item.adminName);
                var adminGerderTd = $("<td></td>").append(item.adminGender === 1 ? '男' : '女');
                var adminEmailTd = $("<td></td>").append(item.adminEmail);
                var adminPhoneTd = $("<td></td>").append(item.adminPhone);
                var adminCreatetimeTd = $("<td></td>").append(item.adminCreatetime);

                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除");
                //为删除按钮添加一个自定义的属性，来表示当前员工id
                delBtn.attr("delete-id", item.adminId);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" 编辑");
                //为编辑按钮添加一个自定义的属性，来表示当前地址id
                editBtn.attr("edit-id", item.adminId);

                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                //apend()方法执行完成以后还是返回原来的元素
                $("<tr></tr>").append(checkBoxTd)
                    .append(adminIdTd)
                    .append(adminNameTd)
                    .append(adminGerderTd)
                    .append(adminEmailTd)
                    .append(adminPhoneTd)
                    .append(adminCreatetimeTd)
                    .append(btnTd)
                    .appendTo("#employee_table tbody");
            });
        } else {
            $("<tr></tr>").append($("<td colspan='8'></td>").append("未查询到员工数据"))
                .appendTo("#employee_table tbody");
        }

    }

    //2.解析并显示分页信息
    function build_page_info(result) {
        //清空分页信息
        $("#page_info_area").empty();
        $("#page_info_area").append($("<button id='delete_checkedEmployee_btn'></button>").addClass("btn btn-danger btn-sm")
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
            selectEmployee(1);
        });
        prePageLi.click(function () {
            selectEmployee(result.extendInfo.pageInfo.pageNum - 1);
        });
        nextPageLi.click(function () {
            selectEmployee(result.extendInfo.pageInfo.pageNum + 1);
        });
        lastPageLi.click(function () {
            selectEmployee(result.extendInfo.pageInfo.pages);
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
                selectEmployee(item);
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
    function selectEmployee(pn) {
        $.ajax({
            url: "${APP_PATH}/detailSelectEmployee",
            type: "GET",
            data: $("#detailSelectForm").serialize() + "&pn=" + pn,
            success: function (result) {
                console.log(result);
                //1.解析并显示地址数据
                build_employee_table(result);
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
        $("#adminId").text("");
        //获取对应的地址信息显示在表单中
        getEmployeeByAdminId($(this).attr("edit-id"));
        console.log($(this).attr("edit-id"));
        // location.reload();
        $("#update_employee_Modal").modal({
            backdrop: "static"
        });
        $("#update_employee_btn").attr("update-aid", $(this).attr("edit-id"));
    });

    //通过员工id获取员工信息并显示在表单中显示在表单中
    function getEmployeeByAdminId(adminId) {
        $.ajax({
            url: "${APP_PATH}/getEmployeeByAdminId?adminId=" + adminId,
            type: "GET",
            success: function (result) {
                console.log(result);
                var employee = result.extendInfo.employee;
                $("#adminId").append(employee.adminId);
                $("#update_adminName").prop("value", employee.adminName).attr("adminName", employee.adminName);
                if (employee.adminGender === 1) {
                    $("#male").prop("checked", true);
                } else {
                    $("#female").prop("checked", true);
                }
                $("#update_adminEmail").prop("value", employee.adminEmail);
                $("#update_adminPhone").prop("value", employee.adminPhone);
            },
        });
    }

    //判断更新地址模态框信息是否完整
    //检查员工名的长度及格式以及是否可用
    function check_update_adminName() {
        var update_adminName = $("#update_adminName").val();
        var reg_adminName = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
        if (update_adminName.length !== 0) {
            if (!reg_adminName.test(update_adminName)) {
                show_validate_msg("#check_adminNameMsg", "error", "格式不正确");
                return false;
            } else {
                if (update_adminName.length > 10 || update_adminName.length < 2) {
                    show_validate_msg("#check_adminNameMsg", "error", "请输入2-10个字符");
                    return false;
                } else if (update_adminName === $("#update_adminName").attr("adminName")) {
                    show_validate_msg("#check_adminNameMsg", "", "支持中文、英文、数字，2-10个字符");
                    return false;
                } else {
                    //判断员工名是否可用
                    $.ajax({
                        url: "${APP_PATH}/checkAdminNameExist?adminName=" + update_adminName,
                        type: "GET",
                        success: function (result) {
                            if (result.code === 100) {
                                show_validate_msg("#check_adminNameMsg", "success", "员工名可用");
                            } else {
                                show_validate_msg("#check_adminNameMsg", "error", "员工名已存在，请输入其他");
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

    //检查员工手机的长度及格式
    function check_update_adminPhone() {
        var update_adminPhone = $("#update_adminPhone").val();
        var reg_phone = /^[0-9]+$/;
        if (update_adminPhone.length !== 0) {
            if (!reg_phone.test(update_adminPhone)) {
                show_validate_msg("#check_adminPhoneMsg", "error", "格式有误，请检查");
                return false;
            } else {
                if (update_adminPhone.length !== 11) {
                    show_validate_msg("#check_adminPhoneMsg", "error", "请输入11位手机号");
                    return false;
                } else {
                    show_validate_msg("#check_adminPhoneMsg", "success", "手机号可用");
                }
            }
        } else {
            show_validate_msg("#check_adminPhoneMsg", "", "请输入11位手机号");
            return false;
        }
    }

    //检查员工邮箱的格式
    function check_update_adminEmail() {
        var update_adminEmail = $("#update_adminEmail").val();
        var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        if (update_adminEmail.length !== 0) {
            if (!reg.test(update_adminEmail)) {
                show_validate_msg("#check_adminEmailMsg", "error", "格式有误，请检查");
                return false;
            } else {
                show_validate_msg("#check_adminEmailMsg", "success", "邮箱格式正确");
            }
        } else {
            show_validate_msg("#updateadsAddressMsg", "", "");
            return false;
        }
    }

    //检查地址新增表单是否有空
    function updateEmployeeFormIsEmpty() {
        if ($("#update_adminName").val().length === 0) {
            show_validate_msg("#check_adminNameMsg", "error", "员工名为空");
            return false;
        } else if ($("#update_adminEmail").val().length === 0) {
            show_validate_msg("#check_adminEmailMsg", "error", "邮箱为空");
            return false;
        } else if ($("#update_adminPhone").val().length === 0) {
            show_validate_msg("#check_adminPhoneMsg", "error", "电话为空");
            return false;
        }
        return true;
    }

    //点击保存修改，员工更新，关闭模态框，到当前页
    $("#update_employee_btn").click(function () {
        if (!updateEmployeeFormIsEmpty()) {
            return false;
        }
        var adminId = $("#update_employee_btn").attr("update-aid");
        var adminName = $("#update_adminName").val();
        var adminGender;
        if ($("#male").prop("checked")) {
            adminGender = 1;
        } else {
            adminGender = 0;
        }
        var adminEmail = $("#update_adminEmail").val();
        var adminPhone = $("#update_adminPhone").val();
        var employeeInfo = adminId + "-" + adminName + "-" + adminGender + "-" + adminEmail + "-" + adminPhone;
        var employeeInfoUrl = window.encodeURIComponent(employeeInfo);
        $.ajax({
            url: "${APP_PATH}/updateEmployee/" + employeeInfoUrl,
            method: "PUT",
            success: function (result) {
                // alert("修改成");
                if (result.extendInfo.checkEmployeeMsg !== undefined) {
                    show_validate_msg("#check_adminNameMsg", "error", result.extendInfo.checkEmployeeMsg);
                } else {
                    $("#update_employee_Modal").modal("hide");
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
        deleteEmployee($(this).attr("delete-id"));
    });

    //删除对应的地址信息
    function deleteEmployee(adminId) {
        if (confirm("确认删除吗？")) {
            $.ajax({
                url: "${APP_PATH}/deleteEmployee/" + adminId,
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
    $(document).on("click", "#delete_checkedEmployee_btn", function () {
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
                    url: "${APP_PATH}/deleteEmployee/" + del_idstr,
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
    $("#createEmployeeBtn").click(function () {
        $("#create_employee_Modal").modal({
            backdrop: "static"
        });
    });

    //检查员工名的长度及格式以及是否可用
    function check_create_adminName() {
        var create_adminName = $("#create_adminName").val();
        var reg_adminName = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
        if (create_adminName.length !== 0) {
            if (!reg_adminName.test(create_adminName)) {
                show_validate_msg("#check_createAdminNameMsg", "error", "格式不正确");
                return false;
            } else {
                if (create_adminName.length > 10 || create_adminName.length < 2) {
                    show_validate_msg("#check_createAdminNameMsg", "error", "请输入2-10个字符");
                    return false;
                } else {
                    //判断员工名是否可用
                    $.ajax({
                        url: "${APP_PATH}/checkAdminNameExist?adminName=" + create_adminName,
                        type: "GET",
                        success: function (result) {
                            if (result.code === 100) {
                                show_validate_msg("#check_createAdminNameMsg", "success", "员工名可用");
                            } else {
                                show_validate_msg("#check_createAdminNameMsg", "error", "员工名已存在，请输入其他");
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

    //检查员工手机的长度及格式
    function check_create_adminPhone() {
        var create_adminPhone = $("#create_adminPhone").val();
        var reg_phone = /^[0-9]+$/;
        if (create_adminPhone.length !== 0) {
            if (!reg_phone.test(create_adminPhone)) {
                show_validate_msg("#check_createAdminPhoneMsg", "error", "格式有误，请检查");
                return false;
            } else {
                if (create_adminPhone.length !== 11) {
                    show_validate_msg("#check_createAdminPhoneMsg", "error", "请输入11位手机号");
                    return false;
                } else {
                    show_validate_msg("#check_createAdminPhoneMsg", "success", "手机号可用");
                }
            }
        } else {
            show_validate_msg("#check_createAdminPhoneMsg", "", "请输入11位手机号");
            return false;
        }
    }

    //检查员工邮箱的格式
    function check_create_adminEmail() {
        var create_adminEmail = $("#create_adminEmail").val();
        var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        if (create_adminEmail.length !== 0) {
            if (!reg.test(create_adminEmail)) {
                show_validate_msg("#check_createAdminEmailMsg", "error", "格式有误，请检查");
                return false;
            } else {
                show_validate_msg("#check_createAdminEmailMsg", "success", "邮箱格式正确");
            }
        } else {
            show_validate_msg("#check_createAdminEmailMsg", "", "请输入正确邮箱");
            return false;
        }
    }

    //检查地址新增表单是否有空
    function createEmployeeFormIsEmpty() {
        if ($("#create_adminName").val().length === 0) {
            show_validate_msg("#check_createAdminNameMsg", "error", "员工名为空");
            return false;
        } else if ($("#create_adminEmail").val().length === 0) {
            show_validate_msg("#check_createAdminEmailMsg", "error", "邮箱为空");
            return false;
        } else if ($("#create_adminPhone").val().length === 0) {
            show_validate_msg("#check_createAdminPhoneMsg", "error", "电话为空");
            return false;
        } else if ($("#demo").val().length === 0) {
            show_validate_msg("#check_createAdminCreatetimeMsg", "error", "日期为空");
            return false;
        }
        return true;
    }

    //提交表单数据
    $("#createEmployee_Btn").click(function () {
        if (!createEmployeeFormIsEmpty()) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/createEmployee",
            method: "POST",
            data: $("#createEmployeeForm").serialize(),
            success: function (result) {
                // alert("新增成功");
                if (result.extendInfo.checkEmployeeMsg !== undefined) {
                    show_validate_msg("#check_adminNameMsg", "error", result.extendInfo.checkEmployeeMsg);
                } else {
                    $("#create_employee_Modal").modal("hide");
                    to_page(currentPae);
                }
            }
        });
    });
</script>
</html>
