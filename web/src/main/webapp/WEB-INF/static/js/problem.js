/**
 * Created by LuWenjing on 2017/6/4.
 */

function changeColor(){
    var easyStatus = document.querySelectorAll('.easy-hard');
    for (var i = 0; i < easyStatus.length; i++){
        if (easyStatus[i].innerHTML == '简单'){
            easyStatus[i].addClass('easy');
        }else if(easyStatus[i].innerHTML == '中等'){
            easyStatus[i].addClass('middle');
        }else if (easyStatus[i].innerHTML == '难'){
            easyStatus[i].addClass('hard');
            easyStatus[i].innerHTML = '很难';
        }else {
            easyStatus[i].addClass('very-hard');
        }
    }
}

changeColor();
