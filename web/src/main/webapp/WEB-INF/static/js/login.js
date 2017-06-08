/**
 * Created by LuWenjing on 2017/6/7.
 */
// JavaScript Document

var error = document.getElementById('error');

function checkName() {
    var username = document.getElementById("username");
    var reg = /^([a-zA-Z0-9_-])+@[a-zA-Z0-9_-]+((\.[a-z]{2,3}){1,2})$/;
    if (username.value == "") {
        error.innerHTML = "用户名不能为空";
        return false;
    }else
    {
        error.innerHTML = '';
        return true;
    }
}

function checkEmail(){
    var useremail = document.getElementById("useremail");
    var reg = /^([a-zA-Z0-9_-])+@[a-zA-Z0-9_-]+((\.[a-z]{2,3}){1,2})$/;
    if (useremail.value == "") {
        error.innerHTML = "邮箱不能为空";
        return false;
    }else if (!reg.test(useremail.value)){
        error.innerHTML = "邮箱格式错误";
        return false;
    }else
    {
        error.innerHTML = '';
        return true;
    }
}

function checkPass() {
    var userpass = document.getElementById("userpass");
    var reg = /^\w{6,16}$/;
    if (userpass.value == "")
    {
        error.innerHTML = "密码不能为空";
        return false;
    }
    else if(!reg.test(userpass.value))
    {
        error.innerHTML = "密码格式为字母数字下划线，长度6-16位";
        return false;
    }
    else
    {
        error.innerHTML = '';
        return true;
    }
}

function checkAllLogin(){
    if (checkName() && checkPass()){
        return true;
    }else{
        return false;
    }
}

function checkAllRegister(){
    if (checkName() && checkEmail() && checkPass()){
        return true;
    }else{
        return false;
    }
}
