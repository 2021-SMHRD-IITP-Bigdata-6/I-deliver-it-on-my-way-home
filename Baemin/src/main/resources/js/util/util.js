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
function openModal(modal) {
	const size = window.innerWidth;
	
	if (size > 767) {
		modal.css("transition", "0s").css("top", "0%");
		console.log("pc");
	} else {
		modal.css("transition", "0.2s").css("top", "0%");
		console.log("mobile");
	}
	$("#modal_bg").show();
	$("body").css("overflow", "hidden");
	$("body").css("overflow-y", "hidden");
	
	
	$(".closeA").click(function() {
		closeModal();
	});
	
	$("#modal_bg").click(function() {
		closeModal();
	});
	
	$(".closeB").click(function() {
		closeModal();
	});
}
 
 
 
 
function closeModal() {
	$("#modal_bg").hide();
	$(".modal").css("top", "100%");
	$(".modal_box").scrollTop(0);
	$("body").css("overflow", "visible");
	$(".modal input[type='checkBox']").prop("checked", false);
	
	$("#amount").val(1);
};
