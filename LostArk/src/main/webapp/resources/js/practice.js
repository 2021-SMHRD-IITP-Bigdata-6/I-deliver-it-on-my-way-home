function getContectPath(){ //https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=mk1126sj&logNo=221019411361
	var hostIndex=location.href.indexOf(location.host) + location.host.length;
	var contextPath=location.href.substring(hostIndex,location.href.indexOf("/",hostIndex+1));
	return contextPath;
}
function loadList(){
     //게시판 리스트를 서버에 요청하기(boardList.do)
      $.ajax({
        url : getContectPath()+"/boardList.do", 
        type: "get",
        //data : {    },
        dataType : "json",
        success : htmlView,
        error : function(){ alert("error"); }
      });
    }
    function htmlView(data){
    	var result="<table class='table table-borderded table-hover'>";
    	result+="<tr>";
    	result+="<td>번호</td>";
    	result+="<td>제목</td>";
    	result+="<td>작성자</td>";
    	result+="<td>작성일</td>";
    	result+="<td>조회수</td>";
		result+="<td>수정</td>"
		result+="<td>삭제</td>"
    	result+="</tr>";
    	//반복문
    	$.each(data,(index,vo)=>{  // javascript (JSON) -> object객체로 처리함.
    		result+="<tr>";
        	result+="<td>"+vo.idx+"</td>";
        	result+="<td id='t"+vo.idx+"'><a href='javascript:contentView("+vo.idx+")'>"+vo.title+"</a></td>";
        	result+="<td id='w"+vo.idx+"'>"+vo.writer+"</td>";
        	result+="<td>"+vo.indate+"</td>";
        	result+="<td>"+vo.count+"</td>";
			result+="<td id='u"+vo.idx+"'><button class='btn btn-success btn-sm' onclick='goUpdate("+vo.idx+")'>수정</button></td>"
			result+="<td><button class='btn btn-warning btn-sm' onclick='goDel("+vo.idx+")'>삭제</button></td>"
        	result+="</tr>";
    		// 내용이 보여지는 부분을 미리 만들기
        	result+="<tr id='cv"+vo.idx+"' style='display:none'>";
        	result+="<td>"
        		result+="<td colspan='6'>"
        		
        			result+="<textarea id='c"+vo.idx+"' rows='6' class='form-control'>"+vo.content+"</textarea>"
        			result+="<br>"
        			
        	           result+="<button class='btn btn-success btn-sm' onclick='updateFn("+vo.idx+")'>수정</button>&nbsp;";
        	           result+="<button class='btn btn-warning btn-sm' onclick='closeFn("+vo.idx+")'>닫기</button>";
        	result+="</td>"
        	result+="</tr>";
    	});
    	result+="<tr>";
		result+="<td colspan='7'>";
		result+="<button class='btn btn-primary btn-sm' onclick='goView()'>글쓰기</button>";
		result+="</td>";
		result+="</tr>";
    	result+="</table>"
    	$("#list").html(result);
    }

	 function goUpdate(idx) {
		 var title=$("#t"+idx).text();//제목
      var tInput="<input type='text' id = 'nt"+idx+"' class='form-control' value='"+title+"'>";
      $("#t"+idx).html(tInput);

		var writer=$("#w"+idx).text();//작성자
		var wInput="<input type='text' id = 'nw"+idx+"' class='form-control' value='"+writer+"'>";
      $("#w"+idx).html(wInput);

		var newBtn="<button class='btn btn-info btn-sm' onclick='goUpdate1("+idx+")'>수정하기</button>";
      $("#u"+idx).html(newBtn);
   }
	function goUpdate1(idx) { //번호(idx), 제목(?), 작성자(?)
      var title=$("#nt"+idx).val();
      var writer=$("#nw"+idx).val();
      $.ajax({
            url : getContectPath()+"/boardUpdateTW.do",         
            type : "post",
         data : { "idx":idx,"title":title,"writer":writer},          
         success : loadList,
         error : function(){ alert("error");  }
        });
   }

	 function goDel(idx){
		$.ajax({
			url : getContectPath()+"/boardDelete.do",
			type : "get",
			data : {"idx": idx}, //넘겨주는 데이터 = idx
			success : loadList,
			error : function (){
				alert("error");
			}

		});
	 }
	 function goView(){
		 if($("#wform").css("display")=="none"){
			//$("#wform").css("display","block");//Open
			$("#wform").slideDown();
		 }else{// $("#wform").css("display","none")} //CLose
		 $("#wform").slideUp();

		 }
	 }
	 function goInsert(){ //form에 있는 파라메터 3개를 가져오기
		// 직렬화 시켜서 가져오면 된다
		var fData = $("#frm").serialize();
		//alert(fData);
		$.ajax({
         url : getContectPath()+"/boardInsert.do",
       type : "post",
       data : fData,
       success : loadList,
       error : function(){ alert("error");  }
     });
	  // 취소 버튼을 강제로 클릭
	  $("#init").trigger("click");
	 
	  $("#wform").css("display","none");
	  
	 }
    function updateFn(idx){ // idx(번호),content(내용)
        var content=$("#c"+idx).val();
         $.ajax({
            url : getContectPath()+"/boardContentUpdate.do",
            type : "post",
            data : { "idx":idx, "content":content },
            success : loadList,
            error : function(){ alert("error");}           
         });       
     }
    function closeFn(idx) {
    	$("#cv"+idx).css("display","none");
	}
    function contentView(idx) {
		if($("#cv"+idx).css("display")=="none"){
			$("#cv"+idx).css("display","table-row") //열기
		} else{
			$("#cv"+idx).css("display","none") //닫기
		}
	}