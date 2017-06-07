<%@ page import="java.util.ArrayList" %>
<%@ page import="com.web.entity.Blogleave" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: jing
  Date: 2017/3/4
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人主页</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <link href="/css/blog.css" rel="stylesheet">
    <link href="/css/publishblog.css" rel="stylesheet">
    <link href="/css/lookblog.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <style>
        /*.househost-user-pic{*/
            /*width:100px;*/
            /*height:100px;*/
        /*}*/
    </style>

</head>

<body>
<!-- 顶部导航 -->
<%@include file="nav.jsp"%>



<!--侧边栏按钮-->
<div class="aside-btn">
    <div><a href="#write-dialog"><img src="/images/reply.png" title="回复"/></a></div>
    <div><a href="/blog/showblog/${Blogmain.id}?nowpage=${NowPage}"><img src="/images/update.png" title="刷新"/></a></div>
    <div><a href="#"><img src="/images/gotop.png" title="回顶部"/></a></div>
</div>

<!--主要内容-->
<div class="main-container">
    <div class="xunqin-blog-header">
        <div>
            <a href="/blog/publish" class="btn btn-primary">发帖</a>
        </div>
    </div>
    <!--帖子标题-->
    <div class="look-blog-title">
        ${Blogmain.title}
    </div>
    <!--楼主-->
    <div class="househost">
        <div class="househost-mess">
            <div class="househost-pic">
                <a href="/${Usermess.nickname}">
                    <img src="/images/${Usermess.picture}"/>
                </a>
            </div>
            <div class="change-direct">
                <div class="househost-name">
                    <a href="/${Usermess.username}" target="_blank">${Usermess.nickname}</a>
                </div>
                <%--<div class="househost-love">--%>
                    <%--<!--爱心值-->--%>
                    <%--<img src="/images/love.jpg"/>--%>
                <%--</div>--%>
            </div>
        </div>
        <div class="househost-content" style="background: #f1fafb;">
            <div style="word-break: break-all" name="ming">${Blogmain.content}</div>
            <%--<div class="househost-publish-pic">--%>
            <%--<!--显示评论图片-->--%>
            <%--<div class="pic-margin">--%>
            <%--<img src="/images/33.jpg" style="width:100%; height: 200px;"/>--%>
            <%--</div>--%>
            <%--</div>--%>
            <div class="househost-footer">
                <div class="publish-date">
                    ${Blogmain.createdate}
                </div>
                <div class="reply-btn">
                    <a href="#write-dialog">回复</a>
                </div>
            </div>
        </div>
    </div>

    <%
        List<User> usermessList=(ArrayList)request.getAttribute("MainUsermess");
        List<Blogleave> blogleaveList=(ArrayList)request.getAttribute("MainBlogleave");
        List leaves = (ArrayList)request.getAttribute("Leaves");
        List user = (ArrayList)request.getAttribute("Users");
        if(blogleaveList!=null && usermessList!=null){
            for(int i=0;i<blogleaveList.size();i++){
                List<Blogleave> blogleaves=null;
                List<User> usermesses=null;
                if(leaves.get(i)!=null) {
                    blogleaves = (ArrayList<Blogleave>) leaves.get(i);
                }
                if(user.get(i)!=null) {
                    usermesses = (ArrayList<User>) user.get(i);
                }
    %>
    <!--回复楼主的评论-->
    <div class="househost-reply-container">
        <!--每一条回复-->
        <div class="househost-reply-item">
            <!--左边显示用户的信息-->
            <div class="reply-user-mess">
                <div class="reply-user-pic">
                    <a href="/<%=usermessList.get(i).getUsername() %>" target="_blank">
                        <img src="/images/<%=usermessList.get(i).getPicture()%>"/>
                    </a>
                </div>
                <div class="change-direct">
                    <div class="reply-user-name">
                        <a href="/<%=usermessList.get(i).getUsername() %>" target="_blank">
                            <%=usermessList.get(i).getNickname()%>
                        </a>
                    </div>
                    <%--<div class="reply-user-love">--%>
                        <%--<!--爱心值-->--%>
                        <%--<img src="/images/love.jpg"/>--%>
                    <%--</div>--%>
                </div>
            </div>
            <!--右边显示用户回复的内容-->
            <div class="reply-user-content">
                <!--用户回复的文字-->
                <p name="content"><%=blogleaveList.get(i).getLeave_content()%></p>
                <!--用户回复的日期-->
                <div class="reply-user-footer">
                    <div class="publish-date">
                        <%=blogleaveList.get(i).getCreatedate()%>
                    </div>
                    <div class="reply-btn">
                        <a href="###" onclick="show('div<%=i%>','<%=i%>')">回复</a>
                    </div>
                </div>
                <!--回复该楼的评论-->
                <div class="reply-content" id="div<%=i%>">
                    <%
                        if(blogleaves!=null && usermesses!=null){
                            for (int j = 0; j < blogleaves.size(); j++)
                            {
                    %>
                    <div class="reply-item">
                        <div class="reply-item-content">
                            <div class="reply-item-pic">
                                <a href="/<%=usermesses.get(j).getUsername() %>" target="_blank">
                                    <img src="/images/<%=usermesses.get(j).getPicture() %>"/>
                                </a>
                            </div>
                            <div class="reply-item-text">
                                &nbsp;<a href="/<%=usermesses.get(j).getUsername() %>" target="_blank" id="<%=i%><%=j%>"><%=usermesses.get(j).getNickname() %></a>：&nbsp;<span name="leaveword"><%=blogleaves.get(j).getLeave_content()%></span>
                            </div>
                        </div>
                        <div class="reply-user-footer">
                            <div class="publish-date" style="margin-top:0">
                                <%=blogleaves.get(j).getCreatedate()%>
                            </div>
                            <div class="reply-btn" style="margin-top:0">
                                <a href="###" onclick="reply('<%=i%><%=j%>','<%=i%>')">回复</a>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <div class="reply-dialog">
                    <img src="/images/101.gif"  class="emotion<%=i%>" >
                    <textarea rows="2" id="<%=i%>" class="form-control"></textarea>
                    <button class="btn btn-sm btn-primary" style="margin-top:10px"
                            onclick="publish(<%=blogleaveList.get(i).getId()%>,'<%=i%>', 'div<%=i%>')">发表</button>
                </div>
            </div>
        </div>
    </div>
    <%
            }
        }
    %>

    <div class="text-center">
        <div>
            <ul class="pagination">
                <li><a href="/blog/showblog/${Blogmain.id}?nowpage=1">首页</a></li>
                <li><a href="/blog/showblog/${Blogmain.id}?nowpage=${NowPage-1>=1?NowPage-1:1}">上一页</a></li>
                <li><a href="/blog/showblog/${Blogmain.id}?nowpage=${NowPage+1<=MaxPage?NowPage+1:MaxPage}">
                    下一页</a></li>
                <li><a href="/blog/showblog/${Blogmain.id}?nowpage=${MaxPage}">末页</a></li>
            </ul>
        </div>
    </div>

    <!--发表框-->
    <div class="write-dialog" id="write-dialog">
        <form action="/blog/addleave?mainid=${Blogmain.id}" method="post" role="form" class="dialog">
            <div class="qqface">
                <img src="/images/101.gif"  class="emotion" style="margin: 5px;cursor: pointer">
            </div>
            <textarea rows="6" type="text" id="write-mess" name="write-mess"
                      placeholder="写下你想说的吧……" class="form-control" autofocus>
            </textarea>
            <div class="btngroup">
                <div class="btn-padding">
                    <input type="reset" class="btn btn-default" value="取消">
                </div>
                <div class="btn-padding">
                    <input type="submit" class="btn btn-primary" value="发表">
                </div>
            </div>
        </form>
    </div>


</div>
<hr>


<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.qqFace.js"></script>
<script src="/js/lookblog.js"></script>

<script>

    <% int n = blogleaveList.size();
    for (int i = 0; i < n; i++)
    {
    %>
    $('.emotion<%=i%>').qqFace({

        id : 'facebox',

        assign:'<%=i%>',

        path:'/images/'	//表情存放的路径

    });
    <%
    }
    %>

    function publish(blogleaveid,dialogid,divid)
    {
        var req=null;
        if (window.XMLHttpRequest){
            req = new XMLHttpRequest();
        }else{
            req = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if(req!=null){
            req.open('post','/blog/addLeaveword?mainid=${Blogmain.id}',true);
            req.setRequestHeader("Content-Type",
                    "application/x-www-form-urlencoded");
            req.onreadystatechange = function () {
                if(req.readyState==4){
                    var dialog = doc.getElementById(dialogid);
                    dialog.value = "";
                    var text  = req.responseText;
                    var content_reply = doc.getElementById(divid);
                    content_reply.innerHTML +=
                            '<div class="reply-item">'+
                            '<img src="/images/${UserMess.picture}"/>&nbsp;'+
                            '<a href="/${UserMess.username}">${UserMess.nickname}</a>：'+replace_ems(text)+
                            '<div class="reply-user-footer">'+
                            '<div class="publish-date" style="margin-top:0">'+
                            getTimeNow()+
                            '</div>'+
                            '<div class="reply-btn" style="margin-top:0">'+
                            '<a href="###">回复</a>'+
                            '</div>'+
                            '</div>'+
                            '</div>'
                }
            }
            var mess=document.getElementById(dialogid).value;
            var data={"num":blogleaveid,"text":mess};
            req.send('data='+JSON.stringify(data));
        }
    }

</script>

</body>
</html>
