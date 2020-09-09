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
                    <li><a href="../customer/list" class="active"><ill
                            class="fa fa-edit fa-fw"></ill> 客户管理</a></li>
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
                <h1 class="page-header">客户管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" action="${pageContext.request.contextPath }/customer/list" method="get">
                    <div class="form-group">
                        <label for="customerName">客户名称</label>
                        <input type="text" class="form-control" id="customerName" value="${custName }" name="custName">
                    </div>
                    <div class="form-group">
                        <label for="customerFrom">客户来源</label>
                        <select class="form-control" id="customerFrom" placeholder="客户来源" name="custSource">
                            <option value="">--请选择--</option>
                            <c:forEach items="${fromType}" var="item">
                                <option value="${item.dict_id}"<c:if
                                        test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="custIndustry">所属行业</label>
                        <select class="form-control" id="custIndustry" name="custIndustry">
                            <option value="">--请选择--</option>
                            <c:forEach items="${industryType}" var="item">
                                <option value="${item.dict_id}"<c:if
                                        test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="custLevel">客户级别</label>
                        <select class="form-control" id="custLevel" name="custLevel">
                            <option value="">--请选择--</option>
                            <c:forEach items="${levelType}" var="item">
                                <option value="${item.dict_id}"<c:if
                                        test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">客户信息列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>客户名称</th>
                            <th>客户来源</th>
                            <th>客户所属行业</th>
                            <th>客户级别</th>
                            <th>固定电话</th>
                            <th>手机</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.rows}" var="row">
                            <tr>
                                <td>${row.cust_id}</td>
                                <td>${row.cust_name}</td>
                                <td>${row.cust_source}</td>
                                <td>${row.cust_industry}</td>
                                <td>${row.cust_level}</td>
                                <td>${row.cust_phone}</td>
                                <td>${row.cust_mobile}</td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                       data-target="#customerEditDialog" onclick="editCustomer(${row.cust_id})">修改</a>
                                    <a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer(${row.cust_id})">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="col-md-12 text-right">
                        <button class="btn btn-primary" data-toggle="modal"
                                data-target="#customerAddDialog" style="float: left;margin-top: 20px">新增客户
                        </button>
                        <itcast:page url="${pageContext.request.contextPath }/customer/list"/>
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
                    <input type="hidden" id="edit_cust_id" name="cust_id"/>
                    <div class="form-group">
                        <label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_customerName" placeholder="客户名称"
                                   name="cust_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="edit_customerFrom" placeholder="客户来源" name="cust_source">
                                <option disabled="disabled" selected="selected">--请选择--</option>
                                <c:forEach items="${fromType}" var="item">
                                    <option value="${item.dict_id}"<c:if
                                            test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="edit_custIndustry" name="cust_industry">
                                <option disabled="disabled" selected="selected">--请选择--</option>
                                <c:forEach items="${industryType}" var="item">
                                    <option value="${item.dict_id}"<c:if
                                            test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="edit_custLevel" name="cust_level">
                                <option disabled="disabled" selected="selected">--请选择--</option>
                                <c:forEach items="${levelType}" var="item">
                                    <option value="${item.dict_id}"<c:if
                                            test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_linkMan" placeholder="联系人"
                                   name="cust_linkman">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_phone" placeholder="固定电话"
                                   name="cust_phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_mobile" placeholder="移动电话"
                                   name="cust_mobile">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_zipcode" placeholder="邮政编码"
                                   name="cust_zipcode">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_address" class="col-sm-2 control-label">联系地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_address" placeholder="联系地址"
                                   name="cust_address">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
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
                <h4 class="modal-title" id="addModalLabel">新增客户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="add_customer_form">
                    <div class="form-group">
                        <label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_customerName" placeholder="客户名称"
                                   name="cust_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="add_customerFrom" placeholder="客户来源" name="cust_source">
                                <option disabled="disabled" selected="selected">--请选择--</option>
                                <option value="6">电话营销</option>
                                <option value="7">网络营销</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="add_custIndustry" name="cust_industry">
                                <option disabled="disabled" selected="selected">--请选择--</option>
                                <option value="1">教育培训</option>
                                <option value="2">电子商务</option>
                                <option value="3">对外贸易</option>
                                <option value="4">酒店旅游</option>
                                <option value="5">房地产</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="add_custLevel" name="cust_level">
                                <option disabled="disabled" selected="selected">--请选择--</option>
                                <option value="22">普通客户</option>
                                <option value="23">VIP客户</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_linkMan" class="col-sm-2 control-label">联系人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_linkMan" placeholder="联系人"
                                   name="cust_linkman">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_phone" class="col-sm-2 control-label">固定电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_phone" placeholder="固定电话"
                                   name="cust_phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_mobile" class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_mobile" placeholder="移动电话"
                                   name="cust_mobile">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_zipcode" class="col-sm-2 control-label">邮政编码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_zipcode" placeholder="邮政编码"
                                   name="cust_zipcode">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_address" class="col-sm-2 control-label">联系地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_address" placeholder="联系地址"
                                   name="cust_address">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="addCustomer()" >新增</button>
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
    function editCustomer(id) {
        $.ajax({
            type: "get",
            url: "edit",
            data: {"id": id},
            success: function (data) {
                // 将json字符串转为json对象
                var customer = eval("(" + data + ")");
                console.log(customer.cust_phone);
                $("#edit_cust_id").val(customer.cust_id);
                $("#edit_customerName").val(customer.cust_name);
                $("#edit_customerFrom").val(customer.cust_source)
                $("#edit_custIndustry").val(customer.cust_industry)
                $("#edit_custLevel").val(customer.cust_level)
                $("#edit_linkMan").val(customer.cust_linkman);
                $("#edit_phone").val(customer.cust_phone);
                $("#edit_mobile").val(customer.cust_mobile);
                $("#edit_zipcode").val(customer.cust_zipcode);
                $("#edit_address").val(customer.cust_address);

            }
        });
    }

    function updateCustomer() {
        $.post("update", $("#edit_customer_form").serialize(), function (data) {
            alert("客户信息更新成功！");
            window.location.reload();
        });
    }


    function addCustomer() {
        $.post("insert", $("#add_customer_form").serialize(), function (data) {

            alert("新增客户成功！");
            window.location.reload();
        });
    }

    function deleteCustomer(id) {
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
