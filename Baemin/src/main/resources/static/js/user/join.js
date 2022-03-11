$(".login_btn").css("background", "#ddd");
 
 
const isSubmit = (function(){
	let memidCheck = false;
	let mempwCheck = false;
	let memnameCheck = false;
	let memgenderCheck = false;
	let memphoneCheck = false;
	let memaddrCheck = false;
	
	const setmemidCheck = function(set){
		memidCheck = set ? true : false;
		isSubmit();
	}
	const setmempwCheck = function(set){
		mempwCheck = set ? true : false;
		isSubmit();
	}
	const setmemnameCheck = function(set){
		memnameCheck = set ? true : false;
		isSubmit();
	}
	const setmemgenderCheck = function(set){
		mem_genderCheck = set ? true : false;
		isSubmit();
	}
	const setmemphoneCheck = function(set){
		memphoneCheck = set ? true : false;
		isSubmit();
	}
	const setmemaddrCheck = function(set){
		memaddrCheck = set ? true : false;
		isSubmit();
	}
	
	const isSubmit = function(){
		if(memidCheck && mempwCheck && memnameCheck && mem_genderCheck && memphoneCheck && memaddrCheck) {
			$(".login_btn").css("background", "#2AC1BC");
			return true;
		} else {
			$(".login_btn").css("background", "#ddd");
			return false;
		}
	}
	
	return {
		setmemidCheck : setmemidCheck,
		setmempwCheck : setmempwCheck,
		setmemidCheck : setmemnameCheck,
		setmemgenderCheck : setmemgenderCheck,
		setmemphoneCheck : setmemphoneCheck,
		setmemaddrCheck : setmemaddrCheck,
		isSubmit : isSubmit
	}
})();
 
 
 
 
 
function overlapCheck(data) {
	
	let isUseable = false;
	$.ajax({
		url: "/overlapCheck",
		type: "get",
		data: data,
		async: false
	})
	.done(function(result){
		if(result == 0 ) {
			isUseable = true;
		} 
	})
	.fail(function(){
		alert("에러");
	});
	
	return isUseable;
	
}
 
 
 
 
function pwdCheck() {
	const mempw1 = $(".password1").val().replaceAll(" ", "");
	const mempw2 = $(".password2").val().replaceAll(" ", "");
	const msgBox = $(".password2").siblings(".msg_box"); 
	
	if(mempw1 && mempw2) {
		if(mempw1.includes(" ")  || mempw2.includes(" ")) {
			msgBox.text("비밀번호를 확인해 주세요");
			isSubmit.setmempwCheck(false);
			return;
		}
		
		if(mempw1 != mempw2) {
			msgBox.text("비밀번호를 확인해 주세요");
			isSubmit.setmempwCheck(false);
		} else {
			msgBox.text("");
			console.log("사용가능");
			isSubmit.setmempwCheck(true);
		}
	}
	
}
 
 
 
 
 
$(".username").focusout(function(){
	const memid = $(".username").val().replaceAll(" ", "");
	const msgBox = $(this).siblings(".msg_box"); 
	
	if(!memid) {
		msgBox.text("아이디를 입력해주세요");
		isSubmit.setmemidCheck(false);
		return;
	}
	
	if(!usernameCheck(memid)) {
		msgBox.text("사용할수 없는 아이디입니다");
		isSubmit.setmemidCheck(false);
		return;
	}
	
	const data = {
		value : memid,
		valueType : "memid" 
	};
	
	
	if(overlapCheck(data)) {
		msgBox.text("사용 가능합니다");
		isSubmit.setmemidCheck(true);
	} else {
		msgBox.text("이미 사용중인 아이디입니다");
		isSubmit.setmemidCheck(false);
	}
});
 
 
$(".password1").focusout(function() {
	pwdCheck();
});
 
$(".password2").focusout(function() {
	pwdCheck();
});
 

$(".phone").focusout(function() {
	const memphone = $(".phone").val();
	const msgBox = $(this).siblings(".msg_box"); 
	
	if(!memphone) {
		isSubmit.setmemphoneCheck(false);
		return;
	}
	
	if(!phoneCheck(memphone)) {
		msgBox.text("휴대폰번호를 확인해 주세요");
		isSubmit.setmemphoneCheck(false);
	} else {
		msgBox.text("");
		isSubmit.setmemphoneCheck(true);
	}
});
