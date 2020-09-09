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
        function checkform()
        {
            var book_title=document.getElementById("book_title").value; //获取form中的图书名
            var author=document.getElementById("author").value; //获取form中的作者
            var book_copies=document.getElementById("book_copies").value; //获取form中的数量
            var publisher_name=document.getElementById("publisher_name").value; //获取form中的出版社名
            var isbn=document.getElementById("isbn").value; //获取form中的ISBN
            var copyright_year=document.getElementById("copyright_year").value; //获取form中的出版时间
            var date_added=document.getElementById("date_added").value; //获取form中的收录时间
            var regex=/^[/s]+$/; //声明一个判断用栏目前后是否有空格的正则表达式
            if(regex.test(book_title)||book_title.length==0)//判定图书名是否前后有空格或者是否为空
            {
                alert("图书名称不能为空！");
                return false;
            }
            if(regex.test(author)||author.length==0)//同上述内容
            {
                alert("作者不能为空！");
                return false;
            }
            if(regex.test(book_copies)||book_copies.length==0)//同上述内容
            {
                alert("数量不能为空！");
                return false;
            }
            if(regex.test(publisher_name)||publisher_name.length==0)//同上述内容
            {
                alert("出版社不能为空！");
                return false;
            }
            if(regex.test(isbn)||isbn.length==0)//同上述内容
            {
                alert("ISBN不能为空！");
                return false;
            }
            if(regex.test(copyright_year)||copyright_year.length==0)//同上述内容
            {
                alert("出版时间不能为空！");
                return false;
            }
            if(regex.test(date_added)||date_added.length==0)//同上述内容
            {
                alert("收录时间不能为空！");
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


                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<?php echo site_url('Main/index'); ?>">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="#">图书管理</a><span class="crumb-step">&gt;</span><span>添加图书</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">

                <?php echo validation_errors(); ?><!--用于显示表单验证的错误信息-->
                <form action="<?php echo site_url('BookAdd/bookAddAct'); ?>" method="post" id="myform" name="myform" enctype="multipart/form-data" onsubmit="return checkform()">
                <table class="insert-tab" width="100%">
                    <tbody>
                        <th><i class="require-red">*</i>图书名称：</th>
                        <td><input class="common-text" name="book_title" id="book_title" size="50" type="text" value="<?php echo set_value('book_title'); ?>"></td><!--用提交的数据重新填充表单-->
                    </tr>
                    <tr>
                        <th><i class="require-red">*</i>作者：</th>
                        <td><input class="common-text" name="author" id="author" size="50"  type="text" value="<?php echo set_value('author'); ?>"></td><!--用提交的数据重新填充表单-->
                    </tr>
                    <tr>
                        <th><i class="require-red">*</i>数量：</th>
                        <td><input class="common-text" name="book_copies" id="book_copies" size="50" type="text" value="<?php echo set_value('book_copies'); ?>"></td><!--用提交的数据重新填充表单-->
                    </tr>
                    <tr>
                        <th><i class="require-red">*</i>出版社：</th>
                        <td><input class="common-text" name="publisher_name" id="publisher_name" size="50"  type="text" value="<?php echo set_value('publisher_name'); ?>"></td><!--用提交的数据重新填充表单-->
                    </tr>
                    <tr>
                        <th><i class="require-red">*</i>ISBN：</th>
                        <td><input class="common-text required" name="isbn" id="isbn" size="50" type="text" value="<?php echo set_value('isbn'); ?>"></td><!--用提交的数据重新填充表单-->
                    </tr>
                    <tr>
                        <th><i class="require-red">*</i>出版时间：</th>
                        <td><input class="common-text" name="copyright_year" id="copyright_year" size="50"  type="text" value="<?php echo set_value('copyright_year'); ?>"></td><!--用提交的数据重新填充表单-->
                    </tr>
                    <tr>
                        <th><i class="require-red">*</i>收录时间：</th>
                        <td><input class="common-text" name="date_added" id="date_added" size="50"  type="text" value="<?php echo set_value('date_added'); ?>"></td><!--用提交的数据重新填充表单-->
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