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
<%-- 公告信息新增模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="create_notice_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">公告新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="create_notice_form">
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">公告详情</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="nContent" id="add_nContent"
                                      rows="5" placeholder="1~200个字符"
                                      onchange="check_nContent_length('#add_nContent')"></textarea>
                            <span id="check_add_nContent_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">公告日期</label>
                        <div class="col-md-10">
                            <div class="input-group">
                                <input class="laydate-icon form-control col-sm-10"
                                       id="add_nCreatetime" name="nCreatetime" value=""
                                       onclick="dateSelect('#add_nCreatetime')"/>
                                <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                     aria-hidden="true"></span></div>
                            </div>
                            <span id="check_add_nCreatetime_msg" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="addnotice_Btn">新增</button>
            </div>
        </div>
    </div>
</div>
<%-- 公告信息修改模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="update_notice_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">公告信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_notice_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">公告ID</label>
                        <div class="col-md-10">
                            <input class="form-control" disabled id="update_nId" name="nId" value=""/>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">公告详情</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="nContent" id="update_nContent"
                                      rows="5" placeholder="1~200个字符"
                                      onchange="check_nContent_length('#update_nContent')"></textarea>
                            <span id="check_update_nContent_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">公告日期</label>
                        <div class="col-md-10">
                            <div class="input-group">
                                <input class="laydate-icon form-control col-sm-10"
                                       id="update_nCreatetime" name="nCreatetime" value=""
                                       onclick="dateSelect('#update_nCreatetime')"/>
                                <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                     aria-hidden="true"></span></div>
                            </div>
                            <span id="check_update_nCreatetime_msg" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_notice_btn">保存修改</button>
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
                            <h3>公告管理</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-md-offset-10">
                            <button type="button" id="createnoticeBtn" class="btn btn-primary" style="width: 110px">新增
                            </button>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 30px;margin-left: 30px;">
                        <form class="form-inline" id="tiaojianSelectForm">
                            <div class="form-group">
                                <input type="text" class="form-control" name="nId" placeholder="按公告ID查询">&nbsp;&nbsp;
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="nContent" placeholder="按公告信息查询(模糊查询)">&nbsp;&nbsp;
                            </div>
                            <button type="button" class="btn btn-default" onclick="selectnoticeBytiaojian(1)">条件查询
                            </button>
                        </form>
                    </div>
                    <div class="row" style="margin-top: 30px;">
                        <table class="table table-hover" id="notice_table">
                            <thead>
                            <tr>
                                <td><input type="checkbox" id="check_all">全选</td>
                                <td>公告ID</td>
                                <td>公告内容</td>
                                <td>公告时间</td>
                                <td>发布人</td>
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
            url: "${APP_PATH}/getAllNotice",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result);
                //1.解析并显示地址数据
                build_notice_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    //1.解析并显示公告数据
    function build_notice_table(result) {
        //清空table tbody
        $("#notice_table tbody").empty();
        var noticeList = result.extendInfo.pageInfo.list;
        if (result.extendInfo.pageInfo.total > 0) {
            $.each(noticeList, function (index, item) {
                // alert(item.empName);
                var checkBoxTd = $("<td></td>").append("<input type='checkbox' class='check_item' />");
                var nIdTd = $("<td></td>").append(item.nId);
                var nContentTd = $("<td></td>").append(item.nContent);
                var nCreatetimeTd = $("<td></td>").append(timestampToTime(item.nCreatetime));
                var adminNameTd = $("<td></td>").append(item.administrator.adminName);

                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除");
                //为删除按钮添加一个自定义的属性，来表示当前公告id
                delBtn.attr("delete-id", item.nId);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" 编辑");
                //为编辑按钮添加一个自定义的属性，来表示当前地址id
                editBtn.attr("edit-id", item.nId);

                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                //apend()方法执行完成以后还是返回原来的元素
                $("<tr></tr>").append(checkBoxTd)
                    .append(nIdTd)
                    .append(nContentTd)
                    .append(nCreatetimeTd)
                    .append(adminNameTd)
                    .append(btnTd)
                    .appendTo("#notice_table tbody");
            });
        } else {
            $("<tr></tr>").append($("<td colspan='6'></td>").append("未查询到公告数据"))
                .appendTo("#notice_table tbody");
        }

    }

    //2.解析并显示分页信息
    function build_page_info(result) {
        //清空分页信息
        $("#page_info_area").empty();
        $("#page_info_area").append($("<button id='delete_checkednotice_btn'></button>").addClass("btn btn-danger btn-sm")
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
            selectnoticeBytiaojian(1);
        });
        prePageLi.click(function () {
            selectnoticeBytiaojian(result.extendInfo.pageInfo.pageNum - 1);
        });
        nextPageLi.click(function () {
            selectnoticeBytiaojian(result.extendInfo.pageInfo.pageNum + 1);
        });
        lastPageLi.click(function () {
            selectnoticeBytiaojian(result.extendInfo.pageInfo.pages);
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
                selectnoticeBytiaojian(item);
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
     * 条件查询公告
     */
    //获取条件查询的数据
    function selectnoticeBytiaojian(pn) {
        $.ajax({
            url: "${APP_PATH}/selectNoticeBytiaojian",
            type: "GET",
            data: $("#tiaojianSelectForm").serialize() + "&pn=" + pn,
            success: function (result) {
                console.log(result);
                //1.解析并显示地址数据
                build_notice_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析并显示分页条
                build_page_nav_condition(result);
            }
        });
    }

    /**
     * 修改或新增时的字段信息校验
     */

    //检查公告详情的长度
    function check_nContent_length(obj) {
        var nContent = $(obj).val();
        // console.log(nContent);
        if (nContent.length === 0) {
            show_validate_msg("#check_add_nContent_msg", "", "");
            show_validate_msg("#check_update_nContent_msg", "", "");
            return false;
        }
        if (nContent.length > 200) {
            show_validate_msg("#check_add_nContent_msg", "error", "字数过多或过少");
            show_validate_msg("#check_update_nContent_msg", "error", "字数过多或过少");
            return false;
        } else {
            show_validate_msg("#check_add_nContent_msg", "", "");
            show_validate_msg("#check_update_nContent_msg", "", "");
        }
    }

    /**
     * 更改
     */
    $(document).on("click", ".edit_btn", function () {
        getnoticeByNid($(this).attr("edit-id"));
        $("#update_notice_Modal").modal({
            backdrop: "static"
        });
        $("#update_notice_form")[0].reset();
        $("#update_notice_btn").attr("update-aid", $(this).attr("edit-id"));
        $("#update_nId").prop("value", $(this).attr("edit-id")).attr("nId", $(this).attr("edit-id"));
    });

    //通过公告id获取公告信息并显示在表单中
    function getnoticeByNid(nId) {
        $.ajax({
            url: "${APP_PATH}/getNoticeByNid/" + nId,
            type: "GET",
            success: function (result) {
                console.log(result);
                var notice = result.extendInfo.notice;
                $("#update_nContent").text(notice.nContent);
                $("#update_nCreatetime").prop("value", timestampToTime(notice.nCreatetime));
            },
        });
    }

    //检查公告新增表单是否有空以及判断是否有验证错误的表单数据
    function updatenoticeFormIsEmpty() {

        //判断是否有咽炎错误的表单数据
        if ($("#update_notice_form").find("div.has-error").length > 0) {
            return false;
        }

        if ($("#update_nContent").val().length === 0) {
            show_validate_msg("#check_update_nContent_msg", "error", "公告详情为空");
            return false;
        } else if ($("#update_nCreatetime").val().length === 0) {
            show_validate_msg("#check_update_nCreatetime_msg", "error", "公告时间为空");
        }
        return true;
    }

    //点击保存修改，公告更新，关闭模态框，到当前页
    $("#update_notice_btn").click(function () {
        if (!updatenoticeFormIsEmpty()) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/updateNotice",
            method: "PUT",
            data: $("#update_notice_form").serialize() + "&nId=" + $("#update_nId").attr("nId"),
            success: function (result) {
                $("#update_notice_Modal").modal("hide");
                to_page(currentPae);
            }
        });
    });

    /**
     * 新增
     */
    //清空新增表单并打开新增模态框
    $("#createnoticeBtn").click(function () {
        $("#create_notice_form")[0].reset();
        //清除残留样式
        show_validate_msg("#check_add_nContent_msg", "", "");
        $("#create_notice_Modal").modal({
            backdrop: "static"
        });
    });

    //检查公告新增表单是否有空以及判断是否有验证错误的表单数据
    function addnoticeFormIsEmpty() {

        //判断是否有咽炎错误的表单数据
        if ($("#create_notice_form").find("div.has-error").length > 0) {
            return false;
        }

        if ($("#add_nContent").val().length === 0) {
            show_validate_msg("#check_add_nContent_msg", "error", "公告详情为空");
            return false;
        }
        return true;
    }

    //提交表单数据
    $("#addnotice_Btn").click(function () {
        if (!addnoticeFormIsEmpty()) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/addNotice",
            method: "POST",
            data: $("#create_notice_form").serialize(),
            success: function (result) {
                $("#create_notice_Modal").modal("hide");
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
        deletenotice($(this).attr("delete-id"));
    });

    //删除对应的地址信息
    function deletenotice(nId) {
        if (confirm("确认删除吗？")) {
            $.ajax({
                url: "${APP_PATH}/deleteNotice/" + nId,
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
    $(document).on("click", "#delete_checkednotice_btn", function () {
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
                    url: "${APP_PATH}/deleteNotice/" + del_idstr,
                    type: "DELETE",
                    success: function (result) {
                        $("#check_all").prop("checked", false);
                        to_page(currentPae);
                    }
                });
            }
        }
    });


</script>
</html>
