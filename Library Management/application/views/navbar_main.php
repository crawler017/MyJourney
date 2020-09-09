<!-- NAVBAR
================================================== -->
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>

            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="index.php">主页</a></li>
                <li class="dropdown">
                  <li><a href="<?php echo site_url('Login/login1'); ?>">登录</a></li>
                  <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理<span class="caret"></span></a>
                      <ul class="dropdown-menu">
                          <li><a href="<?php echo site_url('BookAdd/add'); ?>">添加图书</a></li>
                          <li><a href="<?php echo site_url('BookList/book'); ?>">图书列表</a></li>
                          <li><a href="<?php echo site_url('BorrowList/borrow'); ?>">在借列表</a></li>
                          <li><a href="<?php echo site_url('BackList/back'); ?>">已归还列表</a></li>
                          <li><a href="<?php echo site_url('BlackList/black'); ?>">黑名单列表</a></li>
                      </ul>
                  </li>
                 <li><a href="#">数据统计</a></li>
                <li><a href="#">关于</a></li>
                <li><a href="#">联系我们</a></li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>
