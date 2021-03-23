<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <%--    web路径
        不以/开头的相对路径，找资源，以当前资源的路径为基准，经常容易出问题
        以/开始的相对路径，找资源，以服务器的路径为标准（http://localhost:8080）;
            需要加上项目名
            http://localhost:8080/ssm-crud
    --%>
    <link type="text/css" rel="stylesheet" href="${APP_PATH }/css/style.css"/>

    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js"></script>


    <title>乐购-欢迎注册</title>
</head>
<body>
<!--Begin Header Begin-->
<div class="top_top">
    <div class="top_logo">
        <a href="${APP_PATH}/forwordPage?url=Index"><img src="${APP_PATH }/images/logo.png"/></a>
    </div>
    <div class="top_span">
        <span class="fl">欢迎注册</span>
    </div>
</div>
<!--End Header End-->
<div style="widows: 100%;height: 5px; background-color: #f2e9e0; "></div>
<!--Begin Regist Begin-->

<div class="regist">
    <div class="reg_c" style="background-color: white;">
        <form method="post" id="regist_form">
            <table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
                <tr height="40px" valign="top">
                    <td colspan="2">&nbsp;
                        <span class="fl" style="font-size:24px;padding: 0 20px">注册</span>
                        <span class="fr">已有商城账号，<a href="${APP_PATH}/forwordPage?url=Login"
                                                   style="color:#ff4e00;">我要登录</a></span>
                    </td>
                </tr>
                <tr height="60">
                    <td colspan="2">
                        <input type="text" value="" class="l_user" placeholder="用户名" style="font-size: 20px;"
                               id="cName" name="cName" onkeyup="check_cName_format()"
                               onblur="check_cName_lengthAndisExist()"/>
                    </td>
                </tr>
                <tr height="20px">
                    <td colspan="2" style="color: #CCCCCC;">
                        <span id="checkUsernameFalse">支持中文、英文、数字，4-20个字符</span>
                    </td>
                </tr>
                <tr height="60">
                    <td colspan="2">
                        <input type="password" value="" class="l_pwd" placeholder="密码" style="font-size: 20px;"
                               id="cPassword" name="cPassword" onkeyup="check_cPassword_format()"
                               onblur="check_cPassword_length()"/>
                    </td>
                </tr>
                <tr height="20px">
                    <td colspan="2" style="color: #CCCCCC;">
                        <span id="checkPasswordFalse">建议使用字母、数字和'_'、'-'两种及以上的组合，8-20个字符</span>
                    </td>
                </tr>
                <tr height="60">
                    <td colspan="2">
                        <input type="password" value="" class="l_pwd" placeholder="确认密码" style="font-size: 20px;"
                               id="confirmPassword" name="confirmPassword" onblur="doublePasswordIsEqual()"/>
                    </td>
                </tr>
                <tr height="20px">
                    <td colspan="2" style="color: #CCCCCC;">
                        <span id="checkDoublePassword">请再次输入密码</span>
                    </td>
                </tr>
                <tr height="60">
                    <td colspan="2">
                        <input type="text" value="" class="l_email" placeholder="邮箱" style="font-size: 20px;"
                               id="cEmail" name="cEmail" onblur="check_cEmail_format()"/>
                    </td>
                </tr>
                <tr height="20px">
                    <td colspan="2" style="color: #CCCCCC;">
                        <span id="checkEmailFalse">请输入正确格式的邮箱</span>
                    </td>
                </tr>
                <tr height="60">
                    <td colspan="2">
                        <input type="text" value="" class="l_tel" placeholder="手机号" style="font-size: 20px;"
                               id="cPhone" name="cPhone" onblur="check_phone_format()"/>
                    </td>
                </tr>
                <tr height="20px">
                    <td colspan="2" style="color: #CCCCCC;">
                        <span id="checkPhoneFalse">请输入11位手机号</span>
                    </td>
                </tr>
                <tr height="60px">
                    <td>
                        <input type="text" value="" class="l_ipt" id="identfyCode"
                               placeholder="验证码" name="identfyCode" style="font-size: 20px;" onblur="checkVerify()"/>
                    </td>
                    <td valign="center">
                        <img src="checkCode" alt="" title="看不清？点击更换" width="100px" height="52px" id="img"
                             style="padding-top:5px;cursor: pointer" onclick="reimg()">
                        <%--                  <input type="hidden" id="reCheckCode" name="reCheckCode" value="">--%>
                    </td>
                </tr>
                <tr height="20px">
                    <td colspan="2" style="color: #CCCCCC;">
                        <span id="checkResult">请输入验证码</span>
                    </td>
                </tr>
                <tr height="30px">
                    <td style="font-size:12px; padding-top:5px;padding-bottom: 10px" colspan="2">
            	<span style="font-family:'宋体'; font-size: 15px;" class="fl">
                	<label class="r_rad" id="r_rad">
                		<input type="checkbox" id="check_regist" value="0"/><span id="r_accept">我已阅读并接受《用户协议》</span>
                	</label>
                </span>
                    </td>
                </tr>
                <tr height="60px">
                    <td colspan="2">
                        <button class="reg_btn" type="button" id="regist" onclick="now_regist()">立即注册</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<!--End Login End-->
