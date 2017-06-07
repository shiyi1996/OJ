// nav-list
// nav-login
// nav-user
var flag = false;

function showlist(){
	var list = document.querySelector('.nav-list');
	var login = document.querySelector('.nav-login');
	var user = document.querySelector('.nav-user');
	if (!flag){
		list.style.display = 'block';
		if (login){
			login.style.display = 'flex';
		}else{
			user.style.display = 'flex';
		}
	}else{
		list.style.display = '';
		if (login){
			login.style.display = '';
		}else{
			user.style.display = '';
		}
	}

	flag = !flag;
}