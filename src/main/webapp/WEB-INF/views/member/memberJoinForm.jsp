<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.adress{
	box-shadow: none;
    background: transparent;
    border: 2px solid rgba(0, 0, 0, 0.1);
    height: 46px;
    font-size: 16px;
    font-weight: 300;
    padding-left: 15px;
    padding-right: 15px;
    transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
}
span.checkId{
	display:none;
}
span.checkPwd{
	display:none;
}
span.checkPhone{
	display:none;
}
</style>
</head>
<body>
	<!-- Modal 본문-->
	<div class="modal-header" style="text-align:center">
		<h3 class="modal-title" style="padding-left:200px">회원가입</h3>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<form action="memberJoin.tpo" method="post">
		<div class="modal-body" style="text-align: left">
			<div class="form-group">
				<label for="userId">* 아이디</label>
				<input type="text" class="form-control" id="userId"  name="userId"  placeholder="4글자 이상 12글자 이하로 입력해주세요">
				 &nbsp;&nbsp;&nbsp;&nbsp;
				<span class="checkId ok" style="color:green">이 아이디는 사용 가능합니다.</span>
				<span class="checkId error" style="color:red">이 아이디는 사용할 수 없습니다.</span>
				<input type="hidden" id="idDuplicateCheck" value="0">
			</div>
			<div class="form-group">
				<label for="userId">* 비밀번호</label>
				 <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호">
			</div>
			<div class="form-group">
				<label for="reUserPwd">* 비밀번호 확인</label>
				 <input type="password" class="form-control" id="reUserPwd"  placeholder="비밀번호 확인">
				  &nbsp;&nbsp;&nbsp;&nbsp;
				 <span class="checkPwd error" style="color:red">비밀번호가 일치하지 않습니다.</span>
				 <input type="hidden" id="pwdDuplicateCheck" value="0">
			</div>
			<div class="form-group">
				<label for="userName">* 이름</label> 
				<input type="text" class="form-control" id="userName" name="userName" placeholder="이름" required>
			</div>
			<div class="form-group">
				<label for="yyyymmdd">* 생년월일</label>
				 <input type="text" class="form-control" id="yyyymmdd" name="yyyymmdd" placeholder="생년월일 8글자를 입력해주세요" required>
				 <input type="hidden" id="age" name="age">
			</div>
			<div class="form-group">
				* 성별<br>
				 &nbsp;&nbsp;
				 <input type="radio"  name="gender" value="M">&nbsp;&nbsp;남
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 <input type="radio"  name="gender" value="F">&nbsp;&nbsp;여
			</div>
			<div class="form-group">
				* 국내/외 여부 <br>
				 &nbsp;&nbsp;
				 <input type="radio"  name="domestic" value="국내인">&nbsp;&nbsp;국내인
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 <input type="radio"  name="domestic" value="국외인">&nbsp;&nbsp;국외인
			</div>
			<div class="form-group">
				<label for="email">* 이메일 주소</label> 
				<input type="email" class="form-control" id="email"  name="email" placeholder="이메일을 입력해주세요" required>
			</div>
			<div class="form-group">
				<label for="phone">* 핸드폰</label>
				 <input type="text" class="form-control" id="phone" name="phone" placeholder="('-' 없이 번호만 입력해주세요)" required>
				 <span class="checkPhone ok" style="color:green">이 핸드폰번호는 사용 가능합니다.</span>
				<span class="checkPhone error" style="color:red">이 핸드폰번호는 사용할 수 없습니다.</span>
				<input type="hidden" id="phoneDuplicateCheck" value="0">
			</div>
			<div class="form-group">
				* 주소 <input type="button" class="btn btn-info" onclick="member_execDaumPostcode()" value="우편번호 찾기" style="width:110px; height:50x; padding:0">
				<br>
				<input type="text" id="member_postcode" class="adress" name="post" placeholder="우편번호"  size="7" required>
				<input type="text" id="member_address"  class="adress" name="roadAddress" placeholder="도로명" size="46" required>
				<input type="text" id="member_detailAddress" class="adress" name="detailAddress" placeholder="상세주소" size="60" required>
				<input type="text" id="member_extraAddress" class="adress" name="extraAddress" placeholder="지번" size="8" required>
			</div>
			<div class="form-group">
				<label for="termsOfUse">* 이용약관</label>
			</div>
			<textarea rows="5" cols="55">
				제1조(목적)

