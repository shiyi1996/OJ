var id = 1;
var editor = ace.edit("editor");
var spinner;
window.onload = (function () {
	editor.setTheme("ace/theme/xcode"); //设置背景色为高亮
	editor.session.setMode("ace/mode/c_cpp");  //设置默认语言为c/c++
	editor.getSession().setTabSize(4);  //设置默认缩进大小
	replaceBr();
})();

//动态切换选项卡
function activeChange(){
	var mytab = $('#myTab').children();
	var tabpane = document.querySelectorAll('.tab-pane');
	for (var i = 0; i < mytab.length; i++) {
		if (i != 1){
			$(mytab[i]).removeClass('active');
			$(tabpane[i]).removeClass('active');
			$(tabpane[i]).removeClass('in');
		}else{
			$(mytab[i]).addClass('active');
			$(tabpane[i]).addClass('active');
			$(tabpane[i]).addClass('in');
		}
	}
}

function replaceBr(){
	var content = document.querySelectorAll('.des-content');
	for (var i = 0; i < content.length; i++){
		var innerCon = content[i].innerHTML;
		content[i].innerHTML = innerCon.replace(/\\n/g, '</br>');
	}
}

function choiceLang(select){
	editor.session.setMode(select.value);  //设置语言
	if (select.value == "ace/mode/c_cpp"){
		id = 1;
	}else if (select.value == "ace/mode/java"){
		id = 2;
	}else{
		id = 3;
	}
}


function choiceBack(select){
	editor.setTheme(select.value); 
}

function choiceSJ(select){
	editor.getSession().setTabSize(select.value);
}

var flag = true;
function expand(thisid){
	var spanid = document.getElementById(thisid);
	if (flag){
		spanid.className = 'glyphicon glyphicon-resize-small';
		document.querySelector('.des').style.width = '30%';
		document.querySelector('.code').style.width = '68%';
	}else{
		spanid.className = 'glyphicon glyphicon-resize-full';
		document.querySelector('.des').style.width = '40%';
		document.querySelector('.code').style.width = '58%';
	}
	flag = !flag;
}

function getRequest(){
	var req=null;
	if (window.XMLHttpRequest){
		req = new XMLHttpRequest();
	}else{
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}
	return req;
}

function init(){
	activeChange(); //跳到提交状态显示页面；
	animation() //加载转圈动画
	progressChange(0, 0, ""); //显示等待上传
	document.getElementById('run-errormess').innerHTML = "";
}

function getStatus(submitId) {
    var req = getRequest();
    if (req != null) {
        req.open('post', '/record/submitStatus', true);
        req.setRequestHeader("Content-Type",
            "application/x-www-form-urlencoded"
        );
        req.onreadystatechange = function () {
            if (req.readyState == 4) {
                var mess = req.responseText;
                if (mess != null && mess != "") {
                	mess = JSON.parse(mess);
					var planid;
					switch (mess.result){
						case 0:
							planid = 10;
							break;
						case 1:
							planid = 25;
							break;
                        case 2:
                        	planid = 40;
                        	break;
                        case 3:
                        	plaind = 60;
                        	break;
						default:
                        	planid = 100;
                        	break;
					}
                    progressChange(mess.result+1, planid, mess.result_description, mess.running_time)
                } else {
                    alert("失败，请尝试重新提交");
                }
            }
        }
        req.send('id=' + submitId);
    }
}


var timer;

function startAnimal(submitId) {
    timer = setInterval(function () {
        getStatus(submitId);
    }, 300);
}

