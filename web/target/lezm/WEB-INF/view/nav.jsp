<%--
  Created by IntelliJ IDEA.
  User: LuWenjing
  Date: 2017/6/2
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>

<!--输出,条件,迭代标签库-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="/js/nav.js"></script>

<nav>
    <div class="nav-title">
        <a href="/">XuptOJ</a>
        <button class="navbar-toggle collapsed" onclick="showlist()">
            <span class="sr-only">切换导航</span>
            <span class="icon-bar" style="background: #fff;"></span>
            <span class="icon-bar" style="background: #fff"></span>
            <span class="icon-bar" style="background: #fff"></span>
        </button>
    </div>
    <div class="nav-list">
        <ul>
            <a href="/"><li>首页</li></a>
            <a href="/p"><li>题库</li></a>
<<<<<<< HEAD
            <a href="/blog"><li>论坛</li></a>

            <a href="/sort"><li>排行榜</li></a>
            <a href="/record"><li>关于</li></a>
=======
            <a href="/record"><li>评测</li></a>
            <a href="/sort"><li>排行榜</li></a>
            <a href="/blog"><li>论坛</li></a>
>>>>>>> 479bee99020c69b0c5d217e92e4d427b9de1c01f

        </ul>
    </div>
    <c:choose>
        <c:when test="${empty user}">
            <div class="nav-login">
                <div class="login"><a href="/login">登录</a></div>
                <div class="register"><a href="/register">注册</a></div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="nav-user">
                <div class="user-img">
                    <a href="/usermess"><img src="/images/${user.picture}" /></a>
                </div>

                <div class="quit"><a href="/quit">退出登录</a></div>

            </div>
        </c:otherwise>
    </c:choose>
</nav>
