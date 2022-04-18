<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>리뷰 작성 페이지</title>
<style>
 #review_grade a{ text-decoration: none; color: gray; }
#review_grade a.on{ color: gold; }
</style>


</head>
<body style="background-color:#ececec;">
	<!--  header -->


	<jsp:include page="/include/includeHeader.jsp" />
<div id="page"></div>

<!--  content -->
	<section class="gtco-container sectionmain" role="contentinfo" style="margin-top:2%;">
	<b style="font-size: 30px; font-weight: bold; color:black;">명소 리뷰 작성 </b>

		<div class="container" role="main"  style="margin-top:15px; margin-left:5%;">

			

			<form name="form" id="form" role="form" method="post" action="insertReview.tpo" enctype="multipart/form-data">
				<div class="mb-3">
				<label for="star">별점</label>
					 <div id="review_grade" style="font-size:25px;">
                            	<a value="1" class="on" style="color:gold;">★</a> <!-- 자식들-->
                                <a value="2">★</a> 
                                <a value="3">★</a>
                                <a value="4">★</a>
                                <a value="5">★</a> 
                                <input type="hidden" name="reviewScore" id="gradeValue" value="1">
                   </div>

					

				</div>
				
				
				
				
				<div class="mb-3">
					<div style="float: left;">제목</div> <div style="float: left; margin-left:40%;"><input type="file"  name="uploadFile" value="사진등록" style="float: left; margin-left:100%; margin-bottom:4%;"></div>

					<input type="text"  class="form-control" name="reviewTitle"  placeholder="제목을 입력해 주세요" style="width:1000px; float: none; background-color:white;">

				</div>

				

				<div class="mb-3">

					<label for="reg_id">작성자</label>

					<input type="text"  class="form-control" name="userId" value="${sessionScope.loginUser.userId }"  style="width:1000px; background-color:white;" readonly="readonly"> 

				</div>

				

				<div class="mb-3">

					<label for="content">내용</label>

					<textarea rows="9" cols="40" name="reviewContent" class="form-control" placeholder="내용을 입력해주세요" id="reContent" onkeyup="fnChkByte(this);" style="width:1000px;  background-color:white;"></textarea>
					<div style="margin-left: 83.5%; margin-top:1%;"><span id="byteInfo">0</span>/100byte</div>

				</div>
				
<!-- 				<div class="mb-3">

					<label for="file">사진</label>

					<input type="file"  class="form-control" name="uploadFile" >
				</div> -->
				
				<div style="margin-left:67%; margin-top:5%;">
			
			        <input type="hidden" name="sNo"  value="${sNo }">
                    <input type="hidden" name="ref"  value="">
                    <input type="hidden" name="ref_step"  value="">
                    <input type="hidden" name="ref_level"  value="">
					
				<input type="submit" value="작성완료" class="btn" style="background-color: #007c6b; color:white; ">
                 <input type="reset" value="작성취소" class="btn btn-warning" style="background-color: #f8ca00; border:none; color:black;">

			</div>
			</form>

			

		</div>

	
<%--     <div style="margin-top: 50px;">
        <b style="font-size: 30px; font-weight: bold;">명소 리뷰 작성 </b>
        <form action="insertReview.tpo" method="post" enctype="multipart/form-data">
            <div class="table table-responsive" style="margin-top:15px; margin-left:5%;">
            <table class="table table-striped" style="width:90%;">
             <tr>
                <td>평점</td>
                <td>
                   <div id="review_grade">
                                <a value="1" class="on" style="color:gold;">★</a> <!-- 자식들-->
                                <a value="2">★</a> 
                                <a value="3">★</a>
                                <a value="4">★</a>
                                <a value="5">★</a> 
                                <input type="hidden" name="reviewScore" id="gradeValue" value="1">
                   </div>
                </td>
            </tr>
            <tr>
                <td>작성자</td>
                <td><input type="text"  class="form-control" name="userId" value="${sessionScope.loginUser.userId }" disabled></td>
            </tr>

            <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" name="reviewTitle" ></td>
            </tr>
            <tr>
                <td>글내용</td>
                <td><textarea rows="9" cols="40" name="reviewContent" class="form-control" id="reContent" onkeyup="fnChkByte(this);"></textarea>
           		<div style="margin-left: 89%; margin-top:1%;"><span id="byteInfo">0</span>/100byte</div>
           		</td>
            </tr>
           
            <tr>
                <td>사진 업로드</td>
                <td><input type="file"  class="form-control" name="uploadFile" ></td>
            </tr>
            <tr>  
                <td colspan="2"  class="text-center">
                 
                    <input type="hidden" name="sNo"  value="${sNo }">
                    <input type="hidden" name="ref"  value="">
                    <input type="hidden" name="ref_step"  value="">
                    <input type="hidden" name="ref_level"  value="">
                 
                    <input type="submit" value="작성완료" class="btn btn-success" style="background-color: #f8ca00; border:none;  color:black;">
                    <input type="reset" value="작성취소" class="btn btn-warning" style="background-color: #007c6b ; border:none; color:white;">
                </td>
            </tr>
             
          </table>
         
     
            </div>
        </form>   
    </div> --%>
    <script type="text/javascript">
    function fnChkByte(obj) {
        var maxByte = 100; //최대 입력 바이트 수
        var str = obj.value;
        var str_len = str.length;
     
        var rbyte = 0;
        var rlen = 0;
        var one_char = "";
        var str2 = "";
     
        for (var i = 0; i < str_len; i++) {
            one_char = str.charAt(i);
     
            if (escape(one_char).length > 4) {
                rbyte += 2; //한글2Byte
            } else {
                rbyte++; //영문 등 나머지 1Byte
            }
     
            if (rbyte <= maxByte) {
                rlen = i + 1; //return할 문자열 갯수
            }
        }
     
        if (rbyte > maxByte) {
            alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
            str2 = str.substr(0, rlen); //문자열 자르기
            obj.value = str2;
            fnChkByte(obj, maxByte);
        } else {
            document.getElementById('byteInfo').innerText = rbyte;
        }
    }

    $(document).ready(function(){
    	   $('#review_grade a').click(function(){
    	      $(this).parent().children("a").removeClass("on");
    	      $(this).addClass("on").prevAll("a").addClass("on");
    	      console.log($(this).attr("value"));
    	      $("#gradeValue").val($(this).attr("value"));
    	      });
    	});
    
    
    
    </script>

		</section>
	<!-- footer -->
	<jsp:include page="/include/includeFooter.jsp" />
</body>
</html>