<<<<<<< HEAD
// <<<<<<< HEAD
//
// function insertRecord(record, title){
// 	var tablebody = document.getElementById('tablebody');
// 	var data = '<tr>'+
// 		'<td><a href="#">'+ title +'</a></td>'+
// 		'<td><label class=\"status-answer running'+ record.result + '\"' +'>' +answerstatus[record.result]+'</label></td>'+
// 		'<td>'+ record.accept_sum +'</td>'+
// 		'<td>'+ record.running_time+'</td>'+
// 		'<td>'+ lang[record.language - 1]+'</td>'+
// 		'<td>'+ record.submit_time +'</td>'+
// 		'</tr>';
// 	tablebody.innerHTML += data;
// }
//
//
//
// // function submit(problemid, flag){
// // 	if (flag == false) {
// // 		var req = getRequest();
// // 		if (req != null) {
// // 			req.open('post', '/record/addSubmit', true);
// // 			req.setRequestHeader("Content-Type",
// // 				"application/x-www-form-urlencoded");
// // 			req.onreadystatechange = function () {
// // 				if (req.readyState == 4) {
// // 					var result = req.responseText;
// // 					alert(result);
// // 					if (result == 'succeed') {
// // 						activeChange();
// // 						animation();
// // 					} else {
// // 						alert(result);
// // 					}
// // 				}
// // 			}
// //
// // 			var code = editor.getValue();
// // 			var data = {"problemId": problemid, "language": id, "code": code};
// //
// // 			req.send('data=' + JSON.stringify(data));
// // 		}
// // 	}else{
// // 		window.location.href = '/login';
// // 	}
// // }
//
// window.onload = (function(){
// 	replaceBr();
// })();
// =======
=======

>>>>>>> 479bee99020c69b0c5d217e92e4d427b9de1c01f
function submit(problemid) {
	init(); //初始化函数
    var req = getRequest();
    if (req != null) {
        req.open('post', '/record/addSubmit', true);
        req.setRequestHeader("Content-Type",
            "text/plain"
        );
        req.onreadystatechange = function () {
            if (req.readyState == 4) {
                var result = req.responseText;
                if (result != -1) {
                	progressChange(0, 10, "")
					startAnimal(result);
                } else {
                    alert("失败，请尝试重新提交");
                }
            }
        };
        var code = encodeURIComponent(editor.getValue());
        var data = {"problemId": problemid, "language": id, 'code': code};
		
		req.send(JSON.stringify(data));
    }
}

function progressChange(statusid, planid, desc, usetime){
    //进度条的变化
    var arr = ['正在上传Uploading','等待测试Pending','开始测试Judging','正在编译Compiling','正在评测Running','编译错误CompilieError','时间超限TimeLimit','错误WrongAnwser','测试通过Accepted'];
    var colors = ['black', '#bbb', '#FC8A15', '#4FC1E9', '#4FC1E9', '#4FC1E9','orange', 'red', 'rgb(39, 194, 76)'];
    var progress = document.getElementById('progress');
    var status = document.getElementById('status');

    if (desc != ''){
        spinner.stop();
        $(progress).addClass('progress-bar-danger');
        progress.style.width = '100%';
        progress.innerHTML = '100%';
        document.getElementById('run-errormess').innerHTML = desc;
        clearInterval(timer)
    }else{
        progress.style.width = planid + '%';
        progress.innerHTML = planid + '%';
        if (planid == 100){
            spinner.stop();
			document.getElementById('usetime').innerHTML = usetime;
            clearInterval(timer)
		}
	}
    status.innerHTML = arr[statusid];
    status.style.color = colors[statusid];
}
// >>>>>>> 52cb173da53a131890d25e4568f2c4bd4ab3e781

//动画
function animation(){
	//加载转圈
	var opts = {
		lines: 13, // The number of lines to draw |小长条的数量
		length: 13, // The length of each line |小长条的长度
		width: 3, // The line thickness |小长条的宽度
		radius: 15, // The radius of the inner circle |内环的半径长
		corners: 1, // Corner roundness (0..1)
		rotate: 0, // The rotation offset |旋转角度
		direction: 1, // 1: clockwise, -1: counterclockwise |1：顺时针方向 -1：逆时针方向
		color: '#000', // #rgb or #rrggbb or array of colors |颜色
		speed: 1, // Rounds per second |每秒转多少圈
		trail: 60, // Afterglow percentage |余晖效果百分比
		shadow: false, // Whether to render a shadow |渲染阴影
		hwaccel: false, // Whether to use hardware acceleration |加速
		className: 'spinner', // The CSS class to assign to the spinner |类名spinner
		zIndex: 2e9, // The z-index (defaults to 2000000000) |显示在最顶层
		top: 'auto', // Top position relative to parent in px |相对父元素的top
		left: 'auto' // Left position relative to parent in px |相对父元素的left ，默认情况spinner是显示于父元素居中位置

	};
	var target = document.getElementById('foo');
	spinner = new Spinner(opts).spin(target);
}



<<<<<<< HEAD


=======


>>>>>>> 479bee99020c69b0c5d217e92e4d427b9de1c01f
