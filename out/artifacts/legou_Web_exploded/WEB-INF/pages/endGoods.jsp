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
<%-- 商品信息新增模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="create_goods_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">商品新增</h4>
            </div>
            <div class="modal-body" style="min-height: 450px;">
                <form class="form-horizontal" id="create_goods_form" method="post" enctype="multipart/form-data">
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">选择图片</label>
                        <div class="col-sm-10">
                            <input type="file" onchange="check_picture_ext('#pictureFile')" name="pictureFile"
                                   id="pictureFile" value=""/>
                            <span id="check_pictureFormat" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">预览图</label>
                        <div class="col-sm-10">
                            <img src="" alt="" style="width: 125px;" id="pictureShow" class="img-thumbnail">
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">商品详情</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="gDetailinfo" id="add_gDetailinfo"
                                      rows="3" placeholder="1~200个字符"
                                      onchange="check_gDetailinfo_length('#add_gDetailinfo')"></textarea>
                            <span id="check_add_gDetailinfo_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">单价</label>
                        <div class="col-sm-10">
                            <input type="text" placeholder="保留两位有效数字" class="form-control"
                                   name="gPrice" id="add_gPrice" onchange="check_gPrice_format('#add_gPrice')">
                            <span id="check_add_gPrice_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-5 col-md-offset-2">
                            <div class="input-group">
                                <input class="laydate-icon form-control col-sm-10" placeholder="生产日期"
                                       id="add_gCreattime" name="gCreattime" value=""
                                       onclick="dateSelect('#add_gCreattime')"/>
                                <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                     aria-hidden="true"></span></div>
                            </div>
                            <span id="check_add_gCreattime_msg" class="help-block"></span>
                        </div>
                        <div class="col-md-5">
                            <div class="input-group">
                                <input class="laydate-icon form-control" placeholder="有效期"
                                       id="add_gEndtime" name="gEndtime" value=""
                                       onclick="dateSelect('#add_gEndtime')"/>
                                <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                     aria-hidden="true"></span></div>
                            </div>
                            <span id="check_add_gEndtime_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">库存</label>
                        <div class="col-sm-10">
                            <input type="text" placeholder="正整数" class="form-control"
                                   onchange="check_gNum_format('#add_gNum')" name="gNum" id="add_gNum">
                            <span id="check_add_gNum_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">商品分类</label>
                        <div class="col-sm-10">
                            <div class="col-md-4">
                                <select class="form-control" name="gftId" id="addgoodsFirstTypes"
                                        onmouseover="getGoodsFirstType('#addgoodsFirstTypes')"
                                        onchange="goodsFirstTypesOnchange('#addgoodsSecondTypes','#addgoodsThreeTypes')">
                                    <option hidden value="">一级分类</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <select class="form-control" name="gstId" id="addgoodsSecondTypes"
                                        onmouseover="getGoodsSecondTypes('#addgoodsFirstTypes','#addgoodsSecondTypes')"
                                        onchange="goodsSecondTypesOnchange('#addgoodsThreeTypes')">
                                    <option hidden value="">二级分类</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <select class="form-control" name="gtId" id="addgoodsThreeTypes"
                                        onmouseover="getGoodsThreeTypes('#addgoodsSecondTypes','#addgoodsThreeTypes')">
                                    <option hidden value="">三级分类</option>
                                </select>
                            </div>
                            <span class="help-block" id="check_goodsType_msg"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="addGoods_Btn">新增</button>
            </div>
        </div>
    </div>