본 회원약관은 TPO(이하 '갑'라 한다)이 운영하는 인터넷관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 관리자와 이용자(이하 '회원'라 한다)의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.


제2조 (약관의 효력)

1.본 약관은 '갑'에 회원 가입 시 회원들에게 통지함으로써 효력을 발생합니다.

2.'갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.

3.약관의 변경사항 및 내용은 '갑'의 홈페이지에 게시하는 방법으로 공시합니다.


제3조 (약관 이외의 준칙)

이 약관에 명시되지 않은 사항이 전기 통신 기본법, 전기통신 사업법, 기타 관련 법령에 규정되어 있는 경우 그 규정에 따릅니다.


제4조 (이용계약의 체결)

회원 가입 시 회원 약관 밑에 있는 동의버튼을 누르면 약관에 동의하여 이 계약이 체결된 것으로 간주한다.


제5조 (용어의 정의)

이 약관에서 사용하는 용어의 정의는 다음과 같습니다.

1.회원: '갑'과 서비스 이용에 관한 계약을 체결한 자

2.아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 '갑'이 승인하는 문자와 숫자의 조합

3.비밀번호: 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합



제6조 (이용신청)

1.회원 가입은 온라인으로 가입신청 양식에 기록하여 '갑'에 제출함으로써 이용신청을 할 수 있습니다.

2.가입희망 회원은 반드시 자신의 본명 및 주민등록번호로 이용신청을 하여야 하며, 1개의 ID만 신청을 할 수 있습니다.



제7조 (회원가입의 승낙)

'갑'의 회원 가입 신청 양식에 가입 희망 회원이 인터넷으로 제6조와 같이 신청하면 '갑'은 바로 가입을 승인하여 서비스를 이용할 수 있다.


제8조(회원가입 신청거절 및 강제 탈퇴)

1. '갑'은 타인의 명의나 주민등록번호를 도용하여 회원가입신청을 할 경우 회원가입신청을 거절할 수 있다.
2. 회원가입신청이 승인이 된 후에도 허위사실의 기재가 발각되거나 '갑'의 명예를 회손시키거나 음란물이나 불건전한 내용을 게재할 경우 회원의 자격을 강제 탈퇴시킬 수 있다.


제9조 (서비스 제공의 중지)

'갑'은 다음 각 호의 1에 해당하는 경우 서비스의 제공을 중지할 수 있습니다

1.설비의 보수 등을 위하여 부득이한 경우 

2.전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지하는 경우 

3.기타 '갑'이 서비스를 제공할 수 없는 사유가 발생한 경우.


제10조 ('갑'의 의무)

1. '갑'은  계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 합니다.


2.'갑'은 항상 회원의 신용정보를 포함한 개인신상정보의 보안에 대하여 관리에 만전을 기함으로서 회원의 정보보안에 최선을 다하여야 합니다.   


제11조 (개인정보보호)

1.'갑'은 이용자의 정보수집시 서비스의 제공에 필요한 최소한의 정보를 수집합니다. 

2.제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나  제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '갑'이 집니다. 다만, 다음의 경우에는 예외로 합니다. 
 ①통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우  
 ②전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
 ③범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
 ④기타 관계법령에서 정한 절차에 따른 요청이 있는 경우


3.회원은 언제든지 '갑'이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해 지체없이 처리합니다.



제12조 (회원의 의무)

1.회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 '갑'이 통지하는 사항을 준수하여야 하며, 기타 '갑'의 업무에 방해되는 행위를 하여서는 안됩니다.

2.회원은 '갑'의 사전 승낙 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.

3.회원은 서비스를 이용하여 얻은 정보를 '갑'의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.

