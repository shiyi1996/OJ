function paging(nowpage, maxpage, algorithm, difficulty, structure){
	var str;
	var link = "/p?&algorithm="+ algorithm + "&difficulty=" + difficuty + "&structure=" + structure;
	if (maxpage < 10){
		str = '<div class="page"><a href="#"><</a>';
		for (var i = 0; i < maxpage; i++){
			if (i + 1 == nowpage){
				str += '<a href='+link +"&startthen=" (i + 1)+ 'class="activity">'+ (i + 1)+'</a>';
			}else{
				str += '<a href=' +  link + '>'+ (i + 1)+'</a>';
			}
		}
		str += '<a href="#">></a></div>';
	}else if (nowpage < 4){
		str = '<div class="page"><a href="#"><</a>';
		for (var i = 0; i < 5; i++){
			if (i + 1 == nowpage){
				str += '<a href='+link+ 'class="activity">'+ (i + 1)+'</a>';
			}else{
				str += '<a href=' +  link + '>'+ (i + 1)+'</a>';
			}
		}
		str += '<a href="#">...</a>'+
			'<a href='+ link +'>' + (maxpage-2) +'</a>'+
			'<a href='+ link +'>' + (maxpage-1) + '</a>'+
			'<a href='+ link +'>' + maxpage + '</a>'+
			'<a href='+ link +'>' + '>'+'</a>'+
		'</div>';
	}else if (nowpage >= 4 && nowpage < maxpage - 2){
		str = '<div class="page">'+
			'<a href="#"><</a>'+
			'<a href="#">1</a>'+
			'<a href="#">...</a>'+
			'<a href="#">' + (nowpage-2) + '</a>'+
			'<a href="#">' + (nowpage-1) + '</a>'+
			'<a href="#" class="activity">' + nowpage + '</a>'+
			'<a href="#">' + (nowpage+1) + '</a>'+
			'<a href="#">' + (nowpage+2) + '</a>'+
			'<a href="#">...</a>'+
			'<a href="#">' + maxpage + '</a>'+
			'<a href="#">></a>'+
		'</div>';
	}else if (nowpage >= maxpage-2){
		str = '<div class="page">'+
			'<a href="#"><</a>'+
			'<a href="#">1</a>'+
			'<a href="#">2</a>'+
			'<a href="#">3</a>'+
			'<a href="#">...</a>';
		for (var i = maxpage - 5; i < maxpage; i++){
			if (i + 1 == nowpage){
				str += '<a href="#" class="activity">'+ (i + 1)+'</a>';
			}else{
				str += '<a href="#">'+ (i + 1)+'</a>';
			}
		}
		str += '<a href="#">></a></div>';
	}
	document.querySelector('.mainbody').innerHTML += str;
}