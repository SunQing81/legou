<%@ page import="com.legou.entry.Customer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 孙庆
  Date: 2020/2/11
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>乐购-个人中心</title>
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
                            <img src="${APP_PATH}${sessionScope.customer.cImage}" width="125px"
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
<%-- 用户信息修改模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="update_Cust_Info_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">个人信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_cust_info_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户ID</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" value="${sessionScope.customer.cId}" readonly
                                   id="cId" name="cId">
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-user"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" name="cName" id="cName"
                                       value="${sessionScope.customer.cName}" onkeyup="check_cName_format();"
                                       onblur="check_cName_lengthAndisExist();">
                            </div>
                            <span id="checkUsernameFalse" class="help-block">支持中文、英文、数字，4-20个字符</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;别</label>
                        <div class="col-sm-10">
                            <c:choose>
                                <c:when test="${sessionScope.customer.cGender == 1}">
                                    <label class="radio-inline">
                                        <input type="radio" name="cGender" value="1" checked/> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="cGender" value="0"/> 女
                                    </label>
                                </c:when>
                                <c:otherwise>
                                    <label class="radio-inline">
                                        <input type="radio" name="cGender" value="1"/> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="cGender" value="0" checked/> 女
                                    </label>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">出生日期</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <input class="laydate-icon form-control" id="demo" name="cBirthday"
                                       value="<fmt:formatDate value="${sessionScope.customer.cBirthday}" pattern="yyyy-MM-dd" />">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                     aria-hidden="true"></span></div>
                            </div>
                            <span id="checkBirthdayIsEmpty" class="help-block">请选择出生日期</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">@</span>
                                <input type="text" class="form-control" name="cEmail" id="cEmail"
                                       value="${sessionScope.customer.cEmail}" onblur="check_cEmail_format();">
                            </div>
                            <span id="checkEmailFalse" class="help-block">请输入正确格式的邮箱</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">手机号码</label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-phone"
                                                                     aria-hidden="true"></span></div>
                                <input type="text" class="form-control" name="cPhone" id="cPhone"
                                       value="${sessionScope.customer.cPhone}" onblur="check_phone_format();">
                            </div>
                            <span id="checkPhoneFalse" class="help-block">请输入11位手机号</span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_cust_info_btn">保存修改</button>
            </div>
        </div>
    </div>
</div>
<%-- 用户密码修改模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="update_Cust_Pwd_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">密码修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_cust_pwd_form">

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
                <button type="button" class="btn btn-primary" id="update_cust_pwd_btn">确认修改</button>
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
                        <table border="0" style="width:870px; line-height:22px;" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td width="115">
                                    <img src="${APP_PATH}${sessionScope.customer.cImage}" width="90" height="90"
                                         class="img-thumbnail"/>
                                </td>
                                <td>
                                    <p style="font-weight: 700">用户名:${sessionScope.customer.cName}</p>
                                    <p>我的积分：<span style="font-weight: 500">${sessionScope.customer.jifen}</span></p>
                                    <span><a onclick="open_updateImageModal()"
                                             style="cursor: pointer;color: red">修改头像</a></span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="container" style="width: 600px">
                        <div class="row" style="margin-top: 30px;">
                            <div class="col-md-12" style="text-align: center;font-size: 20px;margin-bottom: 10px">
                                账号信息
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-hover">
                                    <tr>
                                        <td class="col-md-4">用户ID:</td>
                                        <td class="col-md-8">${sessionScope.customer.cId}</td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-4">用户名:</td>
                                        <td class="col-md-8">${sessionScope.customer.cName}</td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-4">性别:</td>
                                        <td class="col-md-8">${sessionScope.customer.cGender == 1 ? '男' : '女'}</td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-4">出生日期:</td>
                                        <c:choose>
                                            <c:when test="${sessionScope.customer.cBirthday != null}">
                                                <td class="col-md-8" id="cust_birthday"><fmt:formatDate
                                                        value="${sessionScope.customer.cBirthday}"
                                                        pattern="yyyy-MM-dd"/></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="col-md-8" id="cust_birthday">未设置</td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <td class="col-md-4">邮箱:</td>
                                        <td class="col-md-8">${sessionScope.customer.cEmail}</td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-4">手机号:</td>
                                        <td class="col-md-8">${sessionScope.customer.cPhone}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row" style="text-align: center">
                            <div class="col-md-6">
                                <button type="button" class="btn btn-success" id="updateCustomerInfo_btn"
                                        onclick="openUpdateInfoModel()">修改信息
                                </button>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-danger" onclick="openUpdatePwdModel()">更改密码
                                </button>
                            </div>
                        </div>
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
<script type="text/javascript">
    //日期功能
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

    //点击修改信息按钮弹出模态框
    function openUpdateInfoModel() {
        //弹出模态框
        //backdrop:"static",表示点击无关位置，模态框不会关闭
        $("#update_Cust_Info_Modal").modal({
            backdrop: "static"
        });
    }

    //点击修改密码按钮弹出模态框
    function openUpdatePwdModel() {
        //弹出模态框
        //backdrop:"static",表示点击无关位置，模态框不会关闭
        $("#update_Cust_Pwd_Modal").modal({
            backdrop: "static"
        });
    }
