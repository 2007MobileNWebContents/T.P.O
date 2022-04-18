<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
.checkPwd{
	display:none;
}
.myPageList{
	list-style:none;
}
.registerForm input{
	border-radius: 4px;
	border: 1px solid #ccc;
}
.searchButton{
	border-radius: 4px;
	border: 1px solid #24cc63;
	background: #24cc63;
	color: white;
}
</style>
</head>
<body style="background:#ececec;">
	<jsp:include page="/include/includeHeader.jsp"></jsp:include>
	<div id="page" ></div>
	<section id="section" style="margin-top:50px;">
	  <div style="margin-left:100px;">
		<b style="font-size:25px;font-weight:bold; color:black">마이페이지</b> <small style="color:#b9b9b9"> my Page</small>
		<hr style="height: 1px; width:13%; background-color: #007c6b;align:left; margin-left:0;">
		<div id="registerleft" style="float:left; width:17.5%;">
							<ul class="myPageList" style="line-style:none; padding-left:0px;">
							<li ><a href="myPageView.tpo" onclick="fnMemberInfo()"><b style="color:gray">개인정보 관리</b></a></li>
							<li><br></li>
							<li><a href="#" onclick="fnReservationInfo()"><b style="color:gray">항공 예약 정보</b></a></li>
							<li><br></li>
							<li><a href="#" onclick="fnMemberDelete()"><b style="color:gray">회원 탈퇴</b></a></li>
							</ul>
		</div >
		<div id="pageCategory" style="float:left; width:80%;">
		<div id="myPage" class="centerText">
		<h2 style="text-decoration:underline; margin-left:420px;">Personal Information</h2>
		<p style="margin-left:850px;">HOME > 마이페이지 > <b>개인정보관리</b></p>
		<br>
		<form action="modifyMember.tpo" method="post" style="float:left;">
			<input type="hidden" name="userName" value="${loginUser.userName }">
			<table class="registerForm" width="650" cellspacing="5" style="margin-left:400px;">
				<tr>
					<td> 아이디</td>
					<td><input type="text" name="userId" id="userId" value="${loginUser.userId }" readonly></td>
					<td><hr ></td>
				</tr>
				<tr>
					<td> 비밀번호</td>
					<td><input id="userPwd" type="password" name="userPwd" value="${loginUser.userPwd }" required></td>
					<td><hr></td>
				</tr>
				<tr>
					<td> 비밀번호 확인</td>
					<td>
					<input id="reuserPwd"  type="password" name="reuserPwd" required>
					<span class="checkPwd ok" style="color:green">사용가능한 비밀번호 입니다.</span>
					<span class="checkPwd error" style="color:red">비밀번호가 일치하지 않습니다.</span>
					<span class="checkPwd check" style="color:red">비밀번호를 확인해주세요.</span>
					</td>
					<td><hr></td>
				</tr>
				<tr>
					<td> 나이</td>
					<td><input type="number" min="20" max="100" name="age" value="${loginUser.age }" readonly></td>
					<td><hr></td>
				</tr>
				<tr>
					<td> 성별</td>
					<c:if test="${loginUser.gender eq 'M' }">
					<td>
					<input type="radio" name="gender" value="M" checked>남
					<input type="radio" name="gender" value="F">여
					</td>
					</c:if>
					<c:if test="${loginUser.gender eq 'F' }">
						<td>
						<input type="radio" name="gender" value="M">남
						<input type="radio" name="gender" value="F" checked>여
						</td>
					</c:if>
					<td><hr></td>
				</tr>
				<tr>
					<td> 국내/외 여부</td>
					<c:if test="${loginUser.domestic eq '국내인' }">
					<td>
					<input type="radio" name="domestic" value="국내인" checked>국내인
					<input type="radio" name="domestic" value="국외인">국외인
					</td>
					</c:if>
					<c:if test="${loginUser.domestic eq '국외인' }">
						<td>
						<input type="radio" name="domestic" value="국내인">국내인
						<input type="radio" name="domestic" value="국외인" checked>국외인
						</td>
					</c:if>
					<td><hr></td>
				</tr>
				<tr>
					<td> 이메일</td>
					<td><input type="email" name="email" value="${loginUser.email }" required></td>
					<td><hr></td>
				</tr>
				<tr>
					<td> 전화번호</td>
					<td><input type="text" name="phone" value="${loginUser.phone }" required></td>
					<td><hr></td>
				</tr>
				<!-- 디비에서 가져온 주소값은 우편번호, 도로명 주소, 상세주소 형태 -->
				<!-- ,(comma)를 기준으로  잘라서 우편번호, 도로명 주소, 상세 주소에 입력 -->
				<!--  c:forTokens var={addr} items="${loginUser.address}" delims="," varStatus="status" -->
				<c:forTokens var="addr" items="${loginUser.address }" delims="," varStatus="status">
				<c:if test="${status.index eq 0 }">
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" id="member_postcode" name="post" size="6" value="${addr }" required>
						<button type="button" class="searchButton" onclick="member_execDaumPostcode()">검색</button>
					</td>
					<td><hr></td>
				</tr>
				</c:if>
				
				<c:if test="${status.index eq 1 }">
				<tr>
					<td>도로명 주소</td>
					<td><input type="text" id="member_address" name="roadAddress" value="${addr }" style="width:250px;" required></td>
					<td><hr></td>
				</tr>
				</c:if>
				
				<c:if test="${status.index eq 2 }">
				<tr>
					<td>상세 주소</td>
					<td><input type="text" id="member_detailAddress" name="detailAddress" value="${addr }" required></td>
					<td><hr></td>
				</tr>
				</c:if>
				
				<c:if test="${status.index eq 3 }">
				<tr>
					<td>지번</td>
					<td><input type="text" id="member_extraAddress"  name="extraAddress" value="${addr }" required></td>
					<td><hr></td>
				</tr>
				</c:if>
				</c:forTokens>
				<tr style="line-height:100px;">
					<td colspan="4" align="center" style="padding-right:280px; padding-top:30px;">
					<input class="btn btn-primary" type="submit" onclick="return fnSubmit()" value="수정하기">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="btn btn-danger" type="reset" value="입력 취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
	</div>
		<!-- 이놈이 회원정보 div임 -->
	</section>
	
	
	<jsp:include page="/include/includeFooter.jsp"></jsp:include>
	
	
	
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
	
	// 비밀번호 일치 여부 
	$("#reuserPwd").on("blur",function(){
		if($("#userPwd").val()==$("#reuserPwd").val()){
			$(".checkPwd.ok").show();
			$(".checkPwd.error").hide();
		}else{
			$(".checkPwd.ok").hide();
			$(".checkPwd.error").show();
		}
	})
	
	// 비밀번호 일치 하지 않았을 때 수정하기 버튼 클릭 ㄴㄴ
	function fnSubmit(){
		if($("#userPwd").val()!=$("#reuserPwd").val()){
			alert("필수 항목을 입력해주세요.");
			return false;
		}else{
			alert("회원정보가 수정되었습니다.");
			return true;
		}
	}
	
	// 항공예약정보 페이지 보여주기
	function fnReservationInfo(){
		$("#pageCategory").load("reservationInfo.tpo");
		$("#myPage").hide(); 
 	    $("#deletePage").hide(); 
	}
	// 항공 예약 정보 페이지 보여주기
	
	// 회원 탈퇴 페이지 보여주기
	function fnMemberDelete(){
	 	$("#pageCategory").load("deleteMemberView.tpo");
		$("#myPage").hide(); 
		$("#title").text("회원탈퇴");
	}
	</script>
</body>
</html>