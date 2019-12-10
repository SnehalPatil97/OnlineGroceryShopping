function validate(){
		var uname=document.loginForm.username.value;
		var pwd=document.loginForm.password.value;
		if(uname=="" || pwd==""){
			alert("Please fill all details");
			return false;
		}else{
			return true;
		}
	}