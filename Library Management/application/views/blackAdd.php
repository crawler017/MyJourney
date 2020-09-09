<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <title>图书借记管理系统</title>
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/main.css"/>
    <script type="text/javascript" src="/Shoot_Idiot/public/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="/Shoot_Idiot/public/bootstrap/js/jquery-3.2.0.min.js"></script>
    <script type="text/javascript">
        <script type="text/javascript">
            function checkform()
            {
                var num=document.getElementById("num").value; //获取form中的学号
                var name=document.getElementById("name").value; //获取form中的姓名
                var regex=/^[/s]+$/; //声明一个判断用栏目前后是否有空格的正则表达式
                if(regex.test(num)||num.length==0)//判定学号是否前后有空格或者是否为空
                {
                    alert("学号不能为空！");
                    return false;
                }
                if(regex.test(name)||name.length==0)//同上述内容
                {
                    alert("姓名不能为空！");
                    return false;
                }
                return true;
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
                <li>
                <a ><i class="icon-font">&#xe003;</i>图书管理</a>
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
                       
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
   <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<?php echo site_url('Main/index'); ?>">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="<?php echo site_url('BlackList/black'); ?>">黑名单列表</a><span class="crumb-step">&gt;</span><span>添加</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
    
            <?php echo validation_errors(); ?>
        <form action="<?php echo site_url('BlackAdd/blackAd'); ?>" method="post" id="myform" name="myform" enctype="multipart/form-data" onsubmit="return checkForm()"/>
                    <table class="insert-tab" width="100%">
                        <tbody>
                                <th><i class="require-red">*</i>学号：</th>
                                <td>
                                    <input class="common-text required" id="num" name="num" size="50" type="text" value="<?php echo set_value('num'); ?>">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>姓名：</th>
                                <td><input class="common-text" name="name" id="name" size="50" type="text" value="<?php echo set_value('name'); ?>">
                                </td>
                            </tr>
                          
								<tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
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