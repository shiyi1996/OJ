<%@ page import="java.util.List" %>
<%@ page import="com.web.entity.BasicVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.web.entity.Submit" %>
<%@ page import="com.web.entity.Problem" %><%--
  Created by IntelliJ IDEA.
  User: LuWenjing
  Date: 2017/6/2
  Time: 19:12
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
            <div class="search-container">
                <form class="form-inline" role="form" action="/record?thenstart=1" method="post">
                    <div class="form-group">
                        <div class="col-md-3 col-sm-12">
                            <select class="form-control" name="lang" id="lang" onchange="selectLang(this)">
                                <option value="0">程序语言</option>
                                <option value="1">C/C++语言</option>
                                <option value="2">JAVA语言</option>
                                <option value="3">JavaScript语言</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3 col-sm-12">
                            <select class="form-control" name="teststatus" id="teststatus" onchange="selectStatus(this)">
                                <option value="0">测评状态</option>
                                <option value="7">Accepted</option>
                                <option value="6">Wrong Answer</option>
                                <option value="5">TimeoutLimit</option>
                                <option value="4">Compile Error</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3 col-sm-12">
                            <input type="submit" name="submit" id="submit" class="btn btn-primary" value="筛选">
                        </div>
                    </div>
                </form>
            </div>
            <div class="ti-list" id="list">
                <table id="table">
                    <thead>
                    <tr>
                        <th>题目编号</th>
                        <th>名称</th>
                        <th>运行状态</th>
                        <th>耗时</th>
                        <th>内存</th>
                        <th>语言</th>
                        <th>提交时间</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    <%
                        List<Problem> problems=(List<Problem>)request.getAttribute("problem");
                        List<BasicVo> records = (List<BasicVo>) request.getAttribute("submit");
                        if(records!=null && records.size()!=0){

                            for (int i=0; i<records.size(); i++){
                                Submit submit = (Submit)records.get(i);
                                Problem problem = problems.get(i);
                    %>
                    <tr>
                        <td><%=submit.getProblem_id()%></td>
                        <td><a href="/p/<%=submit.getProblem_id()%>"><%=problem.getTitle()%></a></td>
                        <td><label class="run-status"><%=submit.getResult()%></label></td>
                        <td><%=submit.getRunning_time()%></td>
                        <td><%=submit.getRunning_memory()%></td>
                        <td><%=submit.getLanguage()%></td>
                        <td><%=submit.getSubmit_time()%></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="chart" style="display: none;">
            <canvas id="canvas" style="height:40vh; width:30vw"></canvas>
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