<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/iofrm-style.css">
    <link rel="stylesheet" type="text/css" href="/Shoot_Idiot/public/css/iofrm-theme.css">
</head>
<body>
        <script type="text/javascript"> 
            function check() { 
              var username=document.getElementById("username").value;//获取form中的用户名
              var password=document.getElementById("password").value; //获取form中的用户密码
              var assertpassword=document.getElementById("assertpassword").value; 
              var regex=/^[/s]+$/; 
               
              if(regex.test(username)||username.length==0){ 
                alert("用户名格式不对"); 
                return false; 
              } 
              if(regex.test(password)||password.length==0){ 
                alert("密码格式不对"); 
                return false;     
              } 
              if(password!=assertpassword){ 
                alert("两次密码不一致"); 
                return false; 
              } 
            } 
        </script> 
    <div class="form-body">
        <div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <div class="website-logo-inside">
                            <a href="index.php">
                            </a>
                        </div>
                        <h3>登陆来获取图书馆的通行证！</h3>
                        <p>进入黄金屋 寻找颜如玉</p>
                        <div class="page-links">
                            <a href="<?php echo site_url('Login/login1'); ?>">登陆</a><a href="<?php echo site_url('Register/register1'); ?>" class="active">注册</a>
                        </div>
                        <?php echo validation_errors(); ?><!--此函数用于显示表单验证的错误信息-->
                        <form action="<?php echo site_url('Register/rCheck'); ?>" method="post" name="form_register" onsubmit="return check()">
                            <input class="form-control" type="text" name="username" id="username" placeholder="用户名" value="<?php echo set_value('username'); ?>" required><!--set_value是用提交的数据重新填充表单-->
                            <input class="form-control" type="password" name="password" id="password" placeholder="密码" value="<?php echo set_value('password'); ?>" required>
                            <input class="form-control" type="password" name="assertpassword" id="assertpassword" placeholder="确认密码" value="<?php echo set_value('assertpassword'); ?>" required>
                            <div class="form-button">
                                <button id="submit" type="submit" class="ibtn">注册</button>
                            </div>
                        </form>
                        <div class="other-links">
                            <span>用其他账号登陆</span><a href="#">微信</a><a href="#">QQ</a><a href="#">新浪微博</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="/Shoot_Idiot/public/js/bootstrap.min.js"></script>
<script src="/Shoot_Idiot/public/js/main.js"></script>
</body>
</html>