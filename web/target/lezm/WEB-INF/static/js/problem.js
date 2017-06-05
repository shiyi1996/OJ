<<<<<<< HEAD
/**
 * Created by LuWenjing on 2017/6/4.
 */

=======
>>>>>>> e058fee050a4b3afe294e31fa38b43e70e915623
function changeColor(){
    var easyStatus = document.querySelectorAll('.easy-hard');
    for (var i = 0; i < easyStatus.length; i++){
        if (easyStatus[i].innerHTML == '简单'){
<<<<<<< HEAD
            easyStatus[i].addClass('easy');
        }else if(easyStatus[i].innerHTML == '中等'){
            easyStatus[i].addClass('middle');
        }else if (easyStatus[i].innerHTML == '难'){
            easyStatus[i].addClass('hard');
            easyStatus[i].innerHTML = '很难';
        }else {
            easyStatus[i].addClass('very-hard');
=======
            $(easyStatus[i]).addClass('easy');
        }else if(easyStatus[i].innerHTML == '中等'){
            $(easyStatus[i]).addClass('middle');
        }else if (easyStatus[i].innerHTML == '难'){
            $(easyStatus[i]).addClass('hard');
            easyStatus[i].innerHTML = '很难';
        }else {
            $(easyStatus[i]).addClass('very-hard');
>>>>>>> e058fee050a4b3afe294e31fa38b43e70e915623
        }
    }
}

<<<<<<< HEAD
changeColor();
=======
changeColor();
>>>>>>> e058fee050a4b3afe294e31fa38b43e70e915623
