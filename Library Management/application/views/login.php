<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="/Shoot_Idiot/public/js/jquery-3.3.1.min.js"></script>
        <title>登录</title>
        <script src="/Shoot_Idiot/public/js/jquery-3.3.1.min.js"></script>
        <link href="/Shoot_Idiot/public/css/bootstrap.min.css" rel="stylesheet">
        <link href="/Shoot_Idiot/public/css/fontawesome-all.min.css" rel="stylesheet">
        <link href="/Shoot_Idiot/public/css/iofrm-style.css" rel="stylesheet">
        <link href="/Shoot_Idiot/public/css/iofrm-theme.css" rel="stylesheet">
    </head>
<body>
    <div class="form-body">
        <div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <div class="website-logo-inside">
                            <a href="index.php">
                            </a>
                        </div>
                        <h3>用户登录</h3>
                        <div class="page-links">
                            <a href="#"></a><a href="#"></a>
                        </div>
                        <form method="post" action="<?php echo site_url('Login/doLogin'); ?>" onsubmit="return enter()">
                            <input class="form-control" type="text" name="username" id="username" placeholder="用户名"required>
                            <input class="form-control" type="password" name="password" id="password" placeholder="密码"required>
                            <div class="form-button">
                                <button id="submit" type="submit" class="ibtn">登录</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="/Shoot_Idiot/public/js/bootstrap.min.js"></script>
<script src="/Shoot_Idiot/public/js/main.js"></script>
</body>
</html>