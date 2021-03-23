<%@ page import="com.legou.entry.Administrator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>乐购-后台</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
        Administrator administrator = (Administrator) session.getAttribute("admin");
    %>
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap-theme.min.css"/>
    <script src="${APP_PATH }/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
</head>
<body style="overflow-x: hidden">
<!-- 头像修改Modal -->
<div class="modal fade" id="updateImageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">头像更换</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updateImage_form" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">预览图</label>
                        <div class="col-sm-5">
                            <img src="${APP_PATH}${sessionScope.admin.adminImage}" width="125px"
                                 id="updatepictureShow" class="img-thumbnail">
                        </div>
                        <div class="col-sm-5">
                            更换头像：<input type="file" class="form-control" id="updatePicture" name="updatePicture"
                                        onchange="check_picture_ext('#updatePicture')">
                            <span class="help-block" id="check_update_picture_msg">只能是jpg、gif、bmp、png、jpeg、png类型！</span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="updateAdminImage()">确认更改</button>
            </div>
        </div>
    </div>
</div>
<%--	管理员信息修改模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="update_admin_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">个人信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_admin_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名：</label>
                        <div class="col-md-10">
                            <input class="form-control" id="adminName" name="adminName"
                                   adminName="${sessionScope.admin.adminName}"
                                   value="${sessionScope.admin.adminName}"
                                   adminId="${sessionScope.admin.adminId}" onchange="check_adminName()"/>
                            <span class="help-block" id="check_adminName_msg"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">性别：</label>
                        <div class="col-sm-10">
                            <c:choose>
                                <c:when test="${sessionScope.admin.adminGender == 1}">
                                    <label class="radio-inline">
                                        <input type="radio" name="adminGender" value="1" checked/> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="adminGender" value="0"/> 女
                                    </label>
                                </c:when>
                                <c:otherwise>
                                    <label class="radio-inline">
                                        <input type="radio" name="adminGender" value="1"/> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="adminGender" value="0" checked/> 女
                                    </label>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱：</label>
                        <div class="col-md-10">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">@</span>
                                <input type="text" class="form-control" name="adminEmail" id="adminEmail"
                                       value="${sessionScope.admin.adminEmail}" onchange="check_adminEmail()">
                            </div>
                            <span id="check_adminEmail_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">手机号码</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-phone"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" name="adminPhone" id="adminPhone"
                                       value="${sessionScope.admin.adminPhone}" onchange="check_adminPhone()">
                            </div>
                            <span id="check_adminPhone_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">出生日期</label>
                        <div class="col-md-10">
                            <div class="input-group">
                                <input class="laydate-icon form-control col-sm-10"
                                       id="adminCreatetime" name="adminCreatetime"
                                       value="${sessionScope.admin.adminCreatetime}"
                                       onclick="dateSelect('#adminCreatetime')"/>
                                <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                     aria-hidden="true"></span></div>
                            </div>
                            <span id="check_adminCreatetime_msg" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_admin_btn">保存修改</button>
            </div>
        </div>
    </div>
</div>
<%-- 管理员密码修改模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="update_admin_Pwd_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">密码修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_admin_pwd_form">

                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">旧密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="oldPwd" id="oldPwd"
                                   value="" onblur="check_oldPwd()">
                            <span id="checkoldPwdFalse" class="help-block">请输入旧密码</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="newPwd" id="newPwd"
                                   value="" onblur="check_newPwd_length()" onkeyup="check_newPwd_format()">
                            <span id="checkNewPwdFalse" class="help-block">建议使用字母、数字和'_'、'-'两种及以上的组合，8-20个字符</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="confirmPwd" id="confirmPwd"
                                   value="" onblur="check_newPwd_isEqual()">
                            <span id="checkconfirmPwdFalse" class="help-block">请再次输入密码</span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_admin_pwd_btn">确认修改</button>
            </div>
        </div>
    </div>
