<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户管理</title>
    <jsp:include page="../common/head.jsp" flush="true" />
    <link href="//cdn.bootcss.com/bootstrap-table/1.11.0/bootstrap-table.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <ol class="breadcrumb">
        <li>
            <span>//</span>
            <a>用户管理</a>
        </li>
        <li class="pull-right">
            <a href="${contextPath}/user/onAdd">
                <img class="img-btn " src="${contextPath}/static/asstes/images/add.png" id="add">
            </a>
        </li>
    </ol>
    <div class="row">
        <div class="col-sm-12 text-center">
            <div id="toolbar"></div>
            <table data-toggle="table" data-url="${contextPath}/user/all/1/10" data-method="get" data-pagination="true"
                   data-striped="true" data-checkbox="true" data-side-pagination="server" data-sort-name="userName"
                   data-sort-order="desc" data-toolbar="#toolbar">
                <thead>
                <tr>
                    <th data-align="center" data-events="operateEvents" data-formatter="operateFormatter">操作</th>
                    <th data-sortable="true" data-align="center" data-field="userName">账号</th>
                    <th data-sortable="true" data-align="center" data-field="password">密码</th>
                    <th data-sortable="true" data-align="center" data-field="phone">手机号码</th>

                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-sm" id="delModal" tabindex="-1"
     role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">删除</h4>
            </div>
            <div class="modal-body " id="user-del"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    取消</button>
                <button type="button" id="del_OK" class="btn btn-primary"
                        data-value="">确定</button>
            </div>
        </div>
    </div>
</div>

</body>
<script src="//cdn.bootcss.com/moment.js/2.17.1/moment.min.js"></script>
<script type="text/javascript">
    window.operateEvents = {
        'click .edit' : function(e, value, row, index) {
            window.location.href = "${contextPath}/user/onUpdate?id="
                + row.id;
        },
        'click .remove' : function(e, value, row, index) {
            swal(
                {
                    title : '你确定？',
                    text : '将要删除【' + row.userName + '】',
                    type : "info",
                    showCancelButton : true,
                    closeOnConfirm : false,
                    showLoaderOnConfirm : true,
                    cancelButtonText : '取消',
                    confirmButtonText : "删除",
                },
                function() {
                    $
                        .ajax({
                            url : "${contextPath}/user/delJson/"
                            + row.id, //请求的url地址
                            type : "DELETE", //请求方式
                            success : function(req) {
                                if (req.success == true) {
                                    swal(
                                        {
                                            title : "删除成功",
                                            text : req.message,
                                            type : "success",
                                        },
                                        function() {
                                            window.location.href = '${contextPath}/user/list';
                                        });
                                } else {
                                    swal(
                                        {
                                            title : "删除失败",
                                            text : req.message,
                                            type : "error",
                                        },
                                        function() {
                                            window.location.href = '${contextPath}/user/list';
                                        });
                                }

                            }
                        });
                });

        }};


    $("#del_OK").on('click', function() {

        var ids = new Array();

        ids.push($("#del_OK").data('id'));

        $.ajax({
            traditional : true,
            url : "${contextPath}/user/del", //请求的url地址
            async : true, //请求是否异步，默认为异步，这也是ajax重要特性
            data : {
                id : ids
            }, //参数值
            type : "POST", //请求方式
            beforeSend : function() {
                //请求前的处理
            },
            success : function(req) {
                //请求成功时处理
                //window.location.reload();
                window.location.href='${contextPath}/user/list';
                console.log("删除成功！");
            },
            complete : function() {
                //请求完成的处理
            },
            error : function() {
                //请求出错处理
                //alert("错误");
            }
        });

    });
    function operateFormatter(value, row, index) {
        return [ '<a class="edit" href="javascript:void(0)" title="编辑">',
            '<i class="glyphicon glyphicon-edit"></i>', '</a>  ',
            '<a class="remove" href="javascript:void(0)" title="删除">',
            '<i class="glyphicon glyphicon-remove"></i>', '</a>' ].join('');
    }
</script>
</html>
