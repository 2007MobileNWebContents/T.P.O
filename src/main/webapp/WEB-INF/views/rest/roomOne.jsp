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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 이미지슬라이드 -->
<link rel="stylesheet" href="resources/css/slide.css">
<script src="resources/js/packed.js"></script>
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

			<div class="infoArea" style="height: 450px; width: 100%;">
				<div>
					<div class="sliderbutton" onclick="slideshow.move(-1)"
						style="float: left; margin-top: 5%;"><<</div>
				</div>
				<div id="slider" style="width: 92%; height: 400px;">
					<ul>
						<c:forTokens items="${room.roImage }" delims=","
							varStatus="status" var="image">
							<c:if test="${status.index eq 0}">
								<c:if test="${image ne '없음'}">
									<li>
										<img src="${image }" width="100%" height="400" /></li>
								</c:if>
								<c:if test="${image eq '없음'}">
									<li>
									<img src="resources/images/noimage.png" width="75%" height="400" /></li>
								</c:if>
							</c:if>
							<c:if test="${status.index eq 1}">
								<c:if test="${image ne '없음'}">
									<li>
										<img src="${image }" width="100%" height="400" /></li>
								</c:if>
								<c:if test="${image eq '없음'}">
									<li>
									<img src="resources/images/noimage.png" width="75%" height="400"  /></li>
								</c:if>
							</c:if>
							<c:if test="${status.index eq 2}">
								<c:if test="${image ne '없음'}">
									<li>
										<img src="${image }" width="100%" height="400" /></li>
								</c:if>
								<c:if test="${image eq '없음'}">
									<li>
									<img src="resources/images/noimage.png" width="75%" height="400" /></li>
								</c:if>
							</c:if>
							<c:if test="${status.index eq 3}">
								<c:if test="${image ne '없음'}">
									<li>
										<img src="${image }" width="100%" height="400"  /></li>
								</c:if>
								<c:if test="${image eq '없음'}">
									<li>
									<img src="resources/images/noimage.png" width="75%" height="400"  /></li>
								</c:if>
							</c:if>
							
						</c:forTokens>
					</ul>
				</div>
				<div class="sliderbutton" onclick="slideshow.move(1) "
					style="float: left; margin-top: 5%; margin-left:1%;">>></div>

				<div>
					<ul id="pagination" class="pagination" style="margin-left: 3.5%;">
						<li onclick="slideshow.pos(0)" style="background-color:white; border:white"></li>
						<li onclick="slideshow.pos(1)" style="background-color:white; border:white"></li>
						<li onclick="slideshow.pos(2)" style="background-color:white; border:white"></li>
						<li onclick="slideshow.pos(3)" style="background-color:white; border:white"></li>
					</ul>
				</div>
			</div>


		</div>


		<div class="well well-sm restIntro"
			style="background-color: white; border:2px solid #0D7B6C;  width: 100%; padding-top: 15px; padding-bottom: 15px;">
			&nbsp;&nbsp;&nbsp;<b>객실명 : </b> ${room.roName } (${room.pLimit }명 ~
			최대 ${room.pMaxCount }명)<br>

		</div>
		<div class="roomsArea">
			<div class="well well-lg roomsInfo"
				style="width: 100%; height: 100%; float: left; background-color: white; border:none;">
				<b>객실크기 : </b>${room.roSize } 평<br> <b>객실수 : </b>${room.roCount }
				실 <br> <b>기준인원 : </b> ${room.pLimit }명 (최대인원 : ${room.pMaxCount }명)<br>
				<b>객실금액 : </b> ${room.roPrice }원<br>
				<c:forTokens items="${room.roFacility }" delims=","
					varStatus="status" var="facility">
					<c:if test="${status.index eq 0  }">
						<c:if test="${facility eq 'Y'  }">
							<b>욕조 유무 :</b> 제공함<br>
						</c:if>
					</c:if>
					<c:if test="${status.index eq 1}">
						<c:if test="${facility eq 'Y'  }">
							<b>에어컨 유무 : </b>제공함<br>
						</c:if>

					</c:if>
					<c:if test="${status.index eq 2}">
						<c:if test="${facility eq 'Y'  }">
							<b>TV 유무 : </b>제공함<br>
						</c:if>
					</c:if>
					<c:if test="${status.index eq 3 }">
						<c:if test="${facility eq 'Y'  }">
							<b>인터넷 유무 : </b>제공함<br>
						</c:if>
					</c:if>
					<c:if test="${status.index eq 4}">
						<c:if test="${facility eq 'Y'  }">
							<b>냉장고 유무 : </b>제공함<br>
						</c:if>
					</c:if>
					<c:if test="${status.index eq 5 }">
						<c:if test="${facility eq 'Y'  }">
							<b>세면도구 유무 : </b>제공함<br>
						</c:if>
					</c:if>
					<c:if test="${status.index eq 6 }">
						<c:if test="${facility eq 'Y'  }">
							<b>취사용품 유무 : </b>제공함<br>
						</c:if>
					</c:if>
					<c:if test="${status.index eq 7}">
						<c:if test="${facility eq 'Y'  }">
							<b>드라이기 유무 : </b>제공함<br>
						</c:if>
					</c:if>
				</c:forTokens>


			</div>
		</div>


		<script type="text/javascript">
			var slideshow = new TINY.slider.slide('slideshow', {
				id : 'slider',
				auto : 3,
				resume : true,
				vertical : false,
				navid : 'pagination',
				activeclass : 'current',
				position : 0
			});
		</script>
	</section>
		<jsp:include page="/include/includeFooter.jsp" />
</body>
</html>
