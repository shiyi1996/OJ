<%--
  Created by IntelliJ IDEA.
  User: LuWenjing
  Date: 2017/6/1
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>XuptOJ——题目</title>
    <meta charset="utf-8">
    <meta name="viewpost" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="stylesheet" type="text/css" href="/css/timu.css">
    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<nav>
    <div class="nav-title"><a href="#">HighOJ</a></div>
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
            <a href="#"><img src="#" /></a>
        </div>
    </div>
</nav>

<article>

    <section class="mainbody">
        <div class="timu-header">
            <div class="timu-title">${problem.title}</div>
            <div class="timu-footer">
                <div>时间限制：${problem.time_limit}s</div>
                <div>难易程度：${problem.difficulty}</div>
                <div>通过人数：2330人</div>
            </div>
        </div>
        <div class="des-code" style="height:400px">
            <div class="des" style="overflow-Y: scroll;height:445px">
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active">
                        <a href="#desc" data-toggle="tab">题目描述</a>
                    </li>
                    <li><a href="#record" data-toggle="tab">提交记录</a></li>
                    <li><a href="#evaluating" data-toggle="tab">评测</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="desc">
                        <div class="timu-des">
                            <div class="des-header">题目描述</div>
                            <div class="des-content">${problem.description}
                            </div>
                        </div>
                        <div class="timu-des">
                            <div class="des-header">输入描述</div>
                            <div class="des-content">第一行包含两个正整数，N和M。
                                接下来的M行每行包含三个正整数：x，y和v（1≤x,y≤N，0 最后一行包含两个正整数s，t，表示想知道从景点s到景点t最大最小速度比最小的路径。s和t不可能相同。	</div>
                        </div>

                        <div class="timu-des">
                            <div class="des-header">输出描述</div>
                            <div class="des-content">第一行包含两个正整数，N和M。
                                接下来的M行每行包含三个正整数：x，y和v（1≤x,y≤N，0 最后一行包含两个正整数s，t，表示想知道从景点s到景点t最大最小速度比最小的路径。s和t不可能相同。	</div>
                        </div>
                        <div class="timu-des">
                            <div class="des-header">样例输入</div>
                            <div class="des-content">
                                样例1<br>
                                4 2<br>
                                1 2 1<br>
                                3 4 2<br>
                                1 4<br><br>

                                样例1<br>
                                4 2<br>
                                1 2 1<br>
                                3 4 2<br>
                                1 4<br>
                            </div>
                        </div>
                        <div class="timu-des">
                            <div class="des-header">样例输出</div>
                            <div class="des-content">
                                样例1<br>
                                4 2<br>
                                1 2 1<br>
                                3 4 2<br>
                                1 4<br><br>

                                样例1<br>
                                4 2<br>
                                1 2 1<br>
                                3 4 2<br>
                                1 4<br>
                            </div>
                        </div>
                        <div class="timu-des">
                            <div class="des-header">数据范围及提示</div>
                            <div class="des-content">
                                N(1<\N≤500)<br><br>
                                M（0<\M≤5000）<br><br>
                                Vi在int范围内<br><br>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="record">
                        <table>
                            <thead>
                            <tr>
                                <th>题目</th>
                                <th>运行状态</th>
                                <th>得分</th>
                                <th>耗时</th>
                                <th>语言</th>
                                <th>提交时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><a href="#">A+B问题</a></td>
                                <td><label style="background: green;color:#fff;border-radius: 2px;padding: 5px">答案错误</label></td>
                                <td>0</td>
                                <td>3s</td>
                                <td>Java</td>
                                <td>2017-01-09&nbsp;12:23:09</td>
                            </tr>
                            <tr>
                                <td><a href="#">A+B问题</a></td>
                                <td><label style="background: green;color:#fff;border-radius: 2px;padding: 5px">答案错误</label></td>
                                <td>0</td>
                                <td>3s</td>
                                <td>Java</td>
                                <td>2017-01-09&nbsp;12:23:09</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="evaluating">
                        <div class="status-change">
                            <div><span id="status"></span></div>
                            <div id="foo"></div>
                        </div>
                        <div class="progress progress-striped active" style="height:15px">
                            <div class="progress-bar progress-bar-success" role="progressbar"
                                 aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                                 style="width: 0%;" id="progress">
                                <span class="sr-only">40% 完成</span>
                            </div>
                        </div>
                        <div class="evaluating-footer">
                            <div id="data-success">30%数据通过测试</div>
                            <div id="data-time">总耗时：1ms</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="code">
                <form role="form">
                    <div style="display: flex;padding:5px;justify-content: flex-end;align-items: center;">
                        <select class="form-control" style="width:15%;margin:0 5px;" onchange="choiceLang(this)">
                            <option value="ace/mode/c_cpp">语言</option>
                            <option value="ace/mode/c_cpp" selected="selected">C/C++语言</option>
                            <option value="ace/mode/java">JAVA语言</option>
                            <option value="ace/mode/javascript">JavaScript语言</option>
                        </select>
                        <select class="form-control" style="width:15%;margin:0 5px;" onchange="choiceBack(this)">
                            <option>环境配色</option>
                            <option value="ace/theme/xcode" selected="selected">高亮</option>
                            <option value="ace/theme/monokai">暗色</option>
                        </select>
                        <select class="form-control" style="width:15%;margin:0 5px;" onchange="choiceSJ(this)">
                            <option value="4">代码缩进</option>
                            <option>2</option>
                            <option selected="selected">4</option>
                            <option>8</option>
                        </select>
                        <p style="margin:0 5px;" onclick="expand('spanid')"><span class="glyphicon glyphicon-resize-full" id="spanid"></span></p>
                    </div>
                </form>
                <pre id="editor"></pre>
                <a class="btn btn-default" href="#" style="margin-left:80%">查看题解</a>
                <button class="btn btn-primary" onclick="submit()">提交</button>
            </div>
        </div>
    </section>
</article>



<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="/src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="/js/timu.js"></script>
<script type="text/javascript" src="/js/spin.js"></script>

</body>
</html>