</div>
<div class="container" style="width: 1585px;">
    <jsp:include page="endLeftNavAndHeader.jsp"></jsp:include>
    <div class="col-md-offset-2 col-md-9" style="margin-top: 60px;">
        <div class="panel panel-default">
            <div class="panel-body" style="height: auto;min-height: 750px;">
                <div class="container">
                    <div class="row" style="margin-bottom: 50px">
                        <h3>个人中心</h3>
                    </div>
                    <div class="row">
                        <form method="post" enctype="multipart/form-data">
                            <table border="0">
                                <tr>
                                    <td>
                                        <img src="${APP_PATH}${sessionScope.admin.adminImage}" width="125px"
                                             id="adminImageShow" class="img-thumbnail">
                                    </td>
                                    <td>
                                        &nbsp;&nbsp;用户名：<span style="font-size: 20px">
                                        ${sessionScope.admin.adminName}</span><br><br><br><br>
                                        &nbsp;&nbsp;<a onclick="open_updateImageModal()"
                                                       style="cursor: pointer">修改头像</a>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="row col-md-11" style="margin-top: 50px">
                        <table class="table table-hover">
                            <tr>
                                <td>用户名：</td>
                                <td>${sessionScope.admin.adminName}</td>
                            </tr>
                            <tr>
                                <td>性别：</td>
                                <td>
                                    <c:if test="${sessionScope.admin.adminGender == 1}">
                                        男
                                    </c:if>
                                    <c:if test="${sessionScope.admin.adminGender != 1}">
                                        女
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td>邮箱：</td>
                                <td>${sessionScope.admin.adminEmail}</td>
                            </tr>
                            <tr>
                                <td>手机号码：</td>
                                <td>${sessionScope.admin.adminPhone}</td>
                            </tr>
                            <tr>
                                <td>出生日期</td>
                                <td>${sessionScope.admin.adminCreatetime}</td>
                            </tr>
                            <tr>
                                <td>管理员级别：</td>
                                <td>
                                    <c:if test="${sessionScope.admin.adminTypeId == 1}">
                                        超级管理员
                                    </c:if>
                                    <c:if test="${sessionScope.admin.adminTypeId != 1}">
                                        管理员
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <button class="btn btn-primary" onclick="updateAdminInfo()">修改信息</button>
                                </td>
                                <td style="text-align: center">
                                    <button class="btn btn-danger" onclick="updateAdminPwd()">更换密码</button>
                                </td>
                            </tr>
                        </table>
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
<%--	管理员个人信息修改--%>
<script type="text/javascript">
    //检查用户名的长度及格式以及是否可用
    function check_adminName() {
        var adminName = $("#adminName").val();
        var reg_cName = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
        if (adminName.length !== 0) {
            if (!reg_cName.test(adminName)) {
                show_validate_msg("#check_adminName_msg", "error", "格式不正确");
                return false;
            } else {
                if (adminName.length > 10 || adminName.length < 2) {
                    show_validate_msg("#check_adminName_msg", "error", "请输入2-10个字符");
                    return false;
                } else if (adminName === $("#adminName").attr("adminName")) {
                    show_validate_msg("#check_adminName_msg", "", "");
                    return false;
                } else {
                    //判断员工名是否可用
                    $.ajax({
                        url: "${APP_PATH}/checkAdminNameExist?adminName=" + adminName,
                        type: "GET",
                        success: function (result) {
                            if (result.code === 100) {
                                show_validate_msg("#check_adminName_msg", "", "");
                            } else {
                                show_validate_msg("#check_adminName_msg", "error", "用户名已存在，请输入其他");
                                return false;
                            }
                        }
                    });
                }
            }
        } else {
            show_validate_msg("#check_adminName_msg", "", "");
            return false;
        }
    }

    //检查用户手机的长度及格式
    function check_adminPhone() {
        var adminPhone = $("#adminPhone").val();
        var reg_phone = /^[0-9]+$/;
        if (adminPhone.length !== 0) {
            if (!reg_phone.test(adminPhone)) {
                show_validate_msg("#check_adminPhone_msg", "error", "格式有误，请检查");
                return false;
            } else {
                if (adminPhone.length !== 11) {
                    show_validate_msg("#check_adminPhone_msg", "error", "请输入11位手机号");
                    return false;
                } else {
                    show_validate_msg("#check_adminPhone_msg", "", "");
                }
            }
        } else {
            show_validate_msg("#check_adminPhone_msg", "", "");
            return false;
        }
    }

    //检查用户邮箱的格式
    function check_adminEmail() {
        var adminEmail = $("#adminEmail").val();
        var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        if (adminEmail.length !== 0) {
            if (!reg.test(adminEmail)) {
                show_validate_msg("#check_adminEmail_msg", "error", "格式有误，请检查");
                return false;
            } else {
                show_validate_msg("#check_adminEmail_msg", "", "");
            }
        } else {
            show_validate_msg("#check_adminEmail_msg", "", "");
            return false;
        }
    }

    //检查用户新增表单是否有空
    function updateAdminFormIsEmpty() {

        //判断是否有咽炎错误的表单数据
        if ($("#update_admin_form").find("div.has-error").length > 0) {
            return false;
        }

        if ($("#adminName").val().length === 0) {
            show_validate_msg("#check_adminName_msg", "error", "用户名为空");
            return false;
        } else if ($("#adminPhone").val().length === 0) {
            show_validate_msg("#check_adminPhone_msg", "error", "手机号为空");
            return false;
        } else if ($("#adminEmail").val().length === 0) {
            show_validate_msg("#check_adminEmail_msg", "error", "邮箱为空");
            return false;
        } else if ($("#adminCreatetime").val().length === 0) {
            show_validate_msg("#check_adminCreatetime_msg", "error", "出生日期为空");
        }
        return true;
    }

    /**
     * 修改个人信息
     */
    function updateAdminInfo() {
        $("#update_admin_Modal").modal({
            backdrop: "static"
        });
    }

    $("#update_admin_btn").click(function () {
        if (!updateAdminFormIsEmpty()) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/updateAdmin",
            type: "PUT",
            data: $("#update_admin_form").serialize() + "&adminId=" + $("#adminName").attr("adminId"),
            success: function (result) {
                location.reload();
                // $("#update_admin_Modal").modal("hide");
            }
        })
    });
