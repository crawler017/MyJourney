<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>客户列表-BootCRM</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
          type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<c:if test="${sessionScope.user != null}">

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="../customer/list">客户管理系统</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">

            <li class="dropdown"><a class="dropdown-toggle"
                                    data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
                <i class="fa fa-caret-down"></i>
            </a>
                <ul class="dropdown-menu dropdown-user">

                    <li class="divider"></li>
                    <li><a href="../user/loginOut"><i class="fa fa-sign-out fa-fw"></i>
                        退出登录</a></li>
                </ul> <!-- /.dropdown-user --></li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="查询内容...">
                            <span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
								</button>
							</span>
                        </div> <!-- /input-group -->
                    </li>
                    <li><a href="../customer/list" class="active"><i
                            class="fa fa-edit fa-fw"></i> 客户管理</a></li>
                    <li><a href="../customerTrack/Tracklist"><i
                            class="fa fa-dashboard fa-fw"></i> 客户拜访</a></li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side --> </nav>


    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">拜访客户</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">拜访客户列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>客户名称</th>
                            <th>客户类型</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageList.rows}" var="row">
                            <tr>
                                <td>${row.id}</td>
                                <td>${row.customer_name}</td>
                                <td>${row.customer_type}</td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                       data-target="#customerEditDialog" onclick="editCustomerTrack(${row.id})">修改</a>
                                    <a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomerTrack(${row.id})">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="col-md-12 text-right">
                        <button class="btn btn-primary" data-toggle="modal"
                                data-target="#customerAddDialog" style="float: left;margin-top: 20px">新增客户
                        </button>
                        <itcast:page url="${pageContext.request.contextPath }/customerTrack/Tracklist"/>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- 客户编辑对话框 -->
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_customer_form">
                    <input type="hidden" id="edit_id" name="id"/>
                    <div class="form-group">
                        <label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_customerName" placeholder="客户名称"
                                   name="customer_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_customerType" class="col-sm-2 control-label">客户类型</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_customerType" placeholder="客户类型"
                                   name="customer_type">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateCustomerTrack()">保存修改</button>
            </div>
        </div>
    </div>
</div>


<!-- 新增客户弹窗 -->
<div class="modal fade" id="customerAddDialog" tabindex="-1" role="dialog"
     aria-labelledby="addModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addModalLabel">新增拜访客户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="add_customer_form">
                    <div class="form-group">
                        <label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_customerName" placeholder="客户名称"
                                   name="customer_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_type" class="col-sm-2 control-label">客户类型</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_type" placeholder="客户类型"
                                   name="customer_type">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="addCustomerTrack()" >新增</button>
            </div>
        </div>
    </div>
</div>


<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>

<script type="text/javascript">
    function editCustomerTrack(id) {
        $.ajax({
            type: "get",
            url: "edit",
            data: {"id": id},
            //请求成功后的回调函数
            success: function (data) {
                // 将json字符串转为json对象
                var customer_track = eval("(" + data + ")");
                console.log(customer_track.id);
                $("#edit_id").val(customer_track.id);
                $("#edit_customerName").val(customer_track.customer_name);
                $("#edit_customerType").val(customer_track.customer_type)

            }
        });
    }

    function updateCustomerTrack() {
        $.post("update", $("#edit_customer_form").serialize(), function (data) {
            alert("客户信息更新成功！");
            window.location.reload();
        });
    }


    function addCustomerTrack() {
        $.post("insert", $("#add_customer_form").serialize(), function (data) {

            alert("新增客户成功！");
            window.location.reload();
        });
    }

    function deleteCustomerTrack(id) {
        if (confirm('确实要删除该客户吗?')) {
            $.post("delete", {"id": id}, function (data) {
                alert("客户删除更新成功！");
                window.location.reload();
            });
        }
    }
</script>

</c:if>
<c:if test="${sessionScope.user == null}">
    <h1 align="center" color="red">你尚未登录，点击<a href="../user/loginOut" />此处</a>进行登录!</h1>
</c:if>

</body>
</html>
