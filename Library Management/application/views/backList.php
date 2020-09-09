<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>图书借记管理系统</title>
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
					<li><a class="on" href="<?php echo site_url('Main/index'); ?>">首页</a></li>

				</ul>
			</div>
			<div class="top-info-wrap">
				<ul class="top-info-list clearfix">
                    <li>欢迎您，
                        <?php
                        echo "${_SESSION["user_name"]}";//显示登录用户名
                        ?><br></li>
                    <li><a href="<?php echo site_url('AlterPass/preAlter'); ?>">修改密码</a></li>
                    <li><a href="<?php echo site_url('Main/esc'); ?>">退出登陆</a></li>
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
					<li><a ><i class="icon-font">&#xe003;</i>图书管理</a>
                    <ul class="sub-menu">
                        <li><a href="<?php echo site_url('BookAdd/add'); ?>"><i class="icon-font">&#xe008;</i>添加图书</a></li>
                        <li><a href="<?php echo site_url('BookList/book'); ?>"><i class="icon-font">&#xe005;</i>图书列表</a></li>
       
                    </ul>
                </li>
                <li>
                    <a ><i class="icon-font">&#xe018;</i>借记管理</a>
                    <ul class="sub-menu">
                        <li><a href="<?php echo site_url('BorrowList/borrow'); ?>"><i class="icon-font">&#xe017;</i>在借列表</a></li>
                        <li><a href="<?php echo site_url('BackList/back'); ?>"><i class="icon-font">&#xe037;</i>已归还列表</a></li>
                        
                    </ul>
                </li>
                <li>
                    <a ><i class="icon-font">&#xe018;</i>黑名单管理</a>
                    <ul class="sub-menu">
                        <li><a href="<?php echo site_url('BlackList/black'); ?>"><i class="icon-font">&#xe017;</i>黑名单列表</a></li>


						</ul></li>
				</ul>
			</div>
		</div>
		<!--/sidebar-->
		<div class="main-wrap">

			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i><a href="<?php echo site_url('Main/index'); ?>">首页</a><span
						class="crumb-step">&gt;</span><a class="crumb-name" >还书管理</a><span
						class="crumb-step">&gt;</span><span>已归还列表</span>
				</div>
			</div>
			<div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="120">搜索内容：</th>
                            <td>
                                <select name="search" id="">
                                    <option value="" >全部</option>
                                    <option value="isbn" }>ISBN</option>
                                    <option value="book" }>图书名称</option>
                                    <option value="bar" }>条形码</option>
                                    <option value="stuid"}>学号</option>

                                </select>
                            </td>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" name="key" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
			  
			
			<div class="result-wrap">
				
					<form id="customerForm" name="customerForm"
						action="#"
						method=post >
						 <div class="result-title">
                    <div class="result-list">
                        <a href="<?php echo site_url('BackAdd/backA'); ?>"><i class="icon-font"></i>还书登记</a>
                        
                    </div>
                </div>

					<div class="result-content">
						<table id=grid
							class="result-tab" width="100%">
							<tbody>
								<tr
									style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
									<td>图书名称</td>
									<td>ISBN</td>
									<td>归还人姓名</td>
									<td>归还人学号</td>
									<td>归还日期</td>
								</tr>
                                <?php
                                // 1.导入配置文件
                                require "dbconfig.php";
                                // 2. 连接mysql
                                $link = @mysqli_connect(HOST,USER,PASS) or die("提示：数据库连接失败！");
                                // 选择数据库
                                mysqli_select_db($link,'mysql');
                                // 编码设置
                                mysqli_set_charset($link,'utf8');

                                // 3. 从DBNAME中查询到book数据库，返回数据库结果集,并按照addtime降序排列
                                $sql = 'select * from back order by id asc';
                                //var_dump($sql);die;
                                // 结果集
                                $result = mysqli_query($link,$sql);
                                //var_dump($result);die;

                                // 解析结果集,$row为书籍所有数据，$bookNum为书籍数目
                                $bookNum=mysqli_num_rows($result);

                                for($i=0; $i<$bookNum; $i++) {
                                    $row = mysqli_fetch_assoc($result);
                                    echo "<tr>";
                                    echo "<td>{$row['book_title']}</td>";
                                    echo "<td>{$row['isbn']}</td>";
                                    echo "<td>{$row['name']}</td>";
                                    echo "<td>{$row['num']}</td>";
                                    echo "<td>{$row['date']}</td>";
                                    echo"<td>";
                                }
                                // 5. 释放结果集
                                mysqli_free_result($result);
                                mysqli_close($link);
                                ?>
							</tbody>
						</table>
						</div>
					</form>
				</div>
			</div>
    </div>
		<!--/main-->
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
