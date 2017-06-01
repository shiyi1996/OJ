<%@ page import="java.util.ArrayList" %>
<%@ page import="com.web.entity.BasicVo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Problem" %><%--
  Created by IntelliJ IDEA.
  User: LuWenjing
  Date: 2017/6/1
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>XuptOJ——题库</title>
    <meta charset="utf-8">
    <meta name="viewpost" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="stylesheet" type="text/css" href="/css/tiku.css">
    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<nav>
    <div class="nav-title"><a href="index.html">HighOJ</a></div>
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

<article>

    <section class="mainbody">
        <div class="classify-nav">
            <ul class="list-nav">
                <li>按算法分类
                    <ul>
                        <li><a href="/p?algorithm=&difficulty=${difficulty}&structure=${structure}">所有</a></li>
                        <li><a href="/p?algorithm=KMP&difficulty=${difficulty}&structure=${structure}">分治</a></li>
                        <li><a href="/p?algorithm=贪心&difficulty=${difficulty}&structure=${structure}">贪心</a></li>
                        <li><a href="/p?algorithm=链表&difficulty=${difficulty}&structure=${structure}">链表</a></li>
                        <li><a href="/p?algorithm=搜索&difficulty=${difficulty}&structure=${structure}">搜索</a></li>
                        <li><a href="/p?algorithm=字符串&difficulty=${difficulty}&structure=${structure}">字符串</a></li>
                        <li><a href="/p?algorithm=动态规划&difficulty=${difficulty}&structure=${structure}">动态规划</a></li>
                        <li><a href="/p?algorithm=图论&difficulty=${difficulty}&structure=${structure}">图论</a></li>
                    </ul>
                </li>
                <li>按难易程度分类
                    <ul>
                        <li><a href="/p?algorithm=${algorithm}&difficulty=简单&structure=${structure}">简单</a></li>
                        <li><a href="/p?algorithm=${algorithm}&difficulty=中等&structure=${structure}">中等</a></li></li>
                        <li><a href="/p?algorithm=${algorithm}&difficulty=难&structure=${structure}">难</a></li>
                        <li><a href="/p?algorithm=${algorithm}&difficulty=超难&structure=${structure}">超难</a></li>
                    </ul>
                </li>
                <li>按数据结构分类
                    <ul>
                        <li><a href="/p?algorithm=${algorithm}&difficulty=${difficulty}&structure=线性结构">线性结构</a></li>
                        <li><a href="/p?algorithm=${algorithm}&difficulty=${difficulty}&structure=树结构">树结构</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="ti-list">
            <table class="table table-hover table-strip table-responsive">
                <thead>
                <tr>
                    <th>题目编号</th>
                    <th>名称</th>
                    <th>难度等级</th>
                    <th>通过人数</th>
                    <th>通过率</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<BasicVo> basicVoArrayList=(ArrayList<BasicVo>) request.getAttribute("problemList");
                    for(BasicVo basicVo:basicVoArrayList){
                        Problem problem=(Problem)basicVo;
                %>
                    <tr>
                        <td><span class="status accepted"></span><%=problem.getProblem_id()%></td>
                        <td><a href="#"><%=problem.getTitle()%></a></td>
                        <td><%=problem.getDifficulty()%></td>
                        <td>2345</td>
                        <td>22%</td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
        <div class="page">
            <a href="/p?thenstart=${pagenow - 1<1?1:pagenow-1}&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}"><</a>
            <%
                int pagemax = (Integer)request.getAttribute("pagemax");
                int pagenow = (Integer)request.getAttribute("pagenow");
        if (pagemax < 10){
        for (int i = 0; i < pagemax; i++){
            if (i + 1 == pagenow){
        %>
            <a href="/p?thenstart=<%=i+1 %>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}" class="activity"><%= i + 1%></a>
       <%
        }else
            {
       %>
        <a href="/p?thenstart=<%=i+1 %>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}"><%= i + 1%></a>
       <%     }
            }
        }
        else if (pagenow < 4)
        {

        for (int i = 0; i < 5; i++){
            if (i + 1 == pagenow){
        %>
        <a href="/p?thenstart=<%=i+1 %>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}" class="activity"><%= i+1 %></a>
        <%}else{%>
            <a href="/p?thenstart=<%=i+1 %>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}"><%= i + 1%></a>
        <%
            }
        }
        %>
        <a href="#">...</a>
        <a href="/p?thenstart=<%= pagemax-2 %>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}"><%= pagemax-2%></a>
        <a href="/p?thenstart=<%= pagemax-1 %>algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}"><%= pagemax-1%></a>
        <a href="/p?thenstart=<%= pagemax%>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}"><%= pagemax %></a>

        <% }else if (pagenow >= 4 && pagenow < pagemax - 2){%>
        <a href="/p?thenstart=1&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}">1</a>
        <a href="#">...</a>'+
        <a href="/p?thenstart=<%= pagenow-2 %>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}"><%=pagenow-2%></a>
        <a href="/p?thenstart=<%= pagenow-1 %>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}"><%=pagenow-1%></a>
        <a href="/p?thenstart=<%= pagenow %>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}" class="activity"><%=pagenow%></a>
        <a href="/p?thenstart=<%= pagenow+1%>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}"><%=pagenow + 1%></a>
        <a href="/p?thenstart=<%= pagenow+2%>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}"><%=pagenow + 2%></a>

        <a href="#">...</a>
        <a href="/p?thenstart=<%= pagemax%>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}"><%=pagemax%></a>

            <%}
            else if (pagenow >= pagemax-2){%>

            <a href="/p?thenstart=1&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}">1</a>
            <a href="/p?thenstart=2&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}">2</a>
            <a href="/p?thenstart=3&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}">3</a>

            <a href="#">...</a>
        <%for (int i = pagemax - 5; i < pagemax; i++){
        if (i + 1 == pagenow){
          %>
       <a href="/p?thenstart=<%= i+1%>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}" class="activity"><%= i + 1%>/a>
       <% }else{%>
           <a href="/p?thenstart=<%= i+1%>&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}"><%= i + 1%>/a>
        <%
               }
        }
        }%>
        <a href="/p?thenstart=${pagenow + 1 > pagemax ? pagenow : pagenow + 1}&algorithm=${algorithm}&difficulty=${difficuty}&structure=${structure}">></a>
        </div>
    </section>

    <footer>
        <div>
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


</script>

</body>
</html>