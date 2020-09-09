<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="login-page">
  <div class="form">
<form action="${pageContext.request.contextPath}/user/login"
      method="post">客户关系管理系统
      <input type="text" name="name" placeholder="用户名"/>
      <input type="password" name="pwd" placeholder="密码"/>
      <button>登录</button>
    </form>
  </div>
</div>

<!-- jQuery -->
<script src="js/login.js"></script>

<!-- Bootstrap Core CSS -->
<link href="css/login.css" rel="stylesheet">