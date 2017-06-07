window.onload = changeColor();

function changeColor(){
    var easyStatus = document.querySelectorAll('.easy-hard');
    for (var i = 0; i < easyStatus.length; i++){
        if (easyStatus[i].innerHTML == '简单'){
            $(easyStatus[i]).addClass('easy');
        }else if(easyStatus[i].innerHTML == '中等'){
            $(easyStatus[i]).addClass('middle');
        }else if (easyStatus[i].innerHTML == '难'){
            $(easyStatus[i]).addClass('hard');
            easyStatus[i].innerHTML = '很难';
        }else {
            $(easyStatus[i]).addClass('very-hard');
        }
    }
}

//给输入框添加事件
document.getElementById("proname").addEventListener('keyup', function (){
    var name = this.value;
    if (name != ''){
        search(name);
    }
}, true);

function getRequest(){
    var req=null;
    if (window.XMLHttpRequest){
        req = new XMLHttpRequest();
    }else{
        req = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return req;
}

function search(proname){
    var req = getRequest();
    req.open('post', '#', true);
    req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    req.onreadystatechange = function (){
        if (req.readyState == 4){
            var problemlist = req. responseText;
            insertProblem(problemlist);
        }else{
            var list = document.getElementById('list');
            list.innerHTML = 'error';
        }
    };
    req.send(proname);
}

function insertProblem(problemlist){
    if (problemlist != null) {
        var table = document.getElementById('table');
        if (table) {
            var tbody = document.getElementById('tbody');
            var str = '';
            problemlist.forEach(function (problem) {
                str += '<tr>'+
                    '<td><span class="status accepted">'+ problem.getProblem_id()+'</span></td>'+
                    '<td><a href="/p/' + '\=' + problem.getProblem_id()+ '\"></a></td>'+
                    '<td><span class="easy-hard">' +problem.getDifficulty()+ '</span></td>'+
                    '<td>2345</td>'+
                    '<td>'+
                    '<div class="progress" style="width:80%; margin: 0">'+
                    '<div class="progress-bar progress-bar-info" role="progressbar" '+
                    'style="width: 30%;">30% '+
                    '</div>'+
                    '</div>'+
                    '</td>'+
                    '</tr>';
            });
            tbody.innerHTML = str;
        }else{
            var list = document.getElementById('list');
            var str = '<table class="table table-strip table-responsive table-border" id="table">'+
                '<thead>'+
                '<tr>'+
                '<th>题目编号</th>'+
                '<th>名称</th>'+
                '<th>难度等级</th>'+
                '<th>通过人数</th>'+
                '<th>通过率</th>'+
                '</tr>'+
                '</thead>'+
                '<tbody id="tbody">';
            problemlist.forEach(function (problem) {
                str += '<tr>'+
                    '<td><span class="status accepted">'+ problem.getProblem_id()+'</span></td>'+
                    '<td><a href="/p/'+ problem.getProblem_id()+ '\"></a></td>'+
                    '<td><span class="easy-hard">' +problem.getDifficulty()+ '</span></td>'+
                    '<td>2345</td>'+
                    '<td>'+
                    '<div class="progress" style="width:80%; margin: 0">'+
                    '<div class="progress-bar progress-bar-info" role="progressbar" '+
                    'style="width: 30%;">30% '+
                    '</div>'+
                    '</div>'+
                    '</td>'+
                    '</tr>';
            });
            str += ' </tbody></table>';
            list.innerHTML = str;
        }
    }else{
        var list = document.getElementById('list');
        list.innerHTML = '<div style="text-align: center; color: #bbb; margin-top:50px">暂无该题目</div>';
    }
}
