<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39e18fbed61f7ff631c9562c6207cdf1&libraries=services"></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>




<title>이것은 명소 상세 페이지</title>
<!-- <style>
ul img {
	width: 150px;
	height: 150px;
}

#pic_map {
	display: inline-block;
}
/* text */
.media-body {
	float: left;
}
/* 사진 */
.media-object {
	width: 60%; '
	float: left;
}
/* 지도 */
#map {
	float: right;
}
</style> -->
</head>
<body style="background-color:#ececec;">
	<div id="page"></div>
	<!--  header -->

	<jsp:include page="/include/includeHeader.jsp" />

	<!-- content -->
	<section class="gtco-container sectionmain" role="contentinfo">
		<div class="section-container" style="margin-top: 950px;">
			<div class="infoArea" style="height: 270px; width: 100%; background-color: white; ">
				<div class="well well-sm infoImage"
					style="width: 38%; height: 270px; float: left;">
					<img src="${sight.sPicture}" style="width: 100%; height: 250px;">
				</div>
				<div class="well well-sm  restName" style="width: 60%; background-color: white; color:black; border:none; height: 250px; margin-left: 2%; float: left; padding-left: 35px; padding-top: 23px;">
					<b style="font-size:18px;">${sight.sName }</b>
					<div style="margin-top: 5px; margin-left: 24px;">
					<p style="line-height: 200%;">
						<b style="font-size:16.5px;">주소 : </b> ${sight.sLocation } <br>
						<c:if test="${sight.restDate ne null}">
						<b style="font-size:16.5px;">휴무일 : </b> ${sight.restDate} <br>
						</c:if>
						<c:if test="${sight.restDate eq null}">
						<b style="font-size:16.5px;"> 휴무일 : </b> 연중무휴<br>
						</c:if>
						
					
						
						<c:if test="${fn:contains(sight.sBabyCarriage,'있음' or '가능')}">
						<b style="font-size:16.5px;">유모차 대여 :</b> 가능<br>
						</c:if>
<%-- 				     	<c:if test="${fn:contains(sight.sBabyCarriage,'가능')}">
						<b style="font-size:16.5px;">유모차 대여 :</b> 가능<br>
						</c:if> --%>
						<c:if test="${!fn:contains(sight.sBabyCarriage,not '있음'and'가능')}">
						<b style="font-size:16.5px;">유모차 대여 :</b> 불가능<br>
						</c:if>
						
						<c:if test="${fn:contains(sight.sParking,'있음' or '가능')}">
						<b style="font-size:16.5px;">주차유무 :</b> 가능<br>
						</c:if>
 						<%-- <c:if test="${fn:contains(sight.sParking,'가능')}">
						<b style="font-size:16.5px;">주차유무 :</b> 가능<br>
						</c:if> --%>
						<c:if test="${fn:contains(sight.sParking,null)}">
						<b style="font-size:16.5px;">주차유무 :</b> 불가능<br>
						</c:if>
						<c:if test="${fn:contains(sight.sParking, not '있음' and '가능')}">
						<b style="font-size:16.5px;">주차유무 :</b> 불가능<br>
						</c:if>
						<c:if test="${fn:contains(sight.sParking,'불가능')}">
						<b style="font-size:16.5px;">주차유무 :</b> 불가능<br>
						</c:if>

						
						<c:if test="${fn:contains(sight.sPet,'있음'or'가능')}">
						<b style="font-size:16.5px;">애완동물 동반 :</b> 가능
						</c:if>
