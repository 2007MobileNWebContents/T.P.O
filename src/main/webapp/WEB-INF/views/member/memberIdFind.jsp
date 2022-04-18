<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
.findId{
	display:none;
}
</style>
</head>
<body>
	<div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">아이디 찾기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <table class="table" style="text-align:left">
        	<tr>
        		<th class="active"> * 이름</th>
        	</tr>
        	<tr>
        		<td><input type="text" class="inputText" name="userName" size="57" required></td>
        	</tr>
        	<tr>
        		<th class="active"> * 핸드폰 번호</th>
        	</tr>
        	<tr>
        		<td><input type="text" class="inputText" name="phone" size="57" required></td>
        	</tr>
        </table>
         <span class="findId ok" style="color:green"></span>
		 <span class="findId error" style="color:red"></span>
      </div>
      <div class="modal-footer">
        <button type="button" id="idConfirm" class="btn btn-info" style="width:70px;  padding:0; margin-top:4.5px;">확인</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" style="width:40px;  padding:0;">닫기</button>
      </div>
      
      <!-- Script -->
      <script>
      // 회원 아이디 존재 여부 Ajax
      		$("#idConfirm").on("click",function(){
      			var userName = $('input:text[name="userName"]').val();
      			var phone = $('input:text[name="phone"]').val();
      				$.ajax({
      					url: "memberIdFind.tpo",
      					type: "get",
      					data: {"userName": userName,"phone": phone},
      					success: function(data){
      						if(data!=""){
      							$(".findId.ok").show();
      							$(".findId.error").hide();
      							$(".findId.ok").text("귀하의 아이디는 : " + data + " 입니다.");
      						}else{
      							$(".findId.ok").hide();
      							$(".findId.error").show();
      							$(".findId.error").text("등록된 회원정보가 없습니다.");
      						}
      					}
      				})
      		})
      </script>
</body>
</html>