4.회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우 서비스를 통하여 그 내용을 '갑'에게 통지하여야 합니다.

5.회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다. 
  ①다른 회원의 아이디(ID)를 부정 사용하는 행위 
  ②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위 
  ③선량한 풍속, 기타 사회질서를 해하는 행위
  ④타인의 명예를 훼손하거나 모욕하는 행위  
  ⑤타인의 지적재산권 등의 권리를 침해하는 행위 
  ⑥해킹행위 또는 컴퓨터바이러스의 유포행위  
  ⑦타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송 또는 타 사이트를 링크하는 행위  
  ⑧서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
  ⑨기타 관계법령에 위배되는 행위  
  ⑩게시판 등 커뮤니티를 통한 상업적 광고홍보 또는 상거래 행위


제13조 (게시물 또는 내용물의 삭제) 

'갑'은 서비스의 게시물 또는 내용물이 제12조의 규정에 위반되거나 '갑' 소정의 게시기간을 초과하는 경우 사전 통지나 동의 없이 이를 삭제할 수 있습니다.


제14조 (게시물에 대한 권리·의무)

게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있습니다.


제15조 (양도금지)

회원이 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.


제16조 (계약해지 및 이용제한) 

1.회원이 이용계약을 해지하고자 하는 때에는 본인이 서비스 또는 전자 우편을 통하여 해지하고자 하는 날의 1일전까지 (단, 해지일이 법정 공휴일인 경우 공휴일 개시 2일전까지)이를 '갑'에게 신청하여야 합니다.

2.'갑'은 해지 및 탈퇴를 한 회원이 다시 이용신청을 하는 경우 일정기간 그 승낙을 제한할 수 있습니다.




제17조 (면책·배상)

1.'갑'은 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고,  회원은 자기의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사 선택, 기타서비스 이용과 관련하여 어떠한 불이익이 발생 하더라도 이에 대한 모든 책임은 회원에게 있습니다.

2.'갑'은 제12조의 규정에 위반하여 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다. 

3.회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생 되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 모두 회원에게 있습니다.

4.회원이 제12조, 기타 이 약관의 규정을 위반함으로 인하여 '갑'이 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이로써 '갑'에게 손해가 발생하게 되는 경우, 이 약관을 위반한 회원은 '갑'에게  발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 '갑'을 면책시켜야 합니다.




제18조 (분쟁의 해결) 

1.'갑'과 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.

2.1항의 규정에도 불구하고 분쟁으로 인하여 소송이 제기될 경우 소송은 '갑'의 소재지를 관할하는 법원의 관할로 합니다.


부  칙

