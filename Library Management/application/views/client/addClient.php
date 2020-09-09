<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="UTF-8">
    <title>单点登录管理与校检系统</title>
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/main.css"/>
    <script type="text/javascript" src="/Shoot_Idiot/public/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="/Shoot_Idiot/public/bootstrap/js/jquery-3.2.0.min.js"></script>
    <script type="text/javascript">
        function checkform()
        {
            var client_id=document.getElementById("client_id").value;
            var client_name=document.getElementById("client_name").value;
            var client_key=document.getElementById("client_key").value;
            var regex=/^[/s]+$/;
            if(regex.test(client_id)||client_id.length==0)
            {
                alert("客户端ID不能为空！");
                return false;
            }
            if(regex.test(client_name)||client_name.length==0)
            {
                alert("客户端名不能为空！");
                return false;
            }
            if(regex.test(client_key)||client_key.length==0)
            {
                alert("密钥不能为空！");
                return false;
            }
        }
    </script>
</head>
<body>
<?php
if (!session_id()) session_start();
if (isset ( $_SESSION ["code"] )) { //判断code存不存在，如果不存在，说明异常登录
?>
	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">

				<ul class="navbar-list clearfix">
					<li><a class="on" href="<?php echo site_url('User/index'); ?>">首页</a></li>

				</ul>
			</div>
			<div class="top-info-wrap">
				<ul class="top-info-list clearfix">
                    <li>欢迎您，
                        <?php
                        echo "${_SESSION["username"]}";//显示登录用户名
                        ?><br></li>
                    <li><a href="<?php echo site_url('User/changePass'); ?>">修改密码</a></li>
                    <li><a href="<?php echo site_url('Login/esc'); ?>">退出登陆</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container clearfix">
		<div class="sidebar-wrap">
			<div class="sidebar-title">
				<h1>菜单</h1>
			</div>
			<div class="sidebar-content">
				<ul class="sidebar-list">
                    <ul class="sub-menu">
                    </ul>
                </li>
                <li>
                    <a ><i class="icon-font">&#xe018;</i>用户管理</a>
                    <ul class="sub-menu">
                        <li><a href="<?php echo site_url('User/editUser'); ?>"><i class="icon-font">&#xe017;</i>用户列表管理</a></li>
                        <li><a href="<?php echo site_url('User/creatUser'); ?>"><i class="icon-font">&#xe037;</i>创建用户</a></li>
                        
                    </ul>
                </li>
                <li>
                    <a ><i class="icon-font">&#xe018;</i>客户端管理</a>
                    <ul class="sub-menu">
                        <li><a href="<?php echo site_url('Client/index'); ?>"><i class="icon-font">&#xe017;</i>接入客户端管理</a></li>
                        <li><a href="<?php echo site_url('Client/clientAdd'); ?>"><i class="icon-font">&#xe017;</i>创建客户端</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><a class="crumb-name" href="#">客户端管理</a><span class="crumb-step">&gt;</span><span>创建客户端</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">

                <?php echo validation_errors(); ?><!--用于显示表单验证的错误信息-->
                <form action="<?php echo site_url('Client/doClientAdd'); ?>" method="post" id="myform" name="myform" enctype="multipart/form-data" onsubmit="return checkform()">
                <table class="insert-tab" width="100%">
                    <tbody>
                    <tr>
                        <th><i class="require-red">*</i>客户端名称：</th>
                        <td><input class="common-text" name="client_name" id="client_name" size="50"  type="text" value="<?php echo set_value('client_name'); ?>"></td>
                    </tr>
                    <tr>
                        <th><i class="require-red">*</i>签名密钥：</th>
                        <td><input class="common-text" name="client_key" id="client_key" size="50" type="text" value="<?php echo set_value('client_key'); ?>"></td>
                    </tr>
                    <tr>
                        <th><i class="require-red">*</i>接受URL：</th>
                        <td><input class="common-text" name="client_url" id="client_url" size="50" type="text" value="<?php echo set_value('client_url'); ?>"></td>
                    </tr>
                    <tr>
                        <th><i class="require-red">*</i>是否启用：</th>
                        <td><input class="common-text" name="client_state" id="client_state" size="50" type="text" placeholder="1为是0为否" value="<?php echo set_value('client_state'); ?>"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                            <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                        </td>
                    </tr>
                    </tbody></table>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
<?php
} else { //code不存在，调用exit.php 退出登录
?>
    <script type="text/javascript">
        alert("请先登录");
        window.location.href = "<?php echo site_url('Login/index'); ?>";
    </script>
    <?php
}
?>
</body>
</html>