</script>
<%--校验用户信息修改表单数据--%>
<script type="text/javascript">
    //获取表单各文本框
    var cName = document.getElementById("cName");
    var cEmail = document.getElementById("cEmail");
    var cPhone = document.getElementById("cPhone");
    var cBirthday = document.getElementById("demo");
    //检查用户名格式、长度以及是否可用
    //onkeyup事件 校验用户名格式是否正确
    function check_cName_format() {
        if (cName.value.length === 0) {
            if ($("#cName").hasClass("checkfalse")) {
                $("#cName").removeClass("checkfalse");
            }
            show_validate_msg("#checkUsernameFalse", "", "支持中文、英文、数字，4-20个字符");
            return false;
        }
        //支持中文、英文、数字，4-20个字符
        var reg_cName = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
        var reg_check = reg_cName.test(cName.value);
        if (!reg_check) {
            show_validate_msg("#checkUsernameFalse", "error", "格式错误,仅支持中文、英文、数字");
            $("#cName").addClass("checkfalse");
        } else {
            if ($("#cName").hasClass("checkfalse")) {
                $("#cName").removeClass("checkfalse");
            }
            show_validate_msg("#checkUsernameFalse", "", "支持中文、英文、数字，4-20个字符");
        }
    }

    //onblur事件  检验用户名长度以及是否可用
    function check_cName_lengthAndisExist() {
        //判断用户名格式是否正确
        if ($("#cName").hasClass("checkfalse")) {
            return false;
        }
        if (cName.value.length === 0) {
            show_validate_msg("#checkUsernameFalse", "", "支持中文、英文、数字，4-20个字符");
            return false;
        }
        if (cName.value === "${sessionScope.customer.cName}") {
            show_validate_msg("#checkUsernameFalse", "", "支持中文、英文、数字，4-20个字符");
            return false;
        }
        if (/^\d+$/.test($("#cName").val())) {
            show_validate_msg("#checkUsernameFalse", "error", "用户名不能是纯数字,请重新输入！");
            $("#cName").addClass("checkfalse");
            return false;
        }
        //判断username.value的长度
        if (cName.value.length < 4 || cName.value.length > 20) {
            show_validate_msg("#checkUsernameFalse", "error", "长度只能在4-20个字符之间");
            $("#cName").addClass("checkfalse");
            return false;
        } else {
            //判断用户名是否可用
            $.ajax({
                url: "${APP_PATH}/checkCnameAndCphoneExist?cData=" + cName.value,
                type: "GET",
                success: function (result) {
                    if (result.code === 100) {
                        if ($("#cName").hasClass("checkfalse")) {
                            $("#cName").removeClass("checkfalse");
                        }
                        show_validate_msg("#checkUsernameFalse", "success", "用户名可用");
                    } else {
                        $("#cName").addClass("checkfalse");
                        show_validate_msg("#checkUsernameFalse", "error", "用户名已存在，请输入其他");
                        return false;
                    }
                }
            });
        }
    }

    //检查邮箱的格式
    //onblur事件 判断邮箱的格式
    function check_cEmail_format() {
        if (cEmail.value.length === 0) {
            show_validate_msg("#checkEmailFalse", "", "请输入邮箱");
            if ($("#cEmail").hasClass("checkfalse")) {
                $("#cEmail").removeClass("checkfalse");
            }
            return false;
        }
        if (${sessionScope.customer.cEmail eq cEmail.value}) {
            show_validate_msg("#checkEmailFalse", "", "请输入邮箱");
            return false;
        }
        var reg_email = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        var reg_check = reg_email.test(cEmail.value);
        if (!reg_check) {
            show_validate_msg("#checkEmailFalse", "error", "格式错误，请输入正确的邮箱");
            $("#cEmail").addClass("checkfalse");
            return false;
        } else {
            if ($("#cEmail").hasClass("checkfalse")) {
                $("#cEmail").removeClass("checkfalse");
            }
            show_validate_msg("#checkEmailFalse", "success", "邮箱格式正确");
        }
    }

    //检查手机号的格式
    //onblur事件 判断手机号码格式
    function check_phone_format() {
        if (cPhone.value.length === 0) {
            show_validate_msg("#checkPhoneFalse", "", "请输入手机号");
            if ($("#cPhone").hasClass("checkfalse")) {
                $("#cPhone").removeClass("checkfalse");
            }
            return false;
        }
        if (cPhone.value === ${sessionScope.customer.cPhone}) {
            show_validate_msg("#checkPhoneFalse", "", "请输入手机号");
            return false;
        }
        var reg_phone = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
        var reg_check = reg_phone.test(cPhone.value);
        if (!reg_check) {
            show_validate_msg("#checkPhoneFalse", "error", "格式错误，请输入正确的手机号");
            $("#cPhone").addClass("checkfalse");
            return false;
        } else {
            //判断手机号是否可用
            $.ajax({
                url: "${APP_PATH}/checkCnameAndCphoneExist?cData=" + cPhone.value,
                type: "GET",
                success: function (result) {
                    if (result.code === 100) {
                        if ($("#cPhone").hasClass("checkfalse")) {
                            $("#cPhone").removeClass("checkfalse");
                        }
                        show_validate_msg("#checkPhoneFalse", "success", "手机号可用");
                    } else {
                        show_validate_msg("#checkPhoneFalse", "error", "手机号已存在，请登录");
                        $("#cPhone").addClass("checkfalse");
                        return false;
                    }
                }
            });
        }
    }

    //判断修改信息表单是否有空
    function update_cust_info_form_isEmpty() {
        if ($("#cName").val().length === 0) {
            show_validate_msg("#checkUsernameFalse", "error", "请输入用户名");
            return false;
        } else if ($("#cEmail").val().length === 0) {
            show_validate_msg("#checkEmailFalse", "error", "请输入邮箱");
            return false;
        } else if ($("#cPhone").val().length === 0) {
            show_validate_msg("#checkPhoneFalse", "error", "请输入手机号");
            return false;
        } else if ($("#demo").val().length === 0) {
            show_validate_msg("#checkBirthdayIsEmpty", "error", "请选择出生日期");
            return false;
        }
        return true;
    }

    //保存修改
    $("#update_cust_info_btn").click(function () {
        if (!update_cust_info_form_isEmpty()) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/updateCustomer/" + $("#cId").val(),
            type: "PUT",
            dataType: 'json',
            data: $("#update_cust_info_form").serialize(),
            success: function (result) {
                alert("修改成功");
                location.reload();
            },
            error: function () {
                alert("修改异常")
            }
        });
    });