제 1 조 (시행일) 이 약관은 2020년 12월 08일부터 시행한다.
		</textarea>
		<input type="checkbox"  id="termsOfUse" value="0">&nbsp;&nbsp; TPO 서비스 이용약관에 동의 하시겠습니까?
		</div>
		<div class="modal-footer" style="text-align:center">
			<input type="submit" onclick="return validate();" value="가입하기" class="btn btn-info" style="width:70px;  padding:0; margin-top:4.5px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" data-dismiss="modal" value="닫기" class="btn btn-danger" style="width:40px;  padding:0;">
		</div>
	</form>
	
	<script>
	
		//우편주소 script 
   		 function member_execDaumPostcode() {
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
                    document.getElementById("member_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("member_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_postcode').value = data.zonecode;
                document.getElementById("member_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("member_detailAddress").focus();
            }
        }).open();
    }
   		 // 아이디 중복검사 및 길이 
   		 // 아이디 길이
   		 $('#userId').on("blur", function(){
   			 var userId = $(this).val();
   			 if(userId.length<4 || userId.length>12){
   				 $(".checkId").hide();
   				 $("#idDuplicateCheck").val(0);
   				 alert("4~12글자 사이로 입력해주세요.");
   				 return;
   			 }
   		 // 아이디 중복 확인 
   			 $.ajax({
   				url: "dupId.tpo",
   				type: "get",
   				data: {"userId": userId},
   			 	success: function(result){
					if(result=="true"){
						$(".checkId.error").hide();
						$(".checkId.ok").show();
						$("#idDuplicateCheck").val(1);
					}else{
						$(".checkId.error").show();
						$(".checkId.ok").hide();
						$("#idDuplicateCheck").val(0);
					}
   			 	}
   			 });
   		 });
   		 // 비밀번호 유효성 체크
   		 $("#reUserPwd").on("blur",function(){
   			 if($(this).val() != $("#userPwd").val()){
   				 $(".checkPwd.error").show();
   				 $("#pwdDuplicateCheck").val(0);
   			 }else{
   				 $(".checkPwd.error").hide();
   				 $("#pwdDuplicateCheck").val(1);
   			 }
   		 })
   		 // 생년월일로 나이 구하기
   		 $("#yyyymmdd").on("blur",function(){
   			 var ageValue = String($("#yyyymmdd").val());
   			 var year = ageValue.substring(0,4);
   			 // 오늘 날짜 기준으로 나이를 구하기 위해 Date객체 생성
   			 var today = new Date();
   			 console.log(today);
   			 // 오늘 날짜 객체의 연도에서 생년월일 객체의 연도를 뺌
   			 var years = today.getFullYear() - year;
   			 console.log(years+1);
   			$("#age").val(years+1);
   		 });
   		 
   		 
   		 // 이용약관 체크할때 마다 value값 변경
   		 $("#termsOfUse").on("click",function(){
   			 if($(this).val()==0){
   				 $(this).val(1);
   			 }else{
   				 $(this).val(0);
   			 }
   		 })
   		 // 가입하기 버튼 눌렀을 때 아이디 or 비밀번호 일치하지않는 경우
   		 function validate() {
   			 console.log($('input:radio[name=gender]').is(':checked'));
   			console.log($('input:radio[name=domestic]').is(':checked'));
   			 if($("#idDuplicateCheck").val()==0 || $("#pwdDuplicateCheck").val()==0){
   				 alert("아이디 또는 비밀번호를 확인 해주세요.");
   				 $("#userId").focus();
   				 return false;
   			 }else if($('input:radio[name=gender]').is(':checked') == false || $('input:radio[name=domestic]').is(':checked') == false){
   				 // 성별 체크 안한 경우
   				 if($('input:radio[name=gender]').is(':checked') == false){
   					alert("미입력 항목이 있습니다.(성별)");
   					$('input:radio[name=gender]').focus();
   					return false;
   				 }else{ // 국내외 체크 안한 경우
   					alert("미입력 항목이 있습니다.(국내외)");
   					$('input:radio[name=domestic]').focus();
   					return false;
   				 }
   			 }else if($("#phoneDuplicateCheck").val()==0){
   				alert("휴대폰 번호를 확인 해주세요.");
   				$("#phone").focus();
   				return false;
   			 }else{
   				 // 이용약관에 체크하지 않은 경우
   				if($('#termsOfUse').val()==0){
  	   				 alert("이용 약관에 동의해주세요.");
  	   				 $("#termsOfUse").focus();
  	   				 return false;
  	   			 }else{
  	   				alert("회원 가입되었습니다.");
  	   				return true;
  	   			 }
   			 }
   		 }
   		 
   	   // 핸드폰 번호 체크  
   		 // 핸드폰 
   		 $('#phone').on("blur", function(){
   			 var phone = $(this).val();
   		 // 핸드폰 중복 확인 
   			 $.ajax({
   				url: "dupPhone.tpo",
   				type: "get",
   				data: {"phone": phone},
   			 	success: function(result){
					if(result=="true"){
						$(".checkPhone.error").hide();
						$(".checkPhone.ok").show();
						$("#phoneDuplicateCheck").val(1);
					}else{
						$(".checkPhone.error").show();
						$(".checkPhone.ok").hide();
						$("#phoneDuplicateCheck").val(0);
					}
   			 	}
   			 });
   		 });
</script>
</body>
</html>