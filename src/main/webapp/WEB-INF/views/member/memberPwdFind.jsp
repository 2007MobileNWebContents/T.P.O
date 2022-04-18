<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
.inputText{
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
.inputEmail{
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
 #mailSend{
	width:80px;  
	height: 40px; 
	margin-left:30px; 
	padding:0; 
	margin-top:4.5px; 
	border: 2px; solid #337ab7 !important;
} 
.table tr:nth-child(5){
	display:none;  
}
.table tr:nth-child(6){
	display:none;  
}
.table tr:nth-child(7){
	display:none;
}
.table tr:nth-child(8){
	display:none;
}
</style>
</head>
<body>
<div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">비밀번호 찾기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <table class="table" style="text-align:left">
        	<tr>
        		<th class="active"> * 아이디</th>
        	</tr>
        	<tr>
        		<td><input type="text" class="inputText" name="userId" size="57"></td>
        	</tr>
        	<tr>
        		<th class="active"> *  이메일</th>
        	</tr>
        	<tr>
        		<td>
        		<input type="email" class="inputEmail" name="email" size="40">
        		<button type="button" id="mailSend" class="btn btn-info">메일 발송</button>
        		</td>
        	</tr>
        	<tr>
        	<td> <!-- 5번째 -->
        		<span class="findPwd ok" style="color:green">귀하의 이메일로 인증번호가 발송되었습니다.</span>
		 		<span class="findPwd error" style="color:red">등록되지 않은 이메일입니다.</span>
        	</td>
        	</tr>
        	<tr> <!-- 6번째 -->
        		<th class="active"> *  인증번호</th>
        	</tr>
        	<tr>  <!-- 7번째 -->
        		<td>
        		<input type="text" class="confirmedNum" name="confiremdNum" size="10">
        		<input type="hidden" class="randomNum" name="randomNum">
        		</td>
        	</tr>
        	 <tr> <!-- 8번째 -->
        		<td><span class="resultPwd" style="color:green"></span></td>
        	</tr>
        </table>
      </div>
      <div class="modal-footer">
     	<button type="button" id="pwdConfirm" class="btn btn-info" style="width:70px;  padding:0; margin-top:4.5px;">확인</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" style="width:40px;  padding:0;">닫기</button>
      </div>
      
      <!-- Script -->
      <script>
      		// 메일 발송 버튼 누를 시 등록된 회원와 일치 여부	
      	    $("#mailSend").on("click",function(){
      	    	var userId = $(".inputText").val();
      	    	var email = $(".inputEmail").val();
      	    	// console.log(userId);
      	    	console.log(email);
      	    	$.ajax({
      	    		url: "emailCheck.tpo",
      	    		type: "get",
      	    		data: {"userId":userId,"email":email},
      	    		dataType: "json",
      	    		success: function(data){
      	    			/* console.log(data.emailCheck);
      	    			console.log(data.randomNumber); */
      	    			if(data.emailCheck=="true"){
      	    			// 일치,불일치 태그  
      	    			$(".table tr:nth-child(5)").show(); 
      	    			$(".findPwd.ok").show();
      	    			$(".findPwd.error").hide();
      	    			// 인증번호 문구란 태그
      	    			$(".table tr:nth-child(6)").show();
      	    			// 인증번호 입력 태그
      	    			$(".table tr:nth-child(7)").show();
      	    			// 받아온 인증번호를 input:hidden태그에 넣어놓음(비교하기 위해)
      	    			$(".randomNum").val(data.randomNumber);
      	    			}else{
          	    		$(".table tr:nth-child(5)").show();
          	    		$(".findPwd.ok").hide();
          	    		$(".findPwd.error").show();
          	    		$(".table tr:nth-child(6)").hide();
          	    		$(".table tr:nth-child(7)").hide();
      	    			}
      	    		}
      	    	})
      	    })
      	    // 확인버튼 눌렀을 때 인증번호 일치 확인 후 비밀번호 보여줌
      	    $("#pwdConfirm").on("click",function(){
      	    	var userId = $(".inputText").val();
      	    	var email = $(".inputEmail").val();
      /* 	    console.log($(".randomNum").val());
      	    	console.log($(".confirmedNum").val()); */
      	    	if(userId=='' || email==''){
      	    		if(userId==''){
      	    			alert("아이디를 입력해주세요.");
      	    			$(".inputText").focus();
      	    			return;
      	    		}else{
      	    			alert("이메일을 입력해주세요.");
      	    			$(".inputEmail").focus();
      	    			return;
      	    		}
      	    	}
      	    	if($(".randomNum").val()==$(".confirmedNum").val()) {
      	    		$.ajax({
      	    			url: "resultPwd.tpo",
      	    			type: "post",
      	    			data: {"userId":userId, "email":email},
      	    			success: function(data){
      	    			if(data!=''){
      	    			$(".table tr:nth-child(8)").show();
      					$(".resultPwd").text("귀하의 비밀번호는 : " + data + " 입니다.");
      	    			}else{
      	    				alert("잘못된 입력입니다.");
      	    				return;
      	    			}
      	    			}
      	    		})
      	    	}else{
      	    		$(".table tr:nth-child(8)").hide();
      	    		alert("인증번호를 다시 확인해 주세요.");
      	    		$(".confiremdNum").focus();
      	    	}
      	    })
      </script>
</body>
</html>