<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/23 0023
  Time: 下午 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HighOJ——首页</title>
    <meta charset="utf-8">
    <meta name="viewpost" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/index.css">

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
    <section class="mainbody-first">
        <div style="font-size:2rem">在线算法评测和交流平台</div>
        <div style="font-size:3rem; font-weight: bold;color: #fff">HighOJ</div>
        <div style="font-size:2rem">敢挑战新的难度吗？敢，就来</div>
        <div style="font-size:1.5rem">加入社区，发现不一样的自己</div>
        <div>
            <button class="btn btn-primary btn-lg">进入社区</button>
        </div>
    </section>
    <section class="mainbody-second">
        <a href="#dir1" class="item item1"><div>题库</div></a>
        <a href="#dir2" class="item item2"><div>天梯</div></a>
        <a href="#dir3" class="item item3"><div>论坛</div></a>
    </section>
    <section class="mainbody-third">
        <div class="row-dir" id="dir1">
            <div><img src="images/9.jpg" /></div>
            <div><p>每次因为看见别人写的新东西，自己就也想做一个，不知道是不是一个好习惯哎。微信小程序已经出来很久了，</p></div>
        </div>
        <hr>
        <div class="row-dir" id="dir2">
            <div><p>每次因为看见别人写的新东西，自己就也想做一个，不知道是不是一个好习惯哎。微信小程序已经出来很久了，</p></div>
            <div><img src="images/9.jpg" /></div>
        </div>
        <hr>
        <div class="row-dir" id="dir3">
            <div><img src="images/9.jpg" /></div>
            <div><p>每次因为看见别人写的新东西，自己就也想做一个，不知道是不是一个好习惯哎。微信小程序已经出来很久了，</p></div>
        </div>
    </section>

    <footer>
        <div>
            <a class="btn btn-primary btn-lg">快快加入吧！</a>
            <div class="foot-word">体验从未有过的体验</div>
            <hr>
            <div>
                <p>© Copyright HighOJ</p>
                <p>2011-2015 京ICP备12034000号-2 京公网安备11010802011553号</p>
                <p>Lovingly made by WPH95</p>
            </div>
        </div>
    </footer>

</article>


<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(window).scroll(function () {
        if ($("nav").offset().top > 200){
            $("nav").addClass("nav-background");
        }
        else{
            $("nav").removeClass("nav-background");
        }
    });
</script>

</body>
</html>
