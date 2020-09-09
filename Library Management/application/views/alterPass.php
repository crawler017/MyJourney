<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <title>图书借记管理系统</title>
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/common.css">
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/main.css"/>
    <script type="text/javascript" src="/Shoot_Idiot/public/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="/Shoot_Idiot/public/bootstrap/js/jquery-3.2.0.min.js"></script>
    <script type="text/javascript">
    function alter(){
        var username=document.getElementById("username").value;
      var oldpassword=document.getElementById("oldpassword").value; 
      var newpassword=document.getElementById("newpassword").value; 
      var assertpassword=document.getElementById("assertpassword").value; 
      var regex=/^[/s]+$/; 
      if(regex.test(username)||username.length==0){ 
        alert("用户名格式不对"); 
        return false; 
      } 
      if(regex.test(oldpassword)||oldpassword.length==0){ 
        alert("密码格式不对"); 
        return false; 
      } 
      if(regex.test(newpassword)||newpassword.length==0) { 
        alert("新密码格式不对"); 
        return false; 
      } 
      if (assertpassword != newpassword||assertpassword==0) { 
        alert("两次密码输入不一致"); 
        return false; 
      } 
      return true; 
    }
	</script>
</head>
<body>
<?php
if (!session_id())session_start ();
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
                       
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
   <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<?php echo site_url('Main/index'); ?>">首页</a><span class="crumb-step">&gt;<span>修改密码</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
    

        <form action="<?php echo site_url('AlterPass/alter'); ?>" method="post" enctype="multipart/form-data" onsubmit="return alter()">
                    <table class="insert-tab" width="100%">
                        <tbody>
                                <th><i class="require-red">*</i>用户名：</th>
                                <td>
                                    <input type="text" class="common-text" id="username" name="username" size="50">
                                </td>
                            </tr>
                                <th><i class="require-red">*</i>原密码：</th>
                                <td>
                                    <input type="password" class="common-text" id="oldpassword" name="oldpassword" size="50">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>新密码：</th>
                                <td><input type="password" class="common-text" name="newpassword" id="newpassword" size="50" ></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>重复密码：</th>
                                <td><input type="password" class="common-text" name="assertpassword" id="assertpassword" size="50"></td>
                            </tr>
                            
								<tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="修改密码" type="submit" onclick="return alter()">
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