</div>
<%-- 商品信息修改模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="update_goods_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="gridSystemModalLabel">商品信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_goods_form" method="post" enctype="multipart/form-data">
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">商品ID</label>
                        <div class="col-sm-10">
                            <input type="text" disabled class="form-control" id="updateGid" name="gId">
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">预览图</label>
                        <div class="col-sm-5">
                            <img src="" alt="" style="width: 125px;" id="updatepictureShow" class="img-thumbnail">
                        </div>
                        <div class="col-sm-5">
                            更换图片：<input type="file" class="form-control" id="updatePicture" name="updatePicture"
                                        onchange="check_picture_ext('#updatePicture')">
                            <span class="help-block" id="check_update_picture_msg"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 20px">
                        <label class="col-sm-2 control-label">商品详情</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="update_gDetailinfo" name="gDetailinfo"
                                      onchange="check_gDetailinfo_length('#update_gDetailinfo')" rows="3"></textarea>
                            <span class="help-block" id="check_update_gDetailinfo_msg"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">单价</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"
                                   name="gPrice" id="update_gPrice" onchange="check_gPrice_format('#update_gPrice')">
                            <span id="check_update_gPrice_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-5 col-md-offset-2">
                            <div class="input-group">
                                <input class="laydate-icon form-control col-sm-10" placeholder="生产日期"
                                       id="update_gCreattime" name="gCreattime" value=""
                                       onclick="dateSelect('#update_gCreattime')"/>
                                <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                     aria-hidden="true"></span></div>
                            </div>
                            <span id="check_update_gCreattime_msg" class="help-block"></span>
                        </div>
                        <div class="col-md-5">
                            <div class="input-group">
                                <input class="laydate-icon form-control" placeholder="有效期"
                                       id="update_gEndtime" name="gEndtime" value=""
                                       onclick="dateSelect('#update_gEndtime')"/>
                                <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                     aria-hidden="true"></span></div>
                            </div>
                            <span id="check_update_gEndtime_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">库存</label>
                        <div class="col-sm-10">
                            <input type="text" placeholder="正整数" class="form-control"
                                   onchange="check_gNum_format('#update_gNum')" name="gNum" id="update_gNum">
                            <span id="check_update_gNum_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px">
                        <label class="col-sm-2 control-label">商品分类</label>
                        <div class="col-sm-10">
                            <div class="col-md-4">
                                <select class="form-control" name="gftId" id="updategoodsFirstTypes"
                                        onmouseover="getGoodsFirstType('#updategoodsFirstTypes')"
                                        onchange="goodsFirstTypesOnchange('#updategoodsSecondTypes','#updategoodsThreeTypes')">
                                    <option id="defaultFirstType" hidden value="">一级分类</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <select class="form-control" name="gstId" id="updategoodsSecondTypes"
                                        onmouseover="getGoodsSecondTypes('#updategoodsFirstTypes','#updategoodsSecondTypes')"
                                        onchange="goodsSecondTypesOnchange('#updategoodsThreeTypes')">
                                    <option id="defaultSecondType" hidden value="">二级分类</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <select class="form-control" name="gtId" id="updategoodsThreeTypes"
                                        onmouseover="getGoodsThreeTypes('#updategoodsSecondTypes','#updategoodsThreeTypes')">
                                    <option id="defaultThreeType" hidden value="">三级分类</option>
                                </select>
                            </div>
                            <span class="help-block" id="check_update_goodsType_msg"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_goods_btn">保存修改</button>
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
                            <h3>商品管理</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-md-offset-10">
                            <button type="button" id="createGoodsBtn" class="btn btn-primary" style="width: 110px">新增
                            </button>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 30px;margin-left: 30px;">
                        <form class="form-inline" id="tiaojianSelectForm">
                            <div class="form-group">
                                <input type="text" class="form-control" name="gId" placeholder="按商品ID查询">&nbsp;&nbsp;
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="gDetailinfo" placeholder="按商品信息查询(模糊查询)">&nbsp;&nbsp;
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="gftId" id="goodsFirstTypes_select"
                                        onmouseover="getGoodsFirstType('#goodsFirstTypes_select')"
                                        onchange="goodsFirstTypesOnchange('#goodsSecondTypes_select','#goodsThreeTypes_select')">
                                    <option hidden value="">一级分类</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="gstId" id="goodsSecondTypes_select"
                                        onmouseover="getGoodsSecondTypes('#goodsFirstTypes_select','#goodsSecondTypes_select')"
                                        onchange="goodsSecondTypesOnchange('#goodsThreeTypes_select')">
                                    <option hidden value="">二级分类</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="gtId" id="goodsThreeTypes_select"
                                        onmouseover="getGoodsThreeTypes('#goodsSecondTypes_select','#goodsThreeTypes_select')">
                                    <option hidden value="">三级分类</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="orderBygEndtime" id="orderBygEndtime_select">
                                    <option hidden value="">按有效期排序</option>
                                    <option value="1">升序</option>
                                    <option value="0">降序</option>
                                </select>
                            </div>
                            <button type="button" class="btn btn-default" onclick="selectGoodsBytiaojian(1)">条件查询
                            </button>
                        </form>
                    </div>
                    <div class="row" style="margin-top: 30px;">
                        <table class="table table-hover" id="goods_table">
                            <thead>
                            <tr>
                                <td><input type="checkbox" id="check_all">全选</td>
                                <td>商品ID</td>
                                <td>商品展示图</td>
                                <td>商品详情</td>
                                <td>单价</td>
                                <td>生产日期</td>
                                <td>有效日期</td>
                                <td>库存量</td>
                                <td>一级分类</td>
                                <td>二级分类</td>
                                <td>三级分类</td>
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
            url: "${APP_PATH}/getAllGoods",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result);
                //1.解析并显示地址数据
                build_goods_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    //1.解析并显示商品数据
    function build_goods_table(result) {
        //清空table tbody
        $("#goods_table tbody").empty();
        var goodsList = result.extendInfo.pageInfo.list;
        if (result.extendInfo.pageInfo.total > 0) {
            $.each(goodsList, function (index, item) {
                // alert(item.empName);
                var checkBoxTd = $("<td></td>").append("<input type='checkbox' class='check_item' />");
                var gIdTd = $("<td></td>").append(item.gId);
                var gImageTd = $("<td></td>").append($("<img width='80px' height = '80px'>").prop("src", "${APP_PATH}" + item.gImage));
                var gDetailinfoTd = $("<td style='width: 215px'></td>").append(item.gDetailinfo);
                var gPriceTd = $("<td></td>").append(item.gPrice.toFixed(2));
                var gCreattimeTd = $("<td></td>").append(timestampToTime(item.gCreattime));
                var gEndtimeTd;
                if ((new Date()).valueOf() > item.gEndtime) {
                    gEndtimeTd = $("<td></td>").append("已过有效期");
                } else {
                    gEndtimeTd = $("<td></td>").append(timestampToTime(item.gEndtime));
                }
                var gNumTd = $("<td></td>").append(item.gNum);
                var firstTypeTd = $("<td></td>").append(item.goodsFirstType.gftName);
                var secondTypeTd = $("<td></td>").append(item.goodsSecondType.gstName);
                var threeTypeTd = $("<td></td>").append(item.goodsThreeType.gtName);

                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除");
                //为删除按钮添加一个自定义的属性，来表示当前商品id
                delBtn.attr("delete-id", item.gId);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" 编辑");
                //为编辑按钮添加一个自定义的属性，来表示当前地址id
                editBtn.attr("edit-id", item.gId);

                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                //apend()方法执行完成以后还是返回原来的元素
                $("<tr></tr>").append(checkBoxTd)
                    .append(gIdTd)
                    .append(gImageTd)
                    .append(gDetailinfoTd)
                    .append(gPriceTd)
                    .append(gCreattimeTd)
                    .append(gEndtimeTd)
                    .append(gNumTd)
                    .append(firstTypeTd)
                    .append(secondTypeTd)
                    .append(threeTypeTd)
                    .append(btnTd)
                    .appendTo("#goods_table tbody");
            });
        } else {
            $("<tr></tr>").append($("<td colspan='8'></td>").append("未查询到商品数据"))
                .appendTo("#goods_table tbody");
        }

    }

    //2.解析并显示分页信息
    function build_page_info(result) {
        //清空分页信息
        $("#page_info_area").empty();
        $("#page_info_area").append($("<button id='delete_checkedGoods_btn'></button>").addClass("btn btn-danger btn-sm")
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
            selectGoodsBytiaojian(1);
        });
        prePageLi.click(function () {
            selectGoodsBytiaojian(result.extendInfo.pageInfo.pageNum - 1);
        });
        nextPageLi.click(function () {
            selectGoodsBytiaojian(result.extendInfo.pageInfo.pageNum + 1);
        });
        lastPageLi.click(function () {
            selectGoodsBytiaojian(result.extendInfo.pageInfo.pages);
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
                selectGoodsBytiaojian(item);
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
     * 条件查询商品
     */
    //构建商品分类下拉列表
    function build_goodsTypeSelect(typeInfo, obj) {
        $(obj).find("option.new_option").remove();
        if (typeInfo !== undefined) {
            $.each(typeInfo, function (index, item) {
                if (item.gftId !== undefined && item.gstId === undefined) {
                    $("<option></option>").prop("value", item.gftId).addClass("first_option").addClass("new_option")
                        .text(item.gftName).appendTo(obj);
                }
                if (item.gstId !== undefined && item.gtId === undefined) {
                    $("<option></option>").prop("value", item.gstId).addClass("second_option").addClass("new_option")
                        .text(item.gstName).appendTo(obj);
                }
                if (item.gtId !== undefined && item.gstId !== undefined && item.gftId !== undefined) {
                    $("<option></option>").prop("value", item.gtId).addClass("three_option").addClass("new_option")
                        .text(item.gtName).appendTo(obj);
                }
            });
        }
    }

    //获取 一级分类数据
    function getGoodsFirstType(obj1) {
        var flag = $(obj1).hasClass("select_open");
        if (!flag) {
            $.ajax({
                url: "${APP_PATH}/getGoodsFirstType",
                type: "GET",
                success: function (result) {
                    //构建商品分类下拉列表
                    build_goodsTypeSelect(result.extendInfo.goodsFirstTypes, obj1);
                    $(obj1).addClass("select_open");
                }
            });
        } else {
            return false;
        }
    }

    //当一级分类改变时清除二级、三级分类的选项
    function goodsFirstTypesOnchange(obj2, obj3) {
        $("#defaultSecondType").prop("value", "").text("二级分类");
        $("#defaultThreeType").prop("value", "").text("三级分类");
        $(obj2).find("option.second_option").remove();
        $(obj3).find("option.three_option").remove();
    }

    //获取 对应 二级分类数据
    function getGoodsSecondTypes(obj1, obj2) {
        var gstId = $(obj2).val();
        if (gstId != null && gstId !== "") {
            return false;
        } else {
            $(obj2).find("option.second_option").remove();
        }
        var gftId = $(obj1).val();
        if (gftId != null && gftId !== "") {
            // alert(gftId);
            $.ajax({
                url: "${APP_PATH}/getGoodsSecondTypesBygftId",
                type: "GET",
                data: "gftId=" + gftId,
                success: function (result) {
                    // console.log(result.extendInfo.goodsSecondTypesBygftId);
                    //构建商品分类下拉列表
                    build_goodsTypeSelect(result.extendInfo.goodsSecondTypesBygftId, obj2);
                }
            });
        }
    }

    //当二级分类改变时清除三级分类的选项
    function goodsSecondTypesOnchange(obj3) {
        $("#defaultThreeType").prop("value", "").text("三级分类");
        $(obj3).find("option.three_option").remove();
    }

    //获取 对应 三级分类数据
    function getGoodsThreeTypes(obj2, obj3) {
        var gtId = $(obj3).val();
        if (gtId != null && gtId !== "") {
            return false;
        } else {
            $(obj3).find("option.three_option").remove();
        }
        var gstId = $(obj2).val();
        if (gstId != null && gstId !== "") {
            $.ajax({
                url: "${APP_PATH}/getGoodsThreeTypesBygstId",
                type: "GET",
                data: "gstId=" + gstId,
                success: function (result) {
                    // console.log(result.extendInfo.goodsSecondTypesBygstId);
                    //构建商品分类下拉列表
                    build_goodsTypeSelect(result.extendInfo.goodsSecondTypesBygstId, obj3);
                }
            });
        }
    }

    //获取条件查询的数据
    function selectGoodsBytiaojian(pn) {
        $.ajax({
            url: "${APP_PATH}/selectGoodsBytiaojian",
            type: "GET",
            data: $("#tiaojianSelectForm").serialize() + "&pn=" + pn,
            success: function (result) {
                console.log(result);
                //1.解析并显示地址数据
                build_goods_table(result);
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
                show_validate_msg("#check_pictureFormat", "", "只能是jpg、gif、bmp、png、jpeg、png类型！");
                show_validate_msg("#check_update_picture_msg", "", "只能是jpg、gif、bmp、png、jpeg、png类型！");
                return true;
            }
        }
        //如果不存在返回 false
        show_validate_msg("#check_pictureFormat", "error", "文件类型不合法,只能是jpg、gif、bmp、png、jpeg、png类型！");
        show_validate_msg("#check_update_picture_msg", "error", "文件类型不合法,只能是jpg、gif、bmp、png、jpeg、png类型！");
        return false;
    }

    //检查商品详情的长度
    function check_gDetailinfo_length(obj) {
        var gDetailinfo = $(obj).val();
        // console.log(gDetailinfo);
        if (gDetailinfo.length === 0) {
            show_validate_msg("#check_add_gDetailinfo_msg", "", "");
            show_validate_msg("#check_update_gDetailinfo_msg", "", "");
            return false;
        }
        if (gDetailinfo.length > 200) {
            show_validate_msg("#check_add_gDetailinfo_msg", "error", "字数过多或过少");
            show_validate_msg("#check_update_gDetailinfo_msg", "error", "字数过多或过少");
            return false;
        } else {
            show_validate_msg("#check_add_gDetailinfo_msg", "", "");
            show_validate_msg("#check_update_gDetailinfo_msg", "", "");
        }
    }

    //检查商品单价的格式
    function check_gPrice_format(obj) {
        var gPrice = $(obj).val().toString();
        var reg = /^([1-9]+|0)((\.)([0-9]{1,2}))?$/;
        if (gPrice.length === 0) {
            show_validate_msg("#check_add_gPrice_msg", "", "");
            show_validate_msg("#check_update_gPrice_msg", "", "");
            return false;
        }
        var flag = reg.test(gPrice);
        if (!flag) {
            show_validate_msg("#check_add_gPrice_msg", "error", "请保留两位有效数字");
            show_validate_msg("#check_update_gPrice_msg", "error", "请保留两位有效数字");
            return false;
        } else {
            if (parseFloat(gPrice) === 0) {
                show_validate_msg("#check_add_gPrice_msg", "error", "请输入大于0的数");
                show_validate_msg("#check_update_gPrice_msg", "error", "请输入大于0的数");
                return false;
            }
            show_validate_msg("#check_add_gPrice_msg", "", "");
            show_validate_msg("#check_update_gPrice_msg", "", "");
        }
    }

    //检查库存的格式
    function check_gNum_format(obj) {
        var gNum = $(obj).val().toString();
        var reg = /^[1-9]\d*$/;
        if (gNum.length === 0) {
            show_validate_msg("#check_add_gNum_msg", "", "");
            show_validate_msg("#check_update_gNum_msg", "", "");
            return false;
        }
        var flag = reg.test(gNum);
        if (!flag) {
            show_validate_msg("#check_add_gNum_msg", "error", "请输入正整数");
            show_validate_msg("#check_update_gNum_msg", "error", "请输入正整数");
            return false;
        } else {
            show_validate_msg("#check_add_gNum_msg", "", "");
            show_validate_msg("#check_update_gNum_msg", "", "");
        }
    }

    /**
     * 更改
     */
    $(document).on("click", ".edit_btn", function () {
        getGoodsByGid($(this).attr("edit-id"));
        $("#update_goods_Modal").modal({
            backdrop: "static"
        });
        $("#update_goods_form")[0].reset();
        $("#update_goods_btn").attr("update-aid", $(this).attr("edit-id"));
        $("#updateGid").prop("value", $(this).attr("edit-id")).attr("gId", $(this).attr("edit-id"));
    });

    //通过商品id获取商品信息并显示在表单中
    function getGoodsByGid(gId) {
        $.ajax({
            url: "${APP_PATH}/getGoodsWithTypeByGid?gid=" + gId,
            type: "GET",
            success: function (result) {
                console.log(result);
                var goods = result.extendInfo.goods;
                $("#updatepictureShow").prop("src", "${APP_PATH}" + goods.gImage);
                $("#update_gDetailinfo").text(goods.gDetailinfo);
                $("#update_gPrice").prop("value", goods.gPrice);
                $("#update_gCreattime").prop("value", timestampToTime(goods.gCreattime));
                $("#update_gEndtime").prop("value", timestampToTime(goods.gEndtime));
                $("#update_gNum").prop("value", goods.gNum);
                $("#defaultFirstType").prop("value", goods.gftId).text(goods.goodsFirstType.gftName);
                getGoodsSecondTypes('#updategoodsFirstTypes', '#updategoodsSecondTypes');
                $("#defaultSecondType").prop("value", goods.gstId).text(goods.goodsSecondType.gstName);
                getGoodsThreeTypes('#updategoodsSecondTypes', '#updategoodsThreeTypes');
                $("#defaultThreeType").prop("value", goods.gtId).text(goods.goodsThreeType.gtName);
            },
        });
    }

    //展示预览图
    $("#updatePicture").change(function () {
        var url = getObjectURL(this.files[0]);
        $("#updatepictureShow").prop("src", url);
    });

    //检查商品新增表单是否有空以及判断是否有验证错误的表单数据
    function updateGoodsFormIsEmpty() {

        //判断是否有咽炎错误的表单数据
        if ($("#update_goods_form").find("div.has-error").length > 0) {
            return false;
        }

        if ($("#update_gDetailinfo").val().length === 0) {
            show_validate_msg("#check_update_gDetailinfo_msg", "error", "商品详情为空");
            return false;
        } else if ($("#update_gPrice").val().length === 0) {
            show_validate_msg("#check_update_gPrice_msg", "error", "单价为空");
            return false;
        } else if ($("#update_gCreattime").val().length === 0) {
            show_validate_msg("#check_update_gCreattime_msg", "error", "生产日期为空");
        } else if ($("#update_gEndtime").val().length === 0) {
            show_validate_msg("#check_update_gEndtime_msg", "error", "有效日期为空");
        } else if ($("#update_gNum").val().length === 0) {
            show_validate_msg("#check_update_gNum_msg", "error", "库存数量为空");
        } else if ($("#updategoodsFirstTypes").val().length === 0 ||
            $("#updategoodsSecondTypes").val().length === 0 ||
            $("#updategoodsThreeTypes").val().length === 0) {
            show_validate_msg("#check_update_goodsType_msg", "error", "商品分类为空");
        }
        return true;
    }

    //点击保存修改，商品更新，关闭模态框，到当前页
    $("#update_goods_btn").click(function () {
        if (!updateGoodsFormIsEmpty()) {
            return false;
        }
        var formData = new FormData();
        var gId = $("#updateGid").attr("gId");
        console.log(gId);
        formData.append("gId", gId);
        formData.append("gDetailinfo", $("#update_gDetailinfo").val());
        formData.append("gPrice", $("#update_gPrice").val());
        formData.append("gCreattime", $("#update_gCreattime").val());
        formData.append("gEndtime", $("#update_gEndtime").val());
        formData.append("gNum", $("#update_gNum").val());
        formData.append("goodsFirstTypes", $("#updategoodsFirstTypes").val());
        formData.append("goodsSecondTypes", $("#updategoodsSecondTypes").val());
        formData.append("goodsThreeTypes", $("#updategoodsThreeTypes").val());
        if ($("#updatePicture").get(0).files[0] === undefined) {
            formData.append("pictureFile", null);
        } else {
            formData.append("pictureFile", $("#updatePicture").get(0).files[0]);
        }
        $.ajax({
            url: "${APP_PATH}/updateGoods",
            method: "POST",
            contentType: false,// 告诉jQuery不要去设置Content-Type请求头
            processData: false,// 告诉jQuery不要去处理发送的数据
            data: formData,
            success: function (result) {
                $("#update_goods_Modal").modal("hide");
                to_page(currentPae);
            }
        });
    });

    /**
     * 新增
     */
    //清空新增表单并打开新增模态框
    $("#createGoodsBtn").click(function () {
        $("#create_goods_form")[0].reset();
        $("#pictureShow").prop("src", "");
        //清除残留样式
        show_validate_msg("#check_pictureFormat", "", "只能是jpg、gif、bmp、png、jpeg、png类型！");
        show_validate_msg("#check_add_gDetailinfo_msg", "", "");
        show_validate_msg("#check_add_gPrice_msg", "", "");
        show_validate_msg("#check_add_gCreattime_msg", "", "");
        show_validate_msg("#check_add_gEndtime_msg", "", "");
        show_validate_msg("#check_add_gNum_msg", "", "");
        show_validate_msg("#check_goodsType_msg", "", "");
        $("#create_goods_Modal").modal({
            backdrop: "static"
        });
    });

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

    //展示预览图
    $("#pictureFile").change(function () {
        var url = getObjectURL(this.files[0]);
        $("#pictureShow").prop("src", url);
    });

    //检查商品新增表单是否有空以及判断是否有验证错误的表单数据
    function addGoodsFormIsEmpty() {

        //判断是否有咽炎错误的表单数据
        if ($("#create_goods_form").find("div.has-error").length > 0) {
            return false;
        }

        if ($("#pictureFile").val().length === 0) {
            show_validate_msg("#check_pictureFormat", "error", "未选择任何文件");
            return false;
        } else if ($("#add_gDetailinfo").val().length === 0) {
            show_validate_msg("#check_add_gDetailinfo_msg", "error", "商品详情为空");
            return false;
        } else if ($("#add_gPrice").val().length === 0) {
            show_validate_msg("#check_add_gPrice_msg", "error", "单价为空");
            return false;
        } else if ($("#add_gCreattime").val().length === 0) {
            show_validate_msg("#check_add_gCreattime_msg", "error", "生产日期为空");
        } else if ($("#add_gEndtime").val().length === 0) {
            show_validate_msg("#check_add_gEndtime_msg", "error", "有效日期为空");
        } else if ($("#add_gNum").val().length === 0) {
            show_validate_msg("#check_add_gNum_msg", "error", "库存数量为空");
        } else if ($("#addgoodsFirstTypes").val().length === 0 ||
            $("#addgoodsSecondTypes").val().length === 0 ||
            $("#addgoodsThreeTypes").val().length === 0) {
            show_validate_msg("#check_goodsType_msg", "error", "商品分类为空");
        }
        return true;
    }

    //提交表单数据
    $("#addGoods_Btn").click(function () {
        if (!addGoodsFormIsEmpty()) {
            return false;
        }
        var formData = new FormData();
        formData.append("pictureFile", $("#pictureFile").get(0).files[0]);
        formData.append("gDetailinfo", $("#add_gDetailinfo").val());
        formData.append("gPrice", $("#add_gPrice").val());
        formData.append("gCreattime", $("#add_gCreattime").val());
        formData.append("gEndtime", $("#add_gEndtime").val());
        formData.append("gNum", $("#add_gNum").val());
        formData.append("goodsFirstTypes", $("#addgoodsFirstTypes").val());
        formData.append("goodsSecondTypes", $("#addgoodsSecondTypes").val());
        formData.append("goodsThreeTypes", $("#addgoodsThreeTypes").val());
        $.ajax({
            url: "${APP_PATH}/addGoods",
            method: "POST",
            contentType: false,// 告诉jQuery不要去设置Content-Type请求头
            processData: false,// 告诉jQuery不要去处理发送的数据
            data: formData,
            success: function (result) {
                $("#create_goods_Modal").modal("hide");
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
        deleteGoods($(this).attr("delete-id"));
    });

    //删除对应的地址信息
    function deleteGoods(gId) {
        if (confirm("确认删除吗？")) {
            $.ajax({
                url: "${APP_PATH}/deleteGoods/" + gId,
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
    $(document).on("click", "#delete_checkedGoods_btn", function () {
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
                    url: "${APP_PATH}/deleteGoods/" + del_idstr,
                    type: "DELETE",
                    success: function (result) {
                        //回到本页
                        //11a2af09
                        $("#check_all").prop("checked", false);
                        to_page(currentPae);
                    }
                });
            }
        }
    });


</script>
</html>
