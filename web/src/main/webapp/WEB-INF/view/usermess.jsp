<%--
  Created by IntelliJ IDEA.
  User: LuWenjing
  Date: 2017/6/7
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>XuptOJ——测评</title>
    <meta charset="utf-8">
    <meta name="viewpost" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="stylesheet" type="text/css" href="/css/record.css">
    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<!--导入导航栏-->
<%@include file="nav.jsp"%>

<article>
    <section class="mainwarp">
        <div class="allrecord">
            <form role="form" method="post" action="/usermess" style="width: 70%;margin:0 auto">
                <div class="form-group">
                    <label for="username">用户图像：</label>
                    <div><img src="/images/${user.picture}" style="width: 80px; height: 80px"></div>
                </div>
                <div class="form-group">
                    <label for="username">用户名：</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" value="${user.username}">
                </div>
                <div class="form-group">
                    <label for="userpass">昵称：</label>
                    <input type="text" class="form-control" id="userpass" name="userpass" placeholder="请输入昵称" value="${user.nickname}">
                </div>
                <div class="form-group">
                    <label for="useremail">邮箱：</label>
                    <input type="text" class="form-control" id="useremail" name="useremail" placeholder="请输入昵称" value="${user.email}">
                </div>
                <div class="form-group">
                    <label for="userdesc">个人描述：</label>
                    <input type="text" class="form-control" id="userdesc" name="userdesc" placeholder="请输入个人描述" value="${user.school}">
                </div>
                <button type="submit" class="btn btn-primary">提交</button>
            </form>
        </div>
        <div class="chart">
            <canvas id="canvas" style="height:50vh; width:30vw"></canvas>
            <div>
                <div><label>总通过题数：</label><span class="ac-num">890</span></div>
                <div><label>总提交次数：</label><span class="allsub-num">435</span></div>
                <div><label>通过率：</label><span class="ac-rate">40%</span></div>
            </div>
        </div>
    </section>

    <footer>
        <div>
            <hr>
            <div>
                <p>© Copyright XuptOJ</p>
                <p>2011-2015 京ICP备12034000号-2 京公网安备11010802011553号</p>
                <p>Lovingly made by WPH95</p>
            </div>
        </div>
    </footer>

</article>


<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/Chart.min.js"></script>
<script type="text/javascript" src="/js/excanvas.js"></script>
<script type="text/javascript" src="/js/record.js"></script>

<script type="text/javascript">
    showChart();
</script>

</body>
</html>