</script>
<%--	管理员密码修改--%>
<script type="text/javascript">


    function updateAdminPwd() {
        $("#update_admin_Pwd_Modal").modal({
            backdrop: "static"
        });
    }

    //判断旧密码是否正确
    function check_oldPwd() {
        if ($("#oldPwd").val().length === 0) {
            show_validate_msg("#checkoldPwdFalse", "", "请输入旧密码");
            return false;
        } else {
            var cust_pwd = '<%= administrator.getAdminPassword()%>';
            console.log(cust_pwd);
            if (cust_pwd !== $("#oldPwd").val()) {
                show_validate_msg("#checkoldPwdFalse", "error", "密码不正确，请重新输入");
                return false;
            } else {
                show_validate_msg("#checkoldPwdFalse", "success", "密码正确");
            }
        }
    }

    //检查密码格式以及长度
    //onkeyup事件 校验密码格式是否正确
    function check_newPwd_format() {
        if ($("#newPwd").val().length === 0) {
            show_validate_msg("#checkNewPwdFalse", "", "建议使用字母、数字和'_'两种及以上的组合，8-20个字符");
            return false;
        }
        //建议使用字母、数字和_两种及以上的组合，8-20个字符
        var reg_password = /^[0-9A-Za-z_]+$/;
        var reg_check = reg_password.test($("#newPwd").val());
        if (!reg_check) {
            show_validate_msg("#checkNewPwdFalse", "error", "格式错误,仅支持字母、数字和'_'两种及以上的组合");
        } else {
            show_validate_msg("#checkNewPwdFalse", "", "建议使用字母、数字和'_'两种及以上的组合，8-20个字符");
        }
    }

    //onblur事件 判断密码长度
    function check_newPwd_length() {
        //判断密码格式是否正确
        if ($("#newPwd").val().length === 0) {
            show_validate_msg("#checkNewPwdFalse", "", "建议使用字母、数字和'_'两种及以上的组合，8-20个字符");
            return false;
        }
        if ($("#newPwd").val().length < 8 || $("#newPwd").val().length > 20) {
            show_validate_msg("#checkNewPwdFalse", "error", "长度只能在8-20个字符之间");
            return false;
        } else {
            if ($("#oldPwd").val() === $("#newPwd").val()) {
                show_validate_msg("#checkNewPwdFalse", "error", "不可以与旧密码相同");
                return false;
            }
            show_validate_msg("#checkNewPwdFalse", "success", "密码可用");
            if ($("#confirmPwd").val().length > 0) {
                if ($("#newPwd").val() !== $("#confirmPwd").val()) {
                    show_validate_msg("#checkconfirmPwdFalse", "error", "两次密码不一致，请再次输入密码");
                    return false;
                }
            }
        }
    }

    //判断两次密码是否一致
    //onblur事件 判断两次密码是否一致
    function check_newPwd_isEqual() {
        if ($("#confirmPwd").val().length === 0) {
            show_validate_msg("#checkconfirmPwdFalse", "", "请再次输入密码");
            return false;
        }
        if ($("#confirmPwd").val() !== $("#newPwd").val()) {
            show_validate_msg("#checkconfirmPwdFalse", "error", "两次密码不一致，请再次输入密码");
            return false;
        } else {
            show_validate_msg("#checkconfirmPwdFalse", "success", "密码验证成功");
        }
    }

    //判断修改信息表单是否有空
    function update_admin_pwd_form_isEmpty() {

        //判断是否有咽炎错误的表单数据
        if ($("#update_admin_pwd_form").find("div.has-error").length > 0) {
            return false;
        }

        if ($("#oldPwd").val().length === 0) {
            show_validate_msg("#checkoldPwdFalse", "error", "请输入旧密码");
            return false;
        } else if ($("#newPwd").val().length === 0) {
            show_validate_msg("#checkNewPwdFalse", "error", "请输入新密码");
            return false;
        } else if ($("#confirmPwd").val().length === 0) {
            show_validate_msg("#checkconfirmPwdFalse", "error", "两次密码不一致，请再次输入密码");
            return false;
        }
        return true;
    }

    $("#update_admin_pwd_btn").click(function () {
        if (!update_admin_pwd_form_isEmpty()) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/updateAdminPwd/" + $("#confirmPwd").val(),
            type: "PUT",
            success: function (result) {
                alert("修改成功");
                window.location.href = "${APP_PATH}/forwordPage?url=endLogin";
            },
            error: function () {
                alert("修改异常")
            }
        });
    });
</script>
<%--	管理员头像修改--%>
<script type="text/javascript">
    //获取选择的图片的路径
    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL !== undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL !== undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL !== undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }

    //判断选择的文件是否是图片格式
    function check_picture_ext(obj) {
        var picture = $(obj).val();
        var ext = picture.substr(picture.lastIndexOf("."));
        ext = ext.substring(1, ext.length);
        // 后缀名转换为小写
        var fileType = ext.toLowerCase();
        // 创建格式数组
        var suppotFile = new Array();
        // 存储格式类型
        suppotFile[0] = "jpg";
        suppotFile[1] = "gif";
        suppotFile[2] = "bmp";
        suppotFile[3] = "png";
        suppotFile[4] = "jpeg";
        //判断fileType是否存在数组里面
        for (var i = 0; i < suppotFile.length; i++) {
            if (suppotFile[i] === fileType) {
                show_validate_msg("#check_update_picture_msg", "", "只能是jpg、gif、bmp、png、jpeg、png类型！");
                return true;
            }
        }
        //如果不存在返回 false
        show_validate_msg("#check_update_picture_msg", "error", "文件类型不合法,只能是jpg、gif、bmp、png、jpeg、png类型！");
        return false;
    }

    function open_updateImageModal() {
        $("#updateImageModal").modal({
            backdrop: "static"
        });
    }

    //展示预览图
    $("#updatePicture").change(function () {
        var url = getObjectURL(this.files[0]);
        $("#updatepictureShow").prop("src", url);
    });

    function updateAdminImage() {
        //判断是否有咽炎错误的表单数据
        if ($("#updateImage_form").find("div.has-error").length > 0) {
            return false;
        }
        var formData = new FormData();
        var adminId = $("#adminName").attr("adminId");
        formData.append("adminId", adminId);
        formData.append("pictureFile", $("#updatePicture").get(0).files[0]);
        $.ajax({
            url: "${APP_PATH}/updateAdminImage",
            method: "POST",
            contentType: false,// 告诉jQuery不要去设置Content-Type请求头
            processData: false,// 告诉jQuery不要去处理发送的数据
            data: formData,
            success: function (result) {
                location.reload();
            }
        });
    }
</script>
</html>
