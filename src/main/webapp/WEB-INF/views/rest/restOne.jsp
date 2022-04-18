<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<!--
   Traveler by freehtml5.co
   Twitter: http://twitter.com/fh5co
   URL: http://freehtml5.co
-->
<html>
<head>

<!-- Modal  JQuery -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<!-- 지도 api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39e18fbed61f7ff631c9562c6207cdf1&libraries=services"></script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


</head>
<body style="background-color: #ececec">

	<!-- <div class="gtco-loader"></div> -->

	<div id="page"></div>


	<!-- <div class="page-inner"> -->
	<jsp:include page="/include/includeHeader.jsp" />
	<!--헤더 끝-->
	<!--section시작-->
	<section class="gtco-container sectionmain" role="contentinfo">
		<div class="section-container" style="margin-top: 950px;">
			<div class="infoArea" style="height: 270px; width: 100%;">
				<div class="well well-sm infoImage"
					style="width: 38%; height: 250px; float: left;">
					<c:if test="${room[0].reImage ne '없음'}">
						<img src="${room[0].reImage }" style="width: 100%; height: 230px;">
					</c:if>
					<c:if test="${room[0].reImage  eq '없음'}">
						<img src="resources/images/noimage.png"
							style="width: 100%; height: 310px; margin-top: -10%;">
					</c:if>
				</div>
				<div class="well well-sm  restName" style="width: 60%; background-color: white; color:black; border:none; height: 250px; margin-left: 2%; float: left; padding-left: 35px; padding-top: 23px;">
					<b style="font-size:18px;">${room[0].reName }</b>
					<div style="margin-top: 5px; margin-left: 24px;">
					<p style="line-height: 200%;">
						<b style="font-size:16.5px;">전화번호 :</b> ${room[0].rePhone } <br>
						<b style="font-size:16.5px;">홈페이지 :</b> ${room[0].reUrl } <br>
						<b style="font-size:16.5px;">주소 :</b> ${room[0].reAddr } <br>
						<b style="font-size:16.5px;">주차유무 :</b>
						<c:if test="${room[0].pStatus eq 'Y'}">가능</c:if>
						<br> <br>
					</p>
						<!-- <button type="button" class="btn btn-primary btn-sm" id="modalMap"
							onclick="modalMap()">지도보기</button> -->
						<button type="button" class="btn btn-sm" id="modalMap" style="background-color:#f8ca00; color:black; font-weight: bold; margin-top:-18%; margin-left:73%;"
							data-toggle="modal" data-target="#myFullsizeModal" >지도보기</button>
					</div>
				</div>

			</div>

			<div class="well well restIntro"
				style="width: 100%; padding-top: 20px; margin-bottom:5%; padding-bottom: 5px;  background-color:white; border : 2px solid #0D7B6C; color:black;">

				&nbsp;&nbsp;&nbsp;<b style="font-size:18px;">숙소소개</b> <br>
				<div style="margin-left: 20px; margin-top:1%"><p style="line-height: 210%;">${room[0].reInfo }</p></div>
			</div>
			<p style="color:gray; font-size:20px; font-weight:inherit; ;">객실정보</p>
			<c:forEach items="${room }" var="room">
				
				<div class="roomsArea" style="border:none;">
					<div class="well well-lg rooms"
						style="height: 270px; background-color:white; margin-top: 2%; border:none;">
						<div class="roomsimage" style=" background-color: white; border:none;  height: 100%; width: 30%; float: left;">
							<%-- ${room.roImage } --%>
							<c:forTokens items="${room.roImage }" delims=","
								varStatus="status" var="image">
								<c:if test="${status.index eq 0}">
									<c:if test="${image ne '없음'}">
										<img src="${image }" style="height: 100%; width: 100%;">
									</c:if>
									<c:if test="${image eq '없음'}">

										<img src="resources/images/noimage.png"
											style="height: 100%; width: 100%;">
									</c:if>
								</c:if>
								<%-- <c:if test="${status.index eq 0}"> <img src="resources/images/noimage.png" style="height:100%; width:100%;"></c:if> --%>
							</c:forTokens>
						</div>
						<a href="roomInfo.tpo?rNo=${room.rNo }" style="color:black;">
							<div class="well well-lg roomsInfo" style="width: 65%; height: 100%; float: left; margin-left: 5%; background-color: white; border:1px solid #ececec;">
								<b style="font-size:18px; "> &nbsp; &nbsp; &nbsp;${room.roName }</b>
								<div style="margin-left: 40px; margin-top: 15px;">
								<p style="line-height: 210%;">
									체크인 : ${rest.checkIn }<br> 체크아웃 : ${rest.checkout }<br>
									요금 : ${room.roPrice }(1박 기준)
								</div>

							</div>
						</a>
					</div>
				</div>
			</c:forEach>

			<!-- 지도 테스트 -->


			<!-- Trigger the modal with a button -->

			<!-- Modal -->
			<!-- modal 구동 버튼 (trigger) -->

			<!-- button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#myFullsizeModal" onclick="relayout()">Fullsize Modal</button>

			Fullsize Modal -->


			<div class="modal fade" id="myFullsizeModal" tabindex="-1"
				role="dialog" aria-labelledby="myFullsizeModalLabel">
				<div class="modal-dialog modal-fullsize modal-lg" role="document">
					<div class="modal-content modal-fullsize">
						<div class="modal-header">
						${room[0].reName } 약도
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel"></h4>
						</div>
						<div class="modal-body">
							<div id="map" style="width: 770px; height: 650px;"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>

		</div>


		<!-- <div id="map" style="width: 770px; height: 650px;"></div> -->

	

		<script>
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
			geocoder.addressSearch(	"${room[0].reAddr }",
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
														+ "${room[0].reName }"
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
		<jsp:include page="/include/includeFooter.jsp" />
</body>
</html>