<!--Begin Footer Begin-->
<div class="btmbg">
    <div class="btm">
        <span width="98px" height="35px"><a href="#">关于我们</a></span> &nbsp;| &nbsp;
        <span width="98px" height="35px"><a href="#">联系我们</a></span> &nbsp;| &nbsp;
        <span width="98px" height="35px"><a href="#">友情链接</a></span> &nbsp;| &nbsp;
        <span width="98px" height="35px"><a href="#">帮助中心</a></span> &nbsp;<br/><br/>
        <span width="200px" height="40px">Copyright © 2019-2020 乐购版权所有</span>
    </div>
</div>
<!--End Footer End -->
<%--校验表单数据--%>
<script type="text/javascript">
    //获取表单各文本框
    var cName = document.getElementById("cName");
    var cPassword = document.getElementById("cPassword");
    var confirmPassword = document.getElementById("confirmPassword");
    var cEmail = document.getElementById("cEmail");
    var cPhone = document.getElementById("cPhone");
    var identfyCode = document.getElementById("identfyCode");

    //检查用户名格式、长度以及是否可用
    //onkeyup事件 校验用户名格式是否正确
    function check_cName_format() {
        if (cName.value.length === 0) {
            if ($("#cName").hasClass("checkfalse")) {
                $("#cName").removeClass("checkfalse");
            }
            show_validate_msg("#checkUsernameFalse", "#CCCCCC", "支持中文、英文、数字，4-20个字符");
            return false;
        }
        //支持中文、英文、数字，4-20个字符
        var reg_cName = /^[A-Za-z0-9\u4e00-\u9fa5]+$/;
        var reg_check = reg_cName.test(cName.value);
        if (!reg_check) {
            show_validate_msg("#checkUsernameFalse", "red", "格式错误,仅支持中文、英文、数字");
            $("#cName").addClass("checkfalse");
        } else {
            if ($("#cName").hasClass("checkfalse")) {
                $("#cName").removeClass("checkfalse");
            }
            show_validate_msg("#checkUsernameFalse", "#CCCCCC", "支持中文、英文、数字，4-20个字符");
        }
    }

    //onblur事件  检验用户名长度以及是否可用
    function check_cName_lengthAndisExist() {
        //判断用户名格式是否正确
        if ($("#cName").hasClass("checkfalse")) {
            return false;
        }
        if (cName.value.length === 0) {
            show_validate_msg("#checkUsernameFalse", "#CCCCCC", "支持中文、英文、数字，4-20个字符");
            return false;
        }
        if (/^\d+$/.test($("#cName").val())) {
            show_validate_msg("#checkUsernameFalse", "red", "用户名不能是纯数字,请重新输入！");
            $("#cName").addClass("checkfalse");
            return false;
        }
        //判断username.value的长度
        if (cName.value.length < 4 || cName.value.length > 20) {
            show_validate_msg("#checkUsernameFalse", "red", "长度只能在4-20个字符之间");
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
                        show_validate_msg("#checkUsernameFalse", "green", "用户名可用");
                    } else {
                        $("#cName").addClass("checkfalse");
                        show_validate_msg("#checkUsernameFalse", "red", "用户名已存在，请输入其他");
                        return false;
                    }
                }
            });
        }
    }

    //检查密码格式以及长度
    //onkeyup事件 校验密码格式是否正确
    function check_cPassword_format() {
        if (cPassword.value.length === 0) {
            if ($("#cPassword").hasClass("checkfalse")) {
                $("#cPassword").removeClass("checkfalse");
            }
            show_validate_msg("#checkPasswordFalse", "#CCCCCC", "建议使用字母、数字和'_'两种及以上的组合，8-20个字符");
            return false;
        }
        //建议使用字母、数字和_两种及以上的组合，8-20个字符
        var reg_password = /^[0-9A-Za-z_]+$/;
        var reg_check = reg_password.test(cPassword.value);
        if (!reg_check) {
            show_validate_msg("#checkPasswordFalse", "red", "格式错误,仅支持字母、数字和'_'两种及以上的组合");
            $("#cPassword").addClass("checkfalse");
        } else {
            if ($("#cPassword").hasClass("checkfalse")) {
                $("#cPassword").removeClass("checkfalse");
            }
            show_validate_msg("#checkPasswordFalse", "#CCCCCC", "建议使用字母、数字和'_'两种及以上的组合，8-20个字符");
        }
    }

    //onblur事件 判断密码长度
    function check_cPassword_length() {
        //判断密码格式是否正确
        if ($("#cPassword").hasClass("checkfalse")) {
            return false;
        }
        if (cPassword.value.length === 0) {
            show_validate_msg("#checkPasswordFalse", "#CCCCCC", "建议使用字母、数字和'_'两种及以上的组合，8-20个字符");
            return false;
        }
        if (cPassword.value.length < 8 || cPassword.value.length > 20) {
            $("#cPassword").addClass("checkfalse");
            show_validate_msg("#checkPasswordFalse", "red", "长度只能在8-20个字符之间");
            return false;
        } else {
            if ($("#cPassword").hasClass("checkfalse")) {
                $("#cPassword").removeClass("checkfalse");
            }
            show_validate_msg("#checkPasswordFalse", "green", "密码可用");
            if (confirmPassword.value.length > 0) {
                if (cPassword.value !== confirmPassword.value) {
                    show_validate_msg("#checkDoublePassword", "red", "两次密码不一致，请再次输入密码");
                    $("#confirmPassword").addClass("checkfalse");
                    return false;
                }
            }
        }
    }

    //判断两次密码是否一致
    //onblur事件 判断两次密码是否一致
    function doublePasswordIsEqual() {
        if ($("#cPassword").hasClass("checkfalse")) {
            return false;
        }
        if (confirmPassword.value.length === 0) {
            if ($("#confirmPassword").hasClass("checkfalse")) {
                $("#confirmPassword").removeClass("checkfalse");
            }
            show_validate_msg("#checkDoublePassword", "#CCCCCC", "请再次输入密码");
            return false;
        }
        if (confirmPassword.value !== cPassword.value) {
            show_validate_msg("#checkDoublePassword", "red", "两次密码不一致，请再次输入密码");
            $("#confirmPassword").addClass("checkfalse");
            return false;
        } else {
            if ($("#confirmPassword").hasClass("checkfalse")) {
                $("#confirmPassword").removeClass("checkfalse");
            }
            show_validate_msg("#checkDoublePassword", "green", "密码验证成功");
        }
    }

    //检查邮箱的格式
    //onblur事件 判断邮箱的格式
    function check_cEmail_format() {
        if (cEmail.value.length === 0) {
            show_validate_msg("#checkEmailFalse", "#CCCCCC", "请输入邮箱");
            if ($("#cEmail").hasClass("checkfalse")) {
                $("#cEmail").removeClass("checkfalse");
            }
            return false;
        }
        var reg_email = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        var reg_check = reg_email.test(cEmail.value);
        if (!reg_check) {
            show_validate_msg("#checkEmailFalse", "red", "格式错误，请输入正确的邮箱");
            $("#cEmail").addClass("checkfalse");
            return false;
        } else {
            if ($("#cEmail").hasClass("checkfalse")) {
                $("#cEmail").removeClass("checkfalse");
            }
            show_validate_msg("#checkEmailFalse", "green", "邮箱格式正确");
        }
    }

    //检查手机号的格式
    //onblur事件 判断手机号码格式
    function check_phone_format() {
        if (cPhone.value.length === 0) {
            show_validate_msg("#checkPhoneFalse", "#CCCCCC", "请输入手机号");
            if ($("#cPhone").hasClass("checkfalse")) {
                $("#cPhone").removeClass("checkfalse");
            }
            return false;
        }
        var reg_phone = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
        var reg_check = reg_phone.test(cPhone.value);
        if (!reg_check) {
            show_validate_msg("#checkPhoneFalse", "red", "格式错误，请输入正确的手机号");
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
                        show_validate_msg("#checkPhoneFalse", "green", "手机号可用");
                    } else {
                        show_validate_msg("#checkPhoneFalse", "red", "手机号已存在，请登录");
                        $("#cPhone").addClass("checkfalse");
                        return false;
                    }
                }
            });
        }
    }

    //校验验证码是否正确
    function checkVerify() {
        if (identfyCode.value.length === 0) {
            if ($("#identfyCode").hasClass("checkfalse")) {
                $("#identfyCode").removeClass("checkfalse");
            }
            show_validate_msg("#checkResult", "#CCCCCC", "请输入验证码");
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/checkVerify?verify=" + identfyCode.value,
            type: "GET",
            success: function (result) {
                if (result.code === 100) {
                    if ($("#identfyCode").hasClass("checkfalse")) {
                        $("#identfyCode").removeClass("checkfalse");
                    }
                    show_validate_msg("#checkResult", "green", "验证码正确");
                } else {
                    show_validate_msg("#checkResult", "red", "验证码错误，请再次输入");
                    $("#identfyCode").addClass("checkfalse");
                    return false;
                }
            }
        });
    }

    //判断checkBox是否被选中
    $("#check_regist").click(function () {
        if ($("#check_regist").prop("checked")) {
            $("#check_regist").prop("value", 1);
        } else {
            $("#check_regist").prop("value", 0);
        }
    });

    //判断注册表单是否有空
    function form_isEmpty() {
        if ($("#cName").val().length === 0) {
            show_validate_msg("#checkUsernameFalse", "red", "请输入用户名");
            return false;
        } else if ($("#cPassword").val().length === 0) {
            show_validate_msg("#checkPasswordFalse", "red", "请输入密码");
            return false;
        } else if ($("#confirmPassword").val().length === 0) {
            show_validate_msg("#checkDoublePassword", "red", "请输入密码");
            return false;
        } else if ($("#cEmail").val().length === 0) {
            show_validate_msg("#checkEmailFalse", "red", "请输入邮箱");
            return false;
        } else if ($("#cPhone").val().length === 0) {
            show_validate_msg("#checkPhoneFalse", "red", "请输入手机号");
            return false;
        } else if ($("#identfyCode").val().length === 0) {
            show_validate_msg("#checkResult", "red", "请输入验证码");
            return false;
        }
        return true;
    }

    //立即注册
    function now_regist() {
        if (!form_isEmpty()) {
            return false;
        }
        if ($("#check_regist").attr("value") != 0) {
            show_validate_msg("#r_accept", "#CCCCCC", "我已阅读并接受《用户协议》");
            $.ajax({
                url: "${APP_PATH}/saveCustomer",
                type: "POST",
                data: $("#regist_form").serialize(),
                success: function (result) {
                    if (result.code === 100) {
                        alert("注册成功");
                        // location.reload();
                        location.href = "${APP_PATH}/forwordPage?url=Login";
                    } else {
                        $("#cName").addClass("checkfalse");
                        if (result.extendInfo.cNameIsNum !== undefined) {
                            //用户名为纯数字，后台验证
                            show_validate_msg("#checkUsernameFalse", "red", result.extendInfo.cNameIsNum);
                        }
                        if (result.extendInfo.errorFields.cName !== undefined) {
                            //用户名信息有误
                            show_validate_msg("#checkUsernameFalse", "red", result.extendInfo.errorFields.cName);
                        }
                        if (result.extendInfo.errorFields.cPassword !== undefined) {
                            //密码信息有误
                            show_validate_msg("#checkPasswordFalse", "red", result.extendInfo.errorFields.cPassword);
                        }
                        if (result.extendInfo.errorFields.cEmail !== undefined) {
                            //邮箱信息有误
                            show_validate_msg("#checkEmailFalse", "red", result.extendInfo.errorFields.cEmail);
                        }
                        if (result.extendInfo.errorFields.cPhone !== undefined) {
                            //邮箱信息有误
                            show_validate_msg("#checkPhoneFalse", "red", result.extendInfo.errorFields.cPhone);
                        }
                    }
                },
                error: function () {
                    alert("注册异常")
                }
            });
        } else {
            show_validate_msg("#r_accept", "red", "我已阅读并接受《用户协议》");
            return false;
        }

    }
</script>

<script type="text/javascript">
    //切换图片验证码
    function reimg() {
        var img = document.getElementById("img");
        var n = String(Math.random()).substring(0, 5);
        img.src = "${APP_PATH}/checkCode?" + n;
    }

    //显示验证表单数据返回的信息
    function show_validate_msg(obj, Textcolor, validateMsg) {
        $(obj).css({"color": Textcolor});
        $(obj).text(validateMsg);
    }
</script>
</body>

</html>
