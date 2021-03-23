<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>乐购-后台登录</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${APP_PATH }/css/bootstrap-theme.min.css"/>
    <script src="${APP_PATH }/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <h3>乐购后台-登录</h3>
        </div>
    </div>
    <div class="row" style="margin-top: 50px;">
        <div class="panel panel-default">
            <div class="panel-body" style="background-color: #f2f2f2;height: 500px;">
                <div style="width: 500px;margin: auto;margin-top: 100px;">
                    <form>
                        <div class="form-group">
                            <label>用户名</label>
                            <div class="input-group input-group-lg">
                                <input type="text" class="form-control" id="admin_name" placeholder="用户名"
                                       aria-describedby="sizing-addon1">
                                <div class="input-group-addon">
                                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                </div>
                            </div>
                            <span id="checkAdminName" class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label>密&nbsp;&nbsp;码</label>
                            <div class="input-group input-group-lg">
                                <input type="password" id="admin_password" class="form-control" placeholder="密码"
                                       aria-describedby="sizing-addon1">
                                <div class="input-group-addon" onclick="passwordIsDisplay()" style="cursor: pointer"
                                     title="点击可查看密码">
                                    <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                                </div>
                            </div>
                            <span id="checkAdminPassword" class="help-block"></span>
                        </div>
                        <button type="button" class="btn btn-danger"
                                style="width: 500px;height: 45px;font-size: 25px;line-height: 36px;"
                                onclick="adminLogin()">登&nbsp;&nbsp;录
                        </button>
                        <a role="button" class="btn btn-link" href="${APP_PATH}/forwordPage?url=Login">返回前台登录</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${APP_PATH }/js/bootstrap.min.js"></script>
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

    //设置密码是否显示
    function passwordIsDisplay() {
        if ($("#admin_password").prop("type") === "password") {
            $("#admin_password").next("div").find("span").removeClass("glyphicon-eye-close");
            $("#admin_password").next("div").find("span").addClass("glyphicon-eye-open");
            $("#admin_password").prop("type", "text");
        } else {
            $("#admin_password").next("div").find("span").removeClass("glyphicon-eye-open");
            $("#admin_password").next("div").find("span").addClass("glyphicon-eye-close");
            $("#admin_password").prop("type", "password");
        }
    }

    //判断管理员登录表单是否有空
    function adminLoginFormIsEmpty() {
        if ($("#admin_name").val().length < 1) {
            show_validate_msg("#checkAdminName", "error", "用户名为空");
            return false;
        }
        if ($("#admin_password").val().length < 1) {
            show_validate_msg("#checkAdminName", "", "");
            show_validate_msg("#checkAdminPassword", "error", "密码为空");
            return false;
        }
        return true;
    }

    //验证登录
    function adminLogin() {
        if (!adminLoginFormIsEmpty()) {
            console.log("有空");
            return false;
        }
        var adminLoginInfo = $("#admin_name").val() + "-" + $("#admin_password").val();
        $.ajax({
            url: "${APP_PATH}/adminLogin?adminLoginInfo=" + adminLoginInfo,
            type: "GET",
            success: function (result) {
                if (result.code === 100) {
                    location.href = "${APP_PATH}/forwordPage?url=endIndex";
                } else {
                    show_validate_msg("#checkAdminName", "error", result.extendInfo.checkLogin);
                }
            }
        });
    }
</script>
</html>
