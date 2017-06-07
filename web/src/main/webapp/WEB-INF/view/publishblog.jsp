<%--
  Created by IntelliJ IDEA.
  User: jing
  Date: 2017/3/4
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人主页</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <link href="/css/blog.css" rel="stylesheet">
    <link href="/css/publishblog.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

    <style>

    </style>

</head>

<body>
<!-- 顶部导航 -->
<%@include file="nav.jsp"%>


<!--主要内容-->
<div class="main-container">
    <div class="xunqin-blog-header">
        <div>
            <a href="/blog/publish" class="btn btn-primary">发帖</a>
        </div>
    </div>
    <!--发表框-->
    <div class="write-dialog">
        <form class="dialog" role="form" action="/blog/publish" method="post">
            <div class="content-title">
                <label for="blogtitle">标题</label><br>
                <input type="text" name="blogtitle" id="blogtitle" placeholder="请填写标题"
                       autofocus class="form-control blogtitle">
            </div>
            <label for="write-mess">内容</label><br>
            <div class="qqface" style="font-size:14px;">
                <img src="/images/101.gif"  class="emotion" style="margin: 5px;cursor: pointer">
                最多1000字
            </div>
            <textarea rows="10" type="text" id="write-mess" name="write-mess"
                 placeholder="写下你想说的吧……" autofocus maxlength="1000" class="form-control">
            </textarea>
            <%--<div class="addphotos" id="addphotos">--%>
                <%--<div class="file-style photo-margin" align="center">--%>
                    <%--<span style="font-size:80px">+</span><br>--%>
                    <%--<span>添加图片</span>--%>
                    <%--<input type="file" onChange="add_files(this.files)" id="addphoto" name="addphoto">--%>
                <%--</div>--%>
            <%--</div>--%>
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

<script>
    /*引入qq表情包*/
    $(function(){

        $('.emotion').qqFace({

            id : 'facebox',

            assign:'write-mess',

            path:'/images/'	//表情存放的路径

        });
    });

    var pic;
    var doc = document;
    function add_files(files)
    {
        if (files.length){
            var file = files[0];
            var reader = new FileReader();
            reader.onload = function(e) {
                pic = e.target.result;
                var parentdiv = doc.getElementById("addphotos");
                parentdiv.innerHTML +=
              '<div class="photo-margin">'+
                    '<button type="button" class="close" onclick="deletepic(this)">'+
                         '<span class="glyphicon glyphicon-remove" style="background: black;'+
                    'color:#fff; "></span>'+
                    '</button>'+
                    '<img src="'+pic+'"'+'style="width:215px; height:230px;"/>'+
              '</div>'
            }
            reader.readAsDataURL(file);
        }
    }

    function deletepic(btnobj){
        var image_div = btnobj.parentNode;
        var parent_div = doc.getElementById("addphotos")
        parent_div.removeChild(image_div);
    }

</script>


</body>
</html>