<%-- 						<c:if test="${fn:contains(sight.sPet,'가능')}">
						<b style="font-size:16.5px;">애완동물 동반 :</b> 가능
						</c:if> --%>
						<c:if test="${!fn:contains(sight.sPet,not '있음'and'가능')}">
						<b style="font-size:16.5px;">애완동물 동반 :</b> 불가능
						</c:if>
					</p>
						<!-- <button type="button" class="btn btn-primary btn-sm" id="modalMap"
							onclick="modalMap()">지도보기</button> -->
						<button type="button" class="btn btn-sm" id="modalMap" style="background-color:#f8ca00; color:black; font-weight: bold; margin-top:-8%; margin-left:73%;"
							data-toggle="modal" data-target="#myFullsizeModal" >지도보기</button>
					</div>
				</div>
			</div>
			
			<div class="well well restIntro"
				style="width: 100%; padding-top: 20px; margin-top:3%; margin-bottom:2%; padding-bottom: 5px;  background-color:white; border : 2px solid #0D7B6C; color:black;">

				&nbsp;&nbsp;&nbsp;<b style="font-size:18px;">관광지 소개</b> <br>
				<div style="margin-left: 20px; margin-top:1%"><p style="line-height: 210%;">
					${sight.sIntroduce }
				</p></div>
			</div>
		</div>
		
		
		
		
		<ul style="margin-left:-3.5%;">
			<c:forEach items="${review}" var="reviewList">
				
				<c:if test="${reviewList.reviewPicture ne null}">
				<li class="media" style="height:210px;  background-color:white; border : none; border-radius: 10px;">
			
					<div class="media-body" style="padding-left:15px; padding-top:5px; ">
						<p class="mt-0 mb-1"><b style="font-size:23px; color:black;">${reviewList.reviewTitle }</b>
						&nbsp;&nbsp;&nbsp;${ reviewList.userId}</p>						
							<div style=" float : left; margin-left:12px; margin-top:1px; width: 130px; height: 155px; ">
							<img style="width: 130px; height: 130px;"  class="mr-3" src="../resources/reviewuploadfiles/${reviewList.reviewPicture }" alt="리뷰사진">														
						<p style=" margin-top:8px; font-size:13px; float: none;">
						 ${reviewList.reviewEnrollDate }
						</p>
							</div>
							<div  style=" float : left; margin-left:15px; font-size:18px;">
							${reviewList.reviewContent }
						</div>
					</div>
					<div style="float:left; margin-right:-50px;">
					<div style="width:200px; margin-left:15px;">
                   <b>별점 &nbsp;:&nbsp;  </b>
                  <c:choose>
                  	<c:when test="${reviewList.reviewScore eq 1 }">
                  		☆☆☆☆<span style="color:gold;">★</span>
                  	</c:when>
                  	<c:when test="${reviewList.reviewScore eq 2 }">
                  		☆☆☆<span style="color:gold;">★★</span>
                  	</c:when>
                  	<c:when test="${reviewList.reviewScore eq 3 }">
                  		☆☆<span style="color:gold;">★★★</span>
                  	</c:when>
                  	<c:when test="${reviewList.reviewScore eq 4 }">
                  		☆<span style="color:gold;">★★★★</span>
                  	</c:when>
                  	<c:when test="${reviewList.reviewScore eq 5 }">
                  		<span style="color:gold;">★★★★★</span>
                  	</c:when>
                  	<c:otherwise>
                  					☆☆☆☆☆
                  	</c:otherwise>            
                  </c:choose></div>
					<div style="width:200px; margin-top:145px;">
					<c:if test="${reviewList.userId eq loginUser.userId && !empty loginUser}">
					<a href="updateReviewView.tpo?reviewNo=${reviewList.reviewNo}" style="color:#0D7B6C; ">리뷰수정</a>&nbsp;&nbsp;&nbsp;
					<a href="deleteReview.tpo?reviewNo=${reviewList.reviewNo}&sNo=${reviewList.sNo}" style=" color:#0D7B6C;">리뷰삭제</a>
					</c:if>
					</div>
					</div>
					</li>
				</c:if>
				<c:if test="${reviewList.reviewPicture eq null}">
				<li class="media" style=" height:100px; background-color:white; border : none;  border-radius: 10px; "> 
					<div  style="padding-left:15px; padding-top:5px; font-size:13px; width:100%;">
						<p class="mt-0 mb-1"><b style="font-size:23px; color:black;">${reviewList.reviewTitle }</b>&nbsp;&nbsp;&nbsp;${ reviewList.userId}</p>
						<p style="margin-left:12px; margin-top:-5px; font-size:18px;">${reviewList.reviewContent }</p>
						<p style="margin-left:12px; margin-top:-15px; font-size:13px;">
						 ${reviewList.reviewEnrollDate }
						</p>
					</div>
					<div style="float:left; margin-right:-50px;">
					<div style="width:200px; margin-left:15px;">
					<div id="star"> <!-- 부모 -->
                   <b>별점 &nbsp;:&nbsp;  </b>
                  <c:choose>
                  	<c:when test="${reviewList.reviewScore eq 1 }">
                  		☆☆☆☆<span style="color:gold;">★</span>
                  	</c:when>
                  	<c:when test="${reviewList.reviewScore eq 2 }">
                  		☆☆☆<span style="color:gold;">★★</span>
                  	</c:when>
                  	<c:when test="${reviewList.reviewScore eq 3 }">
                  		☆☆<span style="color:gold;">★★★</span>
                  	</c:when>
                  	<c:when test="${reviewList.reviewScore eq 4 }">
                  		☆<span style="color:gold;">★★★★</span>
                  	</c:when>
                  	<c:when test="${reviewList.reviewScore eq 5 }">
                  		<span style="color:gold;">★★★★★</span>
                  	</c:when>
                  	<c:otherwise>
                  					☆☆☆☆☆
                  	</c:otherwise>            
                  </c:choose>
              	 </div>
              	 </div>
					<div style="width:200px; margin-top:40px;">
					<c:if test="${reviewList.userId eq loginUser.userId && !empty loginUser}">
					<a href="updateReviewView.tpo?reviewNo=${reviewList.reviewNo}" style="color:#0D7B6C; ">리뷰수정</a>&nbsp;&nbsp;&nbsp;
					<a href="deleteReview.tpo?reviewNo=${reviewList.reviewNo}&sNo=${reviewList.sNo}" style=" color:#0D7B6C;">리뷰삭제</a>
					</c:if>
					</div>
					</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
		<input type="hidden" name="loginUserId" value="${loginUser.userId }">


		<div id="buttons" style="text-align: right; margin-top:2.5%;">
			<button onclick="returnList()" class="btn btn-info btn-xs" style="background-color: #f8ca00; border:none;  color:black;"><b>뒤로가기</b></button>
			<button onclick="return writeForm()" id="writeReview" type="button"
				class="btn btn-info btn-xs" style="background-color: #007c6b ; border:none; color:white;"><b>리뷰작성</b></button>
		</div>
		
		<%-- <ul>
		<c:forEach items="${review}" var="reviewList">
			<li class="media"><img class="mr-3" src="../resources/reviewuploadfiles/${reviewList.reviewPicture }"
				alt="리뷰사진">
				<div class="media-body">
					<h5 class="mt-0 mb-1">${reviewList.reviewTitle }</h5>
					${reviewList.reviewContent }
				</div>
				  <a href="javascript:location.href='deleteReview.tpo?reviewNo=${reviewList.reviewNo}'"
				  class="btn btn-primary">리뷰삭제</a>
				  <a href="javascript:location.href='updateReviewView.tpo?reviewNo=${reviewList.reviewNo}'"
				  class="btn btn-primary">리뷰수정</a>
				</li>
		</c:forEach>
		</ul> --%>






