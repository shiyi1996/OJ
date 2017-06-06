<%--
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
                <form class="form-inline" role="form">
                    <div class="form-group">
                        <div class="col-md-3 col-sm-10">
                            <input type="text" class="form-control" id="proname" placeholder="请输入题目名称">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-3 col-sm-12">
                            <select class="form-control" name="lang" id="lang">
                                <option value="0">程序语言</option>
                                <option value="1">C/C++语言</option>
                                <option value="2">JAVA语言</option>
                                <option value="3">JavaScript语言</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3 col-sm-12">
                            <select class="form-control" name="teststatus" id="teststatus">
                                <option value="0">测评状态</option>
                                <option value="1">Accepted</option>
                                <option value="2">Wrong Answer</option>
                                <option value="3">Compiling</option>
                                <option value="4">Runtime Error</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-3 col-sm-12">
                            <input type="submit" name="submit" class="btn btn-primary" value="筛选">
                        </div>
                    </div>
                </form>
            </div>
            <div class="ti-list">
                <table>
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
                    <tbody>
                    <tr>
                        <td>002</td>
                        <td><a href="#">A+B问题</a></td>
                        <td><label class="run-status submit-failed">Submit failed</label></td>
                        <td>1200ms</td>
                        <td>12kb</td>
                        <td>Java</td>
                        <td>2017-09-08&nbsp;12:12:23</td>
                    </tr>
                    <tr>
                        <td>002</td>
                        <td><a href="#">A+B问题</a></td>
                        <td><label class="run-status accepted">Accepted</label></td>
                        <td>1200ms</td>
                        <td>12kb</td>
                        <td>Java</td>
                        <td>2017-09-08&nbsp;12:12:23</td>
                    </tr>
                    <tr>
                        <td>002</td>
                        <td><a href="#">A+B问题</a></td>
                        <td><label class="run-status pending">Pending Error</label></td>
                        <td>1200ms</td>
                        <td>12kb</td>
                        <td>Java</td>
                        <td>2017-09-08&nbsp;12:12:23</td>
                    </tr>
                    <tr>
                        <td>002</td>
                        <td><a href="#">A+B问题</a></td>
                        <td><label class="run-status complie">Compile Error</label></td>
                        <td>1200ms</td>
                        <td>12kb</td>
                        <td>Java</td>
                        <td>2017-09-08&nbsp;12:12:23</td>
                    </tr>
                    <tr>
                        <td>002</td>
                        <td><a href="#">A+B问题</a></td>
                        <td><label class="run-status runtime">Runtime Error</label></td>
                        <td>1200ms</td>
                        <td>12kb</td>
                        <td>Java</td>
                        <td>2017-09-08&nbsp;12:12:23</td>
                    </tr>
                    <tr>
                        <td>002</td>
                        <td><a href="#">A+B问题</a></td>
                        <td><label class="run-status judging">Judging Error</label></td>
                        <td>1200ms</td>
                        <td>12kb</td>
                        <td>Java</td>
                        <td>2017-09-08&nbsp;12:12:23</td>
                    </tr>
                    </tbody>
                </table>
            </div>
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
<script type="text/javascript" src="/js/Chart.js/2.6.0/Chart.min.js"></script>
<script type="text/javascript" src="/js/excanvas.js"></script>
<script type="text/javascript" src="/js/record.js"></script>

<script type="text/javascript">

   showChart();


</script>

</body>
</html>