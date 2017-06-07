<%@ page import="com.web.entity.Blogmain" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.web.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: jing
  Date: 2017/3/3
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>论坛</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <link href="/css/blog.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <style>
        .blog-ming{
            color: #5a5a5a;
            text-decoration: none;
        }
        .blog-ming:hover{
            color: #5a5a5a;
            text-decoration: none;
        }
        .blog-ming div:hover{
            background: #f7f7f7;
        }

    </style>

</head>

<body>
<!-- 顶部导航 -->
<%@include file="nav.jsp"%>



<!--侧边栏按钮-->
<div class="aside-btn">
    <div><a href="/blog/publish"><img src="/images/write.png" title="发帖"/></a></div>
    <div><a href="/blog"><img src="/images/update.png" title="刷新"/></a></div>
    <div><a href="#"><img src="/images/gotop.png" title="回顶部"/></a></div>
</div>

<!--主要内容-->
<div class="main-container">
    <div class="xunqin-blog-header">
        <div>
            <a href="/blog/publish" class="btn btn-primary">发帖</a>
        </div>
    </div>
    <!--论坛内容-->
    <div class="blog-content">
        <!--每个贴一个item-->
        <div class="blog-item">
            <!--用户图像，昵称，爱心值，发布日期-->
            <%
                List<Blogmain> blogmainList=(ArrayList)request.getAttribute("Blogmain");
                List<User> userList = (ArrayList)request.getAttribute("User");
                if(blogmainList!=null && userList!=null){
                    for(int i=0;i<blogmainList.size();i++){
            %>
                <div class="blog-item-user">
                    <div class="usericon-div">
                        <a href="/<%=userList.get(i).getUsername()%>" class="usericon-a" target="_blank">
                            <img src="/images/<%=userList.get(i).getPicture()%>" class="usericon-img">
                        </a>
                    </div>
                    <%--<div class="petname-love-time">--%>
                        <%--<a href="/<%=userList.get(i).getUsername()%>" target="_blank" class="petname" style="text-decoration: none"><%=userList.get(i).getNickname()%></a>--%>
                        <%--<span class="love-grade">--%>
                            <%--<img src="/images/love.jpg" class="love-heart">--%>
                            <%--<img src="/images/love.jpg" class="love-heart">--%>
                            <%--<img src="/images/love.jpg" class="love-heart">--%>
                        <%--</span><br>--%>
                        <%--<span class="publish-time">/<%=blogmainList.get(i).getCreatedate()%></span>--%>
                    <%--</div>--%>
                </div>

                <!--用户发表的内容-->
                <a href="/blog/showblog/<%=blogmainList.get(i).getId()%>" class="blog-ming" title="点击进入">
                    <div class="blog-content-main">
                        <div class="blog-header-user">
                            <span>
                                <%=blogmainList.get(i).getTitle()%>
                            </span>
                        </div>
                        <div class="blog-content-user" name="content">
                            <p class="blog-text">
                                <%=blogmainList.get(i).getContent()%>
                            </p>
                        </div>
                    </div>
                </a>
                <!--浏览量，评论数量-->
                <div class="blog-footer">
                    <a href="###" style="text-decoration: none">
                        浏览量&nbsp;<span>123</span>
                    </a>
                    <a href="###" style="text-decoration: none;margin-left: 5px;">
                        评论&nbsp;<span>45</span>
                    </a>
                </div>
            <hr>
            <%
                    }
                }
            %>

        </div>
    </div>

    <div class="text-center">
        <div>
            <ul class="pagination">
                <li><a href="/blog?nowpage=1">首页</a></li>
                <li><a href="/blog?nowpage=${NowPage-1>=1?NowPage-1:1}">上一页</a></li>
                <li><a href="/blog?nowpage=${NowPage+1<=MaxPage?NowPage+1:MaxPage}">
                    下一页</a></li>
                <li><a href="/blog?nowpage=${MaxPage}">末页</a></li>
            </ul>
        </div>
    </div>
</div>

<hr>


<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.qqFace.js"></script>

<script>
    replace_em("content");
    function replace_em(str) {
        var str = document.getElementsByName(str);
        for (var i = 0; i < str.length; i++) {
            var sts=replace_ems(str[i].innerHTML);
            str[i].innerHTML=sts;
        }
    }

    function replace_ems(str){
        var str = str.replace(/\[em_([0-9]*)\]/g, '<img src="/images/$1.gif" border="0" />');
        return str;
    }

    function gettodydate(){
        var date = new Date();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        document.getElementById("today").innerHTML = month + "月" + strDate + "日";
    }
    gettodydate();
</script>


</body>
</html>
