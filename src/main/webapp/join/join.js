// 도메인 직접 입력 or domain option 선택
const domainListEl = document.querySelector('#domain-list')
const domainInputEl = document.querySelector('#domain-txt')
// select 옵션 변경 시
domainListEl.addEventListener('change', (event) => {
  // option에 있는 도메인 선택 시
  if(event.target.value !== "type") {
    // 선택한 도메인을 input에 입력하고 disabled
    domainInputEl.value = event.target.value
    domainInputEl.disabled = true
  } else { // 직접 입력 시
    // input 내용 초기화 & 입력 가능하도록 변경
    domainInputEl.value = ""
    domainInputEl.disabled = false
  }
});
  
// 아이디 중복 확인 구현  
$('.inputId').focusout(function(){
	let userId =  $('.inputId').val(); // inputId에 입력되는 값
	
	$.ajax({
		url : "./MemberJoinIdCheck.me",
		type : "post",
		data : {userId: userId},
		dataType : 'text',
		success : function(result){
			if(result == -1){
				$("#checkId").html('<b>사용할 수 없는 아이디입니다</b>');
				$("#checkId").attr('color','red');
//				document.fr.member_user_id.focus();
				$("#floatingId").focus();
//				return false;
			}else if(result == 0){
				$("#checkId").html('<b>영문,숫자만 가능합니다</b>');
				$("#checkId").attr('color','red');
//				document.fr.member_user_id.focus();
				$("#floatingId").focus();
//				return false;
			}else if(result == 1){
				$("#checkId").html('사용가능한 아이디입니다');
				$("#checkId").attr('color','skyblue');
				
				// 아이디 중복 확인이 성공하면 폼을 제출
            //  document.fr.submit();
			}
		},
		error : function(){
			alert("서버요청실패");
		}
	}) //ajax 끝
});

//// 비밀번호 검사 구현
//$('.inputPw').focusout(function(){
//	let userPw = $('.inputPw').val(); // inputPw에 입력되는 값
//	
//	$.ajax({
//		url :'./MemberJoinPwCheck.me' ,
//		type : 'post',
//		data : {userPw : userPw},
//		datatype : 'text',
//		success : function(result){
//			
//				
//		}, 
//		error :function(){
//			alert("서버요청실패");
//		}
//	})
//});

// 회원가입 폼 submit 이벤트
//$('form[name="fr"]').submit(function(event){
//    // 이하 유효성 검사 코드...
//    let id
//    // 유효성 검사를 통과하지 못한 경우
//    if(유효성 검사 실패 조건){
//        event.preventDefault(); // 폼 제출을 막습니다.
//        return false;
//    }
//});

