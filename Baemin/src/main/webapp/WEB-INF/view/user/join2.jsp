<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
 
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body style="background-color: #ecc9ab;">
   <main style="background-color: #ead7c6;">
      <div class="login_box">
           <a href="/"><img src="/img/로긴페이지1-001.png" alt="이미지" class="bm_img"></a>
            <form action="/join1" method="post" >
               <div class="input_aera">
                     <input type="text" name="mem_id" id="mem_id" class="mem_id" maxlength="20"  placeholder="아이디를 입력해 주세요" >
                  <span class="msg_box">${errorMsg.username }</span>
                  </div>          
                     
               <div class="input_aera">
                  <input type="password" class="password1" name="mem_pw" id="mem_pw" maxlength="20"  placeholder="비밀번호를 입력해 주세요">
               </div>
                  
               <div class="input_aera">
                  <input type="password" class="password2" maxlength="20"  placeholder="비밀번호를 한번더 입력해 주세요">
                     <span class="msg_box">${errorMsg.password }</span>
                     </div>
                     
                     <div class="input_aera">
                        <input type="text" name="mem_name" id="mem_name" class="nickname"  placeholder="이름을 입력해 주세요" >
                        <span class="msg_box">${errorMsg.nickname }</span>
                    </div>
                     
               <div>
				<input type="radio" name="mem_gender" value="M" checked  id="man">
				<label for="man">남자</label> 
				<input type="radio" name="mem_gender" value="W" checked  id="woman">
				<label for="woman">여자</label>
               </div>
                     
               <div class="input_aera">
                  <input type=number name="mem_phone" id="mem_phone" class="phone" placeholder="'-' 없이 입력해 주세요" maxlength="11" >
                       <span class="msg_box">${errorMsg.phone }</span>
                   </div>

               <div class="input_aera" name="mem_addr" id="mem_addr">
				<input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" placeholder="주소"><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
               </div>
    
               <input type="submit" value="회원가입" class="login_btn" >
         </form>
        </div>
 
    </main>
    <script src="/js/util/util.js"></script>
    <script script type="text/javascript" src="/js/user/join.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open(); 
        
        
    }
</script>
</body>
</html>