<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>登陆</title>
        <link href="/Shoot_Idiot/public/css/bootstrap.min.css" rel="stylesheet">
        <link href="/Shoot_Idiot/public/css/fontawesome-all.min.css" rel="stylesheet">
        <link href="/Shoot_Idiot/public/css/iofrm-style.css" rel="stylesheet">
        <link href="/Shoot_Idiot/public/css/iofrm-theme.css" rel="stylesheet">
    </head>
<body>
        <script type="text/javascript">
            function enter() 
            { 
              var username=document.getElementById("username").value;//获取form中的用户名 
              var password=document.getElementById("password").value; //获取form中的密码
              var regex=/^[/s]+$/;//声明一个判断用户名前后是否有空格的正则表达式 
              if(regex.test(username)||username.length==0)//判定用户名的是否前后有空格或者用户名是否为空 
                { 
                  alert("用户名格式不对"); 
                  return false; 
                } 
              if(regex.test(password)||password.length==0)//同上述内容 
              { 
                alert("密码格式不对"); 
                return false; 
              } 
              return true; 
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
                            <a href="<?php echo site_url('Login/login1'); ?>">登陆</a><a href="<?php echo site_url('Register/register1'); ?>">注册</a>
                        </div>
                        <form action="<?php echo site_url('Login/lCheck'); ?>" method="post" onsubmit="return enter()">
                            <input class="form-control" type="text" name="username" id="username" placeholder="用户名"required>
                            <input class="form-control" type="password" name="password" id="password" placeholder="密码"required>
                            <div class="form-button">
                                <button id="submit" type="submit" class="ibtn">登陆</button> <a href="#">忘记密码?</a>
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