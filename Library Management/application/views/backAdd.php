<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <title>图书借记管理系统</title>
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/main.css"/>
   <script src="/Shoot_Idiot/public/bootstrap-datetimepicker-master/bootstrap-datetimepicker-master/sample in bootstrap v3/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/Shoot_Idiot/public/js/jquery-ui-datepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/jquery-ui.css" />
    <script type="text/javascript" src="/Shoot_Idiot/public/js/libs/modernizr.min.js"></script>
    <script type="text/javascript">
        function checkForm()
        {
            var book_title=document.getElementById("book_title").value; //获取form中的书名
            var isbn=document.getElementById("isbn").value; //获取form中的isbn
            var name=document.getElementById("name").value; //获取form中的姓名
            var num=document.getElementById("num").value; //获取form中的学号
            var date=document.getElementById("date").value; //获取form中的日期
            var regex=/^[/s]+$/; //声明一个判断用栏目前后是否有空格的正则表达式
            if(regex.test(book_title)||book_title.length==0)//判定书名是否前后有空格或者是否为空
            {
                alert("书名不能为空！");
                return false;
            }
            if(regex.test(isbn)||isbn.length==0)//同上
            {
                alert("ISBN不能为空！");
                return false;
            }
            if(regex.test(name)||name.length==0)//同上
            {
                alert("姓名不能为空！");
                return false;
            }
            if(regex.test(num)||num.length==0)//同上
            {
                alert("学号不能为空！");
                return false;
            }
            if(regex.test(date)||date.length==0)//同上述内容
            {
                alert("归还日期不能为空！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<?php
session_start ();
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
            <div class="crumb-list"><i class="icon-font"></i><a href="<?php echo site_url('Main/index'); ?>">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="<?php echo site_url('BackList/back'); ?>">已归还列表</a><span class="crumb-step">&gt;</span><span>还书登记</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
    
        <?php echo validation_errors(); ?>
        <form action="<?php echo site_url('BackAdd/backAd'); ?>" method="post" id="myform" name="myform" enctype="multipart/form-data" onsubmit="return checkForm()"/>
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th><i class="require-red">*</i>图书名称：</th>
                                <td><input class="common-text" name="book_title" id="book_title" size="50" type="text" value="<?php echo set_value('book_title'); ?>"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>ISBN：</th>
                                <td><input class="common-text" name="isbn" id="isbn" size="50"  type="text" value="<?php echo set_value('isbn'); ?>"></td>
                            </tr>
                             <tr>
                                <th><i class="require-red">*</i>归还人姓名：</th>
                                <td><input class="common-text" name="name" id="name" size="50" type="text" value="<?php echo set_value('name'); ?>"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>归还人学号：</th>
                                <td><input class="common-text" name="num" id="num" size="50"  type="text" value="<?php echo set_value('num'); ?>"></td>
                            </tr>
                            <tr>
                            <th width="120"><i class="require-red">*</i>归还日期：</th>
                            <td><input class="common-text" name="date" id="date" size="50"  type="text" value="<?php echo set_value('date'); ?>"></td>
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