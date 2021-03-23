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
            http://localhost:8080/legou
            
    --%>

    <link type="text/css" rel="stylesheet" href="${APP_PATH }/css/style.css"/>
    <script type="text/javascript" src="${APP_PATH}/js/jquery-3.4.1.js"></script>
    <title>乐购-欢迎登陆</title>
</head>
<body onload="check_Input_NameOrPhone_Cookie()">

<!--Begin Header Begin-->
<div class="top_top">
    <div class="top_logo">
        <a href="${APP_PATH}/forwordPage?url=Index"><img src="${APP_PATH }/images/logo.png"/></a>
    </div>
    <div class="top_span">
        <span class="fl">欢迎登录</span>
    </div>
</div>
<!--End Header End-->

<!--Begin Login Begin-->
<div class="log_bg">
    <div class="login" id="login">
        <div class="log_img"><img src="${APP_PATH }/images/l_img.png" width="500" height="500"/></div>
        <div class="log_c">
            <form method="post" id="login_form">
                <table border="0" style="width:370px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
                    <tr height="50" valign="top">
                        <td width="30px">&nbsp;</td>
                        <td>
                            <span class="fl" style="font-size:24px;">登录</span>
                            <span class="fr">还没有商城账号，<a href="${APP_PATH}/forwordPage?url=Regist"
                                                        style="color:#ff4e00;">立即注册</a></span>
                        </td>
                    </tr>
                    <tr height="60">
                        <td colspan="2">
                            <input type="text" id="NameOrPhone" value="" class="log_user" name="NameOrPhone"
                                   placeholder=" 用户名/手机号" onblur="checkNameOrPhoneIsEmpty()"/>
                        </td>
                    </tr>
                    <tr height="20">
                        <td colspan="2">
                            <span id="NameOrPhone_isempty"></span>
                        </td>
                    </tr>
                    <tr height="60">
                        <td colspan="2">
                            <input type="password" value="" class="log_pwd" name="cPassword" id="cPassword"
                                   placeholder="密 码" onblur="checkPasswordIsEmpty()"/>
                        </td>
                    </tr>
                    <tr height="20">
                        <td colspan="2">
                            <span id="cPwd_isempty"></span>
                        </td>
                    </tr>
                    <tr height="35px">
                        <td style="font-size:12px; padding-top:10px;" colspan="2">
                        <span style="font-family:'宋体';" class="fl">
                            <label class="r_rad">
                        		<input type="checkbox" name="cStatus" value="1" id="status" checked/>请保存我这次的登录信息
                            </label>
                        </span>
                            <span class="fr"><a href="#" style="color:#ff4e00;">忘记密码</a></span>
                        </td>
                    </tr>
                    <tr height="60px">
                        <td colspan="2">
                            <button class="log_btn" id="log_btn" type="button" onclick="login()">登&nbsp;&nbsp;录</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<!--End Login End-->
<!--Begin Footer Begin-->
<jsp:include page="footer.jsp"></jsp:include>
<!--End Footer End -->
<script type="text/javascript">
    var nameOrPhone = document.getElementById("NameOrPhone");
    var pwd = document.getElementById("cPassword");

    //显示验证表单数据返回的信息
    function show_validate_msg(obj, Textcolor, validateMsg) {
        $(obj).css({"color": Textcolor});
        $(obj).text(validateMsg);
    }

    //判断登录表单内用户名和密码框内容是否为空
    function form_isEmpty() {
        if (nameOrPhone.value.length === 0) {
            show_validate_msg("#NameOrPhone_isempty", "red", "用户名为空");
            return false;
        } else if (pwd.value.length === 0) {
            show_validate_msg("#cPwd_isempty", "red", "密码为空");
            return false;
        }
        return true;
    }

    //onblur事件 ，判断用户名文本框不为空恢复默认样式
    function checkNameOrPhoneIsEmpty() {
        if (nameOrPhone.value.length > 0) {
            show_validate_msg("#NameOrPhone_isempty", "", "");
        }
    }

    //onblur事件 ，判断密码框不为空恢复默认样式
    function checkPasswordIsEmpty() {
        if (pwd.value.length > 0) {
            show_validate_msg("#cPwd_isempty", "", "");
        }
    }

    //判断checkBox是否被选中
    $("#status").click(function () {
        if ($("#status").prop("checked")) {
            $("#status").prop("value", 1);
        } else {
            $("#status").prop("value", 0);
        }
    });

    //验证登录
    function login() {
        if (!form_isEmpty()) {
            return false;
        }
        var loginTestDate = nameOrPhone.value + "-" + pwd.value + "-" + $("#status").prop("value");
        console.log(loginTestDate);
        $.ajax({
            url: "${APP_PATH}/checkUser?loginTestDate=" + loginTestDate,
            type: "POST",
            date: $("#login_form").serialize(),
            success: function (result) {
                if (result.code === 100) {
                    console.log(result.extendInfo);
                    //是否保存这次的登录信息
                    if (/^[0-9]+$/.test(nameOrPhone.value)) {
                        setCookie("nameOrPhone", result.extendInfo.customerInfo.cPhone, result.extendInfo.isRemember);
                    } else {
                        setCookie("nameOrPhone", result.extendInfo.customerInfo.cName, result.extendInfo.isRemember);
                    }
                    location.href = "${APP_PATH}/forwordPage?url=Index";
                } else {
                    show_validate_msg("#cPwd_isempty", "red", result.extendInfo.login_check)
                }
            },
            error: function () {
                alert("登录异常");
            }
        });
    }
</script>
<script type="text/javascript" language="JavaScript">
    //添加cookie
    function setCookie(cname, cvalue, boolean) {
        var d = new Date();
        d.setTime(d.getTime() + (24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toGMTString();
        if (boolean) {
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        } else {
            document.cookie = cname + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
        }
    }

    //获取cookie的值
    function getCookie(cname) {
        var name = cname + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var ca = decodedCookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) === ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) === 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }

    //使用cookie
    function check_Input_NameOrPhone_Cookie() {
        // var user = getCookie("nameOrPhone");
        if (getCookie("nameOrPhone") !== "") {
            $("#NameOrPhone").prop("value", getCookie("nameOrPhone"));
            console.log("加入到cookie中")
            // console.log(user);
            // alert(user);
        } else {
            $("#NameOrPhone").prop("value", "");
        }
    }
</script>
</body>
</html>
