<%--
  Created by IntelliJ IDEA.
  User: LuWenjing
  Date: 2017/6/1
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>XuptOJ——登录</title>
    <meta charset="utf-8">
    <meta name="viewpost" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="stylesheet" type="text/css" href="/css/login.css">
    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<nav>
    <div class="nav-title"><a href="#">XuptOJ</a></div>
    <div class="nav-list">
        <ul>
            <a href="#"><li>首页</li></a>
            <a href="#"><li>题库</li></a>
            <a href="#"><li>论坛</li></a>
            <a href="#"><li>关于</li></a>
        </ul>
    </div>
    <div class="nav-login">
        <div class="login"><a href="#">登录</a></div>
        <div class="register"><a href="#">注册</a></div>
    </div>
    <div class="nav-user">
        <div class="user-img">
            <a href="#"><img src="images/1147.jpg" /></a>
        </div>
    </div>
</nav>

<div class="shadow"></div>

<article>

    <section class="mainbody">
        <div class="form-container">
            <form action="#" method="post">
                <div>
                    <a class="h3 choice" style="border-bottom: red 2px solid;" href="#">登录</a>
                    <a class="h3 choice" style="color: #ccc" href="#">注册</a>
                </div>
                <div>
                    <input type="text" name="username" placeholder="用户名或邮箱" id="username" class="form-control">
                </div>
                <div>
                    <input type="password" name="userpass" placeholder="密码" id="userpass" class="form-control">
                </div>
                <div>
                    <input type="submit" name="submit" value="注册" id="submit" class="btn btn-primary">
                </div>
                <div><a href="#">忘记密码？</a></div>
                <div class="errormess">错误信息</div>
            </form>
        </div>
    </section>

</article>


<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

</script>

</body>
</html>