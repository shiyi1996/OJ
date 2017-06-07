<%--
  Created by IntelliJ IDEA.
  User: LuWenjing
  Date: 2017/6/7
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>XuptOJ——排行榜</title>
    <meta charset="utf-8">
    <meta name="viewpost" content="width=device-width, initial-scale=1">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="stylesheet" type="text/css" href="/css/record.css">
    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
    <style>

    </style>

</head>
<body>

<!--导入导航栏-->
<%@include file="nav.jsp"%>

<article>
    <section class="mainwarp">
        <div class="recordlist">
            <div class="ti-list" id="list">
                <table id="tablerecord">
                    <thead>
                    <tr>
                        <th>名次</th>
                        <th>用户名</th>
                        <th>用户昵称</th>
                        <th>个人描述</th>
                        <th>总AC数</th>
                        <th>总提交数</th>
                        <th>通过率</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    <tr>
                        <td class="top">1</td>
                        <td><a href="#">ssss</a></td>
                        <td><a href="#">小二郎</a></td>
                        <td>背上书包上学堂</td>
                        <td style="color: rgb(39, 194, 76)">89</td>
                        <td style="color: #BE3144">139</td>
                        <td>
                            <div class="progress" style="width:80%; margin: 0">
                                <div class="progress-bar progress-bar-info" role="progressbar"
                                     style="width: 30%;">30%
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="top">1</td>
                        <td><a href="#">ssss</a></td>
                        <td><a href="#">小二郎</a></td>
                        <td>背上书包上学堂</td>
                        <td>89</td>
                        <td>139</td>
                        <td>
                            <div class="progress" style="width:80%; margin: 0">
                                <div class="progress-bar progress-bar-info" role="progressbar"
                                     style="width: 30%;">30%
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="top">1</td>
                        <td><a href="#">ssss</a></td>
                        <td><a href="#">小二郎</a></td>
                        <td>背上书包上学堂</td>
                        <td>89</td>
                        <td>139</td>
                        <td>
                            <div class="progress" style="width:80%; margin: 0">
                                <div class="progress-bar progress-bar-info" role="progressbar"
                                     style="width: 30%;">30%
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="#">ssss</a></td>
                        <td><a href="#">小二郎</a></td>
                        <td>背上书包上学堂</td>
                        <td>89</td>
                        <td>139</td>
                        <td>
                            <div class="progress" style="width:80%; margin: 0">
                                <div class="progress-bar progress-bar-info" role="progressbar"
                                     style="width: 30%;">30%
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="top">1</td>
                        <td><a href="#">ssss</a></td>
                        <td><a href="#">小二郎</a></td>
                        <td>背上书包上学堂</td>
                        <td>89</td>
                        <td>139</td>
                        <td>
                            <div class="progress" style="width:80%; margin: 0">
                                <div class="progress-bar progress-bar-info" role="progressbar"
                                     style="width: 30%;">30%
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="top">1</td>
                        <td><a href="#">ssss</a></td>
                        <td><a href="#">小二郎</a></td>
                        <td>背上书包上学堂</td>
                        <td>89</td>
                        <td>139</td>
                        <td>
                            <div class="progress" style="width:80%; margin: 0">
                                <div class="progress-bar progress-bar-info" role="progressbar"
                                     style="width: 30%;">30%
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
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
<script type="text/javascript" src="/js/record.js"></script>
<script type="text/javascript">
    topUser();
</script>

</body>
</html>
