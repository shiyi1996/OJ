<%--
  Created by IntelliJ IDEA.
  User: LuWenjing
  Date: 2017/6/2
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<script src="/js/nav.js"></script>

<nav>
    <div class="nav-title">
        <a href="#">XuptOJ</a>
        <button class="navbar-toggle collapsed" onclick="showlist()">
            <span class="sr-only">切换导航</span>
            <span class="icon-bar" style="background: #fff;"></span>
            <span class="icon-bar" style="background: #fff"></span>
            <span class="icon-bar" style="background: #fff"></span>
        </button>
    </div>
    <div class="nav-list">
        <ul>
            <a href="#"><li>首页</li></a>
            <a href="#"><li>题库</li></a>
            <a href="#"><li>论坛</li></a>
            <a href="#"><li>关于</li></a>
        </ul>
    </div>
    <div class="nav-login">
        <div class="login"><a href="/login">登录</a></div>
        <div class="register"><a href="/register">注册</a></div>
    </div>
    <div class="nav-user" style="display: none">
        <div class="user-img">
            <a href="#"><img src="/images/4.jpg" /></a>
        </div>
    </div>
</nav>