</script>
<%--校验用户密码修改表单数据--%>
<script type="text/javascript">
    <%
        Customer customer = (Customer) session.getAttribute("customer");
    %>
    //判断旧密码是否正确
    function check_oldPwd() {
        if ($("#oldPwd").val().length === 0) {
            show_validate_msg("#checkoldPwdFalse", "", "请输入旧密码");
            return false;
        } else {
            var decoderPwd = window.btoa($("#oldPwd").val());
            var cust_pwd = '<%= customer.getcPassword()%>';
            console.log(cust_pwd);
            if (cust_pwd !== decoderPwd) {
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
            if ($("#newPwd").hasClass("checkfalse")) {
                $("#newPwd").removeClass("checkfalse");
            }
            show_validate_msg("#checkNewPwdFalse", "", "建议使用字母、数字和'_'两种及以上的组合，8-20个字符");
            return false;
        }
        //建议使用字母、数字和_两种及以上的组合，8-20个字符
        var reg_password = /^[0-9A-Za-z_]+$/;
        var reg_check = reg_password.test($("#newPwd").val());
        if (!reg_check) {
            show_validate_msg("#checkNewPwdFalse", "error", "格式错误,仅支持字母、数字和'_'两种及以上的组合");
            $("#newPwd").addClass("checkfalse");
        } else {
            if ($("#newPwd").hasClass("checkfalse")) {
                $("#newPwd").removeClass("checkfalse");
            }
            show_validate_msg("#checkNewPwdFalse", "", "建议使用字母、数字和'_'两种及以上的组合，8-20个字符");
        }
    }

    //onblur事件 判断密码长度
    function check_newPwd_length() {
        //判断密码格式是否正确
        if ($("#newPwd").hasClass("checkfalse")) {
            return false;
        }
        if ($("#newPwd").val().length === 0) {
            show_validate_msg("#checkNewPwdFalse", "", "建议使用字母、数字和'_'两种及以上的组合，8-20个字符");
            return false;
        }
        if ($("#newPwd").val().length < 8 || $("#newPwd").val().length > 20) {
            $("#newPwd").addClass("checkfalse");
            show_validate_msg("#checkNewPwdFalse", "error", "长度只能在8-20个字符之间");
            return false;
        } else {
            if ($("#newPwd").hasClass("checkfalse")) {
                $("#newPwd").removeClass("checkfalse");
            }
            if ($("#oldPwd").val() === $("#newPwd").val()) {
                show_validate_msg("#checkNewPwdFalse", "error", "不可以与旧密码相同");
                return false;
            }
            show_validate_msg("#checkNewPwdFalse", "success", "密码可用");
            if ($("#confirmPwd").val().length > 0) {
                if ($("#newPwd").val() !== $("#confirmPwd").val()) {
                    show_validate_msg("#checkconfirmPwdFalse", "error", "两次密码不一致，请再次输入密码");
                    $("#confirmPwd").addClass("checkfalse");
                    return false;
                }
            }
        }
    }

    //判断两次密码是否一致
    //onblur事件 判断两次密码是否一致
    function check_newPwd_isEqual() {
        if ($("#newPwd").hasClass("checkfalse")) {
            return false;
        }
        if ($("#confirmPwd").val().length === 0) {
            if ($("#confirmPwd").hasClass("checkfalse")) {
                $("#confirmPwd").removeClass("checkfalse");
            }
            show_validate_msg("#checkconfirmPwdFalse", "", "请再次输入密码");
            return false;
        }
        if ($("#confirmPwd").val() !== $("#newPwd").val()) {
            show_validate_msg("#checkconfirmPwdFalse", "error", "两次密码不一致，请再次输入密码");
            $("#confirmPwd").addClass("checkfalse");
            return false;
        } else {
            if ($("#confirmPwd").hasClass("checkfalse")) {
                $("#confirmPwd").removeClass("checkfalse");
            }
            show_validate_msg("#checkconfirmPwdFalse", "success", "密码验证成功");
        }
    }

    //判断修改信息表单是否有空
    function update_cust_pwd_form_isEmpty() {
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

    $("#update_cust_pwd_btn").click(function () {
        if (!update_cust_pwd_form_isEmpty()) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/updateCustPwd",
            type: "PUT",
            data: $("#update_cust_pwd_form").serialize(),
            success: function (result) {
                alert("修改成功");
                window.location.href = "${APP_PATH}/forwordPage?url=Login";
            },
            error: function () {
                alert("修改异常")
            }
        });
    });
</script>
<%--	用户头像修改--%>
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
        var cId = "${sessionScope.customer.cId}";
        formData.append("cId", cId);
        formData.append("pictureFile", $("#updatePicture").get(0).files[0]);
        $.ajax({
            url: "${APP_PATH}/updateCustomerImage",
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
