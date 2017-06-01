var editor = ace.edit("editor");
    editor.setTheme("ace/theme/xcode"); //设置背景色为高亮
    editor.session.setMode("ace/mode/c_cpp");  //设置默认语言为c/c++
    editor.getSession().setTabSize(4);  //设置默认缩进大小

function choiceLang(select){
	editor.session.setMode(select.value);  //设置语言
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

function submit(){
	console.log(editor.getValue());  //获得编辑器的代码
}


//动画
window.onload = function(){
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
		var spinner = new Spinner(opts).spin(target);

	//进度条的变化
	var arr = ['正在上传Uploading','等待测试Pending','正在编译Compiling','正在评测Running','测试通过Accepted'];
	var colors = ['black', '#bbb', '#FC8A15', '#4FC1E9', 'rgb(39, 194, 76)'];
	var progress = document.getElementById('progress');
	var status = document.getElementById('status');
	for (var i = 0; i < 5; i++){
		(function (j){
			setTimeout(function (){
				progress.style.width = 20 * (j + 1) + '%';
				status.innerHTML = arr[j];
				status.style.color = colors[j];
			}, 1000 * j);
		})(i);
	}

	//5s后停止旋转
	setTimeout(function (){
		spinner.stop();
	}, 5000);
} 