<!-- 모달 -->
<div class="modal fade" id="myFullsizeModal" tabindex="-1"
				role="dialog" aria-labelledby="myFullsizeModalLabel">
				<div class="modal-dialog modal-fullsize modal-lg" role="document">
					<div class="modal-content modal-fullsize">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel"></h4>
						</div>
						<div class="modal-body">
							<div id="map" style="width: 770px; height: 600px;"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>


		<script>
	function returnList(){
		location.href="sightList.tpo"
	}
	function writeForm(){
			var loginUserId = $('input[name="loginUserId"]').val();
			console.log(loginUserId);
			if(loginUserId!=''){
			location.href="sightReviewWrieteForm.tpo?sNo=${sight.sNo}"
			}else{
				alert("로그인 후 이용 가능합니다.");
			return false;
			}
	}
	
	$(function() {
		var coords;
		//지도
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		// 모달위에 지도 relayout()실행하기
		$('.modal').on('shown.bs.modal', function() {
			map.relayout();
			map.setCenter(coords);
		});

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(	"${sight.sLocation }",
						function(result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								coords = new kakao.maps.LatLng(
										result[0].y, result[0].x);
								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;">'
													+ "${sight.sName }"
													+ '</div>'
										});
								infowindow.open(map, marker);
								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								
							}

						});		
		/* function modalMap() {
			window.open("", "_blank", "width=770,height=460");
		} */
	});

</script>


	</section>
	<!-- footer -->
	<jsp:include page="/include/includeFooter.jsp" />
</body>
</html>