<%@ page import="com.web.entity.BasicVo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.web.entity.Submit" %>
<%@ page import="com.web.entity.Problem" %><%--
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

<!--导入导航栏-->
<%@include file="nav.jsp"%>

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
                    <% if (session.getAttribute("user") != null)
                    {
                    %>
                    <li><a href="#record" data-toggle="tab">提交记录</a></li>
                    <li><a href="#evaluating" data-toggle="tab">评测</a></li>
                    <%
                        }
                    %>
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
                            <div class="des-content">${problem.input_description}</div>
                        </div>

                        <div class="timu-des">
                            <div class="des-header">输出描述</div>
                            <div class="des-content">${problem.output_description}</div>
                        </div>
                        <div class="timu-des">
                            <div class="des-header">样例输入</div>
                            <div class="des-content">
                                ${problem.input_test}
                            </div>
                        </div>
                        <div class="timu-des">
                            <div class="des-header">样例输出</div>
                            <div class="des-content">
                                ${problem.output_test}
                            </div>
                        </div>
                        <div class="timu-des">
                            <div class="des-header">数据范围及提示</div>
                            <div class="des-content">
                                ${problem.data_area}
                            </div>
                        </div>
                    </div>
                    <% if (session.getAttribute("user") != null)
                    {
                    %>
                    <div class="tab-pane fade" id="record">
                            <%
                                Problem problem = (Problem)request.getAttribute("problem");
                                List<BasicVo> basicVoArrayList=(ArrayList<BasicVo>) request.getAttribute("submit");
                                if(basicVoArrayList != null && basicVoArrayList.size() != 0){
                            %>
                            <table>
                                <thead>
                                <tr>
                                    <th>题目</th>
                                    <th>运行状态</th>
                                    <th>通过用例数</th>
                                    <th>耗时</th>
                                    <th>语言</th>
                                    <th>提交时间</th>
                                </tr>
                                </thead>
                                <tbody>
                            <%
                                    for(BasicVo basicVo:basicVoArrayList){
                                        Submit submit=(Submit) basicVo;
                            %>
                            <tr>
                                <td><a href="#"><%= problem.getTitle() %></a></td>
                                <td><label class="status"><%= submit.getResult()%></label></td>
                                <td><%= submit.getAccept_sum() %></td>
                                <td><%= submit.getRunning_time() %>ms</td>
                                <td><%= submit.getLanguage() %></td>
                                <td><%= submit.getSubmit_time() %></td>
                            </tr>
                            <%
                                    }
                            %>

                            </tbody>
                        </table>
                            <%
                                }else{

                            %>
                        <div style="color: #bbb; text-align: center;padding-top: 50px">暂无提交记录</div>
                        <%
                                }
                        %>

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
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="code">
                <form role="form">
                    <div class="editor-header">
                        <select class="form-control form-control-plus" onchange="choiceLang(this)">
                            <option value="ace/mode/c_cpp">语言</option>
                            <option value="ace/mode/c_cpp" selected="selected">C/C++语言</option>
                            <option value="ace/mode/java">JAVA语言</option>
                            <option value="ace/mode/javascript">JavaScript语言</option>
                        </select>
                        <select class="form-control form-control-plus" onchange="choiceBack(this)">
                            <option>环境配色</option>
                            <option value="ace/theme/xcode" selected="selected">高亮</option>
                            <option value="ace/theme/monokai">暗色</option>
                        </select>
                        <select class="form-control form-control-plus"  onchange="choiceSJ(this)">
                            <option value="4">代码缩进</option>
                            <option>2</option>
                            <option selected="selected">4</option>
                            <option>8</option>
                        </select>
                        <div class="flex-btn" onclick="expand('spanid')">
                            <span class="glyphicon glyphicon-resize-full" id="spanid"></span>
                        </div>
                    </div>
                </form>
                <pre id="editor" style="height:400px"></pre>
                <a class="btn btn-default" href="#" style="margin-left:80%">查看题解</a>
                <button class="btn btn-primary" onclick="submit(${problem.problem_id}, ${user})">提交</button>
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