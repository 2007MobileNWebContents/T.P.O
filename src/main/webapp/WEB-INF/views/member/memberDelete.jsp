<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<div id="deletePage">
		<h2 style="text-decoration:underline; margin-left:500px;">JOIN OUT</h2>
		<p style="margin-left:820px;">HOME > 마이페이지 > <b>회원탈퇴</b></p>
		<form action="deleteMember.tpo" method="post">
		<input type="hidden" id="userId" name="userId" value="${loginUser.userId }">
		<div id="deleteTop" style="margin-top:50px; margin-left:100px;  background:#f3f3f3;width:65%;">
			<div style="background:beige; padding: 10px;"><h3 style="color:#aeaaaa;">01</h3><h3 style="margin-top:-10px;">회원 탈퇴 안내</h3></div>
			<div style="padding-left:15px; padding-right:15px; padding-top:10px; padding-bottom:10px;" >고객님께서 회원 탈퇴를 원하신다니 저희 항공서비스가 많이 부족하고 미흡했나 봅니다.<br>
					불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br><br>
					■ 아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.<br>
					1. 회원 탈퇴 시 고객님의 정보는 예약 정보 및 취소를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에 따라 관리 됩니다.<br>
					2. 탈퇴 시 고객님께서 보유하셨던 적립금은 삭제 됩니다.
			</div>
		</div>
		<div id="deleteBottom" style="margin-top:50px; margin-left:100px; background:#f3f3f3;width:65%; "> 
			<div style="background:beige; padding: 10px;"><h3 style="color:#aeaaaa;">02</h3><h3 style="margin-top:-10px;">회원 탈퇴 하기</h3></div>
			<div style="padding-left:15px; paddin-right:15px; padding-top:15px; padding-bottom:10px;" >
			<b>비밀번호가 어떻게 되세요?</b>
			&nbsp;&nbsp;
			<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력해주세요." style="width:200px; border-radius: 4px; border: 1px solid #ccc;">
			<br>
			<br>
			<b>무엇이 불편하셨나요?</b><br>
			<table>
			<tr>
				<td><input type="checkbox"> 고객서비스(상담,예약 등) 불만</td>
				<td>&nbsp;&nbsp;<input type="checkbox"> 예약서비스 불만</td>
			</tr>
			<tr>
				<td><input type="checkbox"> 사이트 기능 불만</td>
				<td>&nbsp;&nbsp;<input type="checkbox"> 개인 정보유출 불만<br></td>
			</tr>
			<tr>
				<td><input type="checkbox"> 환불 신청 불만 </td>
				<td>&nbsp;&nbsp;<input type="checkbox"> 사이트 신뢰도 불만</td>
			</tr>
			<tr>
				<td><input type="checkbox"> 방문 기능 낮음</td>
				<td>&nbsp;&nbsp;<input type="checkbox"> 기타</td>
			</tr>
			</table>
			<br>
			<b>고객님의 진심어린 충고 부탁드립니다.</b><br>
			<textarea rows="9" cols="50" class="form-control" style="width:98%; margin-top:1%; background-color:white;">
			
			</textarea>
			</div>
		</div>
		<br>
		<input type="submit" id="submit" class="btn btn-primary" style="margin-left:500px;" onclick="return fnDeleteButton()" value="탈퇴하기" > 
		</form>
	</div>
	<script>
		function fnDeleteButton(){
			var userId = $("#userId").val();
			var userPwd = $("#userPwd").val();
			var loginPwd = ${loginUser.userPwd};
			if(userPwd!=""){  // 비밀번호 입력했을때
				 if($("#userPwd").val()==loginPwd){
					 alert("회원 탈퇴 되었습니다.");
					 return true;
				 }else{
					 alert("비밀번호를 다시 확인해주세요.");
					 return false;
				 }
		 	}else{ // 비밀번호 입력값 없을 때
				alert("비밀번호를 입력해주세요.");
				return false;
			} 
		}
	</script>
</body>
</html>