function memidCheck(memid) {
	const regmemid =  /^[A-Za-z0-9]{4,15}$/;
	
	if(regmemid.test(memid)) {
		return true;
	} else {
		return false;
	}
}
 
function mempwCheck(mempw){
	const regmempw = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	
	if(regmempw.test(mempw)) {
		return true;
	} else {
		return false;
	}
}
 
function memphoneCheck(memphone){
	const regmemPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	if(regmemPhone.test(memphone)) {
		return true;
	} else {
		return false;
	}
}
 
 
function memnameCheck(memname) {
	const regmemname = /^[가-힣|a-z|A-Z|0-9|]+$/;
	if (regmemname.test(memname)) {
		return true;
	} else {
		return false;
	}
}
 
 
 
function lenthCheck(e, length) {
	if(e.value.length >= length) {
		return false;
	}
	
	$(this).off().focusout(function(){
		if(e.value.length > length) {
			e.value = "";
		}
	})
	
	return true; 
}
