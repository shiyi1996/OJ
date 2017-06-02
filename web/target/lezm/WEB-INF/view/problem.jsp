<%@ page import="java.util.ArrayList" %>
<%@ page import="com.web.entity.BasicVo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.Problem" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
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
                        <a href="/p?algorithm=&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><li id="1"><span>所有</span></li></a>
                        <a href="/p?algorithm=分治&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><li id="2"><span>分治</span></li></a>
                        <a href="/p?algorithm=贪心&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><li id="3"><span>贪心</span></li></a>
                        <a href="/p?algorithm=链表&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><li id="4"><span>链表</span></li></a>
                        <a href="/p?algorithm=搜索&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><li id="5"><span>搜索</span></li></a>
                        <a href="/p?algorithm=字符串&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><li id="6"><span>字符串</span></li></a>
                        <a href="/p?algorithm=动态规划&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><li id="7"><span>动态规划</span></li></a>
                        <a href="/p?algorithm=图论&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><li id="8"><span>图论</span></li></a>
                    </ul>
                </li>

                <li>按难易程度分类
                    <ul>
                        <a href="/p?algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=&structure=${structure eq 'nullthree'?'':structure}"><li id="9"><span>所有</span></li></a>
                        <a href="/p?algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=简单&structure=${structure eq 'nullthree'?'':structure}"><li id="10"><span>简单</span></li></a>
                        <a href="/p?algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=中等&structure=${structure eq 'nullthree'?'':structure}"><li id="11"><span>中等</span></li></a>
                        <a href="/p?algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=难&structure=${structure eq 'nullthree'?'':structure}"><li id="12"><span>难</span></li></a>
                        <a href="/p?algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=超难&structure=${structure eq 'nullthree'?'':structure}"><li id="13"><span>超难</span></li></a>
                    </ul>
                </li>
                <li>按数据结构分类
                    <ul>
                        <a href="/p?algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure="><li id="14"><span>所有</span></li></a>
                        <a href="/p?algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=线性结构"><li id="15"><span>线性结构</span></li></a>
                        <a href="/p?algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=树结构"><li id="16"><span>树结构</span></li></a>
                    </ul>
                </li>
            </ul>
            <script>
                <%
                    Map<String,Integer> map=new HashMap<String,Integer>();
                    map.put("nullone",1);
                    map.put("分治",2);
                    map.put("贪心",3);
                    map.put("链表",4);
                    map.put("搜索",5);
                    map.put("字符串",6);
                    map.put("动态规划",7);
                    map.put("图论",8);
                    map.put("nulltwo", 9);
                    map.put("简单", 10);
                    map.put("中等", 11);
                    map.put("难", 12);
                    map.put("超难", 13);
                    map.put("nullthree", 14);
                    map.put("线性结构", 15);
                    map.put("树结构", 16);
                    String str1 = (String)request.getAttribute("algorithm");
                    String str2 = (String)request.getAttribute("difficulty");
                    String str3 = (String)request.getAttribute("structure");
                    System.out.println("str1"+str1+"str2"+str2+"str3"+str3);
                    int id1 = map.get(str1);
                    int id2 = map.get(str2);
                    int id3 = map.get(str3);
                %>
                document.getElementById(<%= id1 %> +'').innerHTML += '<span class="glyphicon glyphicon-ok" style="display:inline-block; float:right; padding:5px 0"></span>';
                document.getElementById(<%= id2 %> +'').innerHTML += '<span class="glyphicon glyphicon-ok" style="display:inline-block; float:right; padding:5px 0"></span>';
                document.getElementById(<%= id3 %> +'').innerHTML += '<span class="glyphicon glyphicon-ok" style="display:inline-block; float:right; padding:5px 0"></span>';

                </script>
        </div>
        <% String error = (String)request.getAttribute("error");
            if (error == null)
            {
        %>
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
                        <td><a href="/p/<%=problem.getProblem_id()%>"><%=problem.getTitle()%></a></td>
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
            <%
                int pagemax = (Integer)request.getAttribute("pagemax");
                int pagenow = (Integer)request.getAttribute("pagenow");
                if (pagemax > 1){%>
                    <a href="/p?thenstart=${pagenow - 1<1?1:pagenow-1}&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><</a>

            <%if (pagemax < 10){
        for (int i = 0; i < pagemax; i++){
            if (i + 1 == pagenow){
        %>
            <a href="/p?thenstart=<%=i+1 %>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}" class="activity"><%= i + 1%></a>
       <%
        }else
            {
       %>
        <a href="/p?thenstart=<%=i+1 %>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><%= i + 1%></a>
       <%     }
            }
        }
        else if (pagenow < 5)
        {

        for (int i = 0; i < 5; i++){
            if (i + 1 == pagenow){
        %>
        <a href="/p?thenstart=<%=i+1 %>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}" class="activity"><%= i+1 %></a>
        <%}else{%>
            <a href="/p?thenstart=<%=i+1 %>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><%= i + 1%></a>
        <%
            }
        }
        %>
        <a href="#">...</a>
        <a href="/p?thenstart=<%= pagemax-2 %>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><%= pagemax-2%></a>
        <a href="/p?thenstart=<%= pagemax-1 %>algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><%= pagemax-1%></a>
        <a href="/p?thenstart=<%= pagemax%>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><%= pagemax %></a>

        <% }else if (pagenow >= 4 && pagenow <= pagemax - 4){%>
        <a href="/p?thenstart=1&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}">1</a>
        <a href="#">...</a>
        <a href="/p?thenstart=<%= pagenow-2 %>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><%=pagenow-2%></a>
        <a href="/p?thenstart=<%= pagenow-1 %>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><%=pagenow-1%></a>
        <a href="/p?thenstart=<%= pagenow %>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}" class="activity"><%=pagenow%></a>
        <a href="/p?thenstart=<%= pagenow+1%>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><%=pagenow + 1%></a>
        <a href="/p?thenstart=<%= pagenow+2%>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><%=pagenow + 2%></a>

        <a href="#">...</a>
        <a href="/p?thenstart=<%= pagemax%>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><%=pagemax%></a>

            <%}
            else if (pagenow > pagemax-4){%>

            <a href="/p?thenstart=1&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}">1</a>
            <a href="/p?thenstart=2&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}">2</a>
            <a href="/p?thenstart=3&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}">3</a>

            <a href="#">...</a>
        <%for (int i = pagemax - 5; i < pagemax; i++){
        if (i + 1 == pagenow){
          %>
       <a href="/p?thenstart=<%= i+1%>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}" class="activity"><%= i + 1%></a>
       <% }else{%>
           <a href="/p?thenstart=<%= i+1%>&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}"><%= i + 1%></a>
        <%
               }
        }
        }%>
        <a href="/p?thenstart=${pagenow + 1 > pagemax ? pagenow : pagenow + 1}&algorithm=${algorithm eq 'nullone'?'':algorithm}&difficulty=${difficulty eq 'nulltwo'?'':difficulty}&structure=${structure eq 'nullthree'?'':structure}">></a>
        </div>
       <% }
       }
       else{%>
        <div style="text-align: center; color: #bbb; margin-top:50px"><%= error%></div>
        <%
            }
        %>
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