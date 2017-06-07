/**
 * Created by jing on 2017/3/10.
 */
/*引入qq表情包*/
$(function(){

    $('.emotion').qqFace({

        id : 'facebox',

        assign:'write-mess',

        path:'/images/'	//表情存放的路径

    });
});

var doc = document;
var flag = true;
function show(divid,textid){
    if (flag == true){
        flag = false;
        doc.getElementById(divid).style.display = "none";
        doc.getElementById(textid).parentNode.style.display = 'none';
    }
    else
    {
        flag = true;
        doc.getElementById(divid).style.display = "block";
        doc.getElementById(textid).parentNode.style.display = 'flex';
    }

}

function reply(userid, dialogid){
    var username_span = doc.getElementById(userid);
    var username = username_span.innerHTML;
    console.log(userid);
    var dialog = doc.getElementById(dialogid);
    dialog.value = "回复 "+username+"：";
}


replace_em("content");
replace_em("leaveword");
replace_em("ming");
function replace_em(str) {
    var str = document.getElementsByName(str);
    for (var i = 0; i < str.length; i++) {
        var sts=replace_ems(str[i].innerHTML);
        str[i].innerHTML=sts;
    }
}

function replace_ems(str){
    var str = str.replace(/\s/g, '&nbsp');
    var str = str.replace(/\[em_([0-9]*)\]/g, '<img src="/images/$1.gif" border="0" style="width:25px; height: 25px;"/>');
    return str;
}

function getTimeNow()
{
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    if (hour >= 0 && hour <= 9)
        hour = "0" + hour;
    if (minute >= 0 && minute <= 9)
        minute = "0" + minute;
    if (second >= 0 && second <= 9)
        second = "0" + second;
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        + " " + hour + seperator2 + minute
        + seperator2 + second;
    return currentdate;
}

function gettodydate(){
    var date = new Date();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    doc.getElementById("today").innerHTML = month + "月" + strDate + "日";
}
// gettodydate();
