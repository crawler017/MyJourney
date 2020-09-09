<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>单点登录管理与校检系统</title>
<link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/common.css" />
<link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/main.css" />
<script type="text/javascript" src="/Shoot_Idiot/public/js/libs/modernizr.min.js"></script>
<script type="text/javascript" src="/Shoot_Idiot/public/bootstrap/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" language=javascript>
	// 提交分页的查询的表单
	function to_page(page) {
		if (page) {
			$("#page").val(page);
		}
		document.customerForm.submit();
	}
</script>

<meta content="MSHTML 6.00.2900.3492" name=GENERATOR>
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
				<div class="crumb-list">
                <div class="crumb-list"><a class="crumb-name">用户管理</a><span class="crumb-step">&gt;</span><span>用户列表管理</span></div>
				</div>
			</div>
			
			<div class="result-wrap">
				
					<form id="customerForm" name="customerForm" action="#" method=post >

					<div class="result-content">
						<table id=grid
							class="result-tab" width="100%">
							<tbody>
								<tr
									style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <td>用户ID</td>
									<td>用户名</td>
                                    <td>密钥</td>
									<td>操作</td>
								</tr>

                                <?php
                                if (!defined('HOST')) define('HOST','localhost');
                                if (!defined('USER')) define('USER','root');
                                if (!defined('PASS')) define('PASS','root');
                                if (!defined('DBNAME')) define('DBNAME','my_sso');
                                // 2. 连接mysql
                                $link = @mysqli_connect(HOST,USER,PASS) or die("提示：数据库连接失败！");
                                // 选择数据库
                                mysqli_select_db($link,'my_sso');
                                // 编码设置
                                mysqli_set_charset($link,'utf8');

                                $sql = 'select * from sso_users order by user_id asc';
                                //var_dump($sql);die;
                                // 结果集
                                $result = mysqli_query($link,$sql);
                                //var_dump($result);die;

                                $Num=mysqli_num_rows($result);

                                for($i=0; $i<$Num; $i++) {
                                    $row = mysqli_fetch_assoc($result);
                                    echo "<tr>";
                                    echo "<td>{$row['user_id']}</td>";
                                    echo "<td>{$row['username']}</td>";
                                    echo "<td>{$row['password']}</td>";
                                    echo "<td>
                                     <a href='javascript:log({$row['user_id']})'>登录</a>
                                     <a href='javascript:del({$row['user_id']})'>删除</a>
                                     </td>";
                                    echo"<td>";
                                }
                                // 5. 释放结果集
                                mysqli_free_result($result);
                                mysqli_close($link);
                                ?>
                                <td>&nbsp;</td>
                            </tbody>
                        </table>
                    </div>
<script type="text/javascript">
    function log (user_id) {
        if (confirm("确定要登录吗？")){
            window.location.href="<?php echo site_url('User/requestLogin'); ?>" + '/' + user_id;
        }
    }
</script>
<script type="text/javascript">
    function del (user_id) {
        if (confirm("确定要删除此用户吗？")){
            
            window.location.href="<?php echo site_url('User/delUser'); ?>?user_id="+user_id;
        }
    }
</script>
</div>
        </div>
    </div>
		<!--/main-->
<?php
} else {
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
