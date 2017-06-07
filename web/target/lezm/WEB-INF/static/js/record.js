/**
 * Created by LuWenjing on 2017/6/6.
 */
window.onload = changeColor();

function showChart(){
    var ctx = document.getElementById("canvas").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["submit-failed", "pending", "judging", "accepted", "ComplieError", "RuntimeError"],
            datasets: [{
                label: '# of Votes',
                data: [12, 8, 3, 5, 2, 3],
                backgroundColor: [
                    '#BE3144',
                    '#bbb',
                    '#4797B1',
                    'rgb(39, 194, 76)',
                    '#FC8A15',
                    '#FF847C'
                ],
                borderWidth: 1
            }]
        },
        options: {

        }
    });

}

var lang = 0; //默认为0，表示所有
var status = 0; //默认为0，表示所有

function selectLang(){
    lang = this.value;
}

function selectStatus() {
    status = this.value;
}

function submitRecord(){
    var req = getRequest();
    req.open('post', '#', true);
    req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    req.onreadystatechange = function (){
        if (req.readyState == 4){
            var recordlist = req. responseText;
            insertRecord(recordlist);
        }else{
            var list = document.getElementById('list');
            list.innerHTML = 'error';
        }
    };
    req.send(proname);
}

function insertRecord(recordlist){
    if (recordlist != null) {
        var table = document.getElementById('table');
        if (table) {
            var tbody = document.getElementById('tbody');
            var str = '';
            recordlist.forEach(function (record) {
                str += '<tr>'+
                '<td></td>'+ //编号
                '<td><a href="#"></a></td>'+ //名称
                '<td><label class="run-status"></label></td>'+ //状态
                '<td></td>'+ //耗时
                '<td></td>'+ //内存
                '<td></td>'+ //语言
                '<td></td>'+ //提交时间
                '</tr>';
            });
            tbody.innerHTML = str;
        }else{
            var list = document.getElementById('list');
            var str = '<table id="table">'+
                '<thead>'+
                '<tr>'+
                '<th>题目编号</th>'+
                '<th>名称</th>'+
                '<th>运行状态</th>'+
                '<th>耗时</th>'+
                '<th>内存</th>'+
                '<th>语言</th>'+
                '<th>提交时间</th>'+
                '</tr>'+
                '</thead>'+
                '<tbody id="tbody">';
            recordlist.forEach(function (record) {
                str += '<tr>'+
                    '<td></td>'+ //编号
                    '<td><a href="#"></a></td>'+ //名称
                    '<td><label class="run-status"></label></td>'+ //状态
                    '<td></td>'+ //耗时
                    '<td></td>'+ //内存
                    '<td></td>'+ //语言
                    '<td></td>'+ //提交时间
                    '</tr>';
            });
            str += ' </tbody></table>';
            list.innerHTML = str;
        }
        changeColor();
    }else{
        var list = document.getElementById('list');
        list.innerHTML = '<div style="text-align: center; color: #bbb; margin-top:50px">暂无提交记录</div>';
    }
}

function changeColor(){
    var runStatus = document.querySelectorAll('.run-status');
    for (var i = 0; i < runStatus.length; i++){
        if (runStatus[i].innerHTML == '0'){
            $(runStatus[i]).addClass('submit-failed');
            runStatus[i].innerHTML = 'Submit failed';
        }else if(runStatus[i].innerHTML == '1'){
            $(runStatus[i]).addClass('pending');
            runStatus[i].innerHTML = 'Pending Error';
        }else if (runStatus[i].innerHTML == '2'){
            $(runStatus[i]).addClass('judging');
            runStatus[i].innerHTML = 'Judging Error';
        }else if(runStatus[i].innerHTML == '3'){
            $(runStatus[i]).addClass('accepted');
            runStatus[i].innerHTML = 'Accept';
        }else if(runStatus[i].innerHTML == '4'){
            $(runStatus[i]).addClass('complie');
            runStatus[i].innerHTML = 'Compile Error';
        }
        else {
            $(runStatus[i]).addClass('runtime');
            runStatus[i].innerHTML = 'Runtime Error';
        }
    }
}

function topUser(){
    var usertop = document.querySelectorAll('.top');
    usertop[0].style.color = '#F56262';
    usertop[1].style.color = '#FCA180';
    usertop[2].style.color = '#FFD480';
}
