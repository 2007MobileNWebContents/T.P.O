<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/restPage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>명소 리스트</title>
<style>
/* .contents {
	display: inline-block;
}

#bottons {
	
} */
#search {
	margin-left: 10px;
	width: 20%;
}

#content {
	width: 70%;
}
.card-img-top {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s;
	-moz-transition: .3s;
	-ms-transition: .3s;
	-o-transition: .3s;
	transition: .3s;
}

.card-img-top:hover {
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.05;
	-ms-transform: scale(1.05);
	-o-transform: scale(1.05);
	transform: scale(1.05);
}

</style>
</head>
<body style="background-color:#ececec;">
	<!--  header -->

	<jsp:include page="/include/includeHeader.jsp" />

	<div id="page"></div>
	<!-- left sidebar -->
	<section class="container" style="margin-top: 50px;">
	<form action="sightChkList.tpo" method="get">
		<div id="search" class="col-md-3 " style="margin-right:15px; margin-top:65px; background-color:white; border-radius: 5px; padding-top:15px; ">
			<h3>명소검색</h3>
			<ul class="media-list">
				<li class="media">
					<div class="media-left"></div>
					<div class="media-body">
						<b>주차여부</b> <input type="checkbox" name="parking" value="1" <c:if test="${chkValue.parking ne 0 }">checked</c:if>>
					</div>
				</li>

				<li class="media">
					<div class="media-left"></div>
					<div class="media-body">
						<b>유모차 여부</b> <input type="checkbox" name="baby" value="1" <c:if test="${chkValue.babyCar ne 0 }">checked</c:if>>
					</div>
				</li>

				<li class="media">
					<div class="media-left"></div>
					<div class="media-body">
						<b>애완동물 가능 여부</b> <input type="checkbox" name="pet" value="1" <c:if test="${chkValue.pet ne 0 }">checked</c:if>>
					</div>
				</li>
				<li>
					<br>
				<h3>
				지역명
						</h3>
						<div class="nameList">
								<input type="text" class="well well-sm location" name="sLocation" id="location" value="${chkValue.sLocation }"
									style="margin-top: 5%; background-color: white; width: 99%; height: 35px;">&nbsp;
								<button type="submit" class="btn btn-primary"
									style="background:#1AAB8A; color:#fff; border:none;  margin-left:85px;">검색</button>
						</div>
			
				</li>
			</ul>
		</div>



		<!-- Content -->
		<h2 id="contentTitle">&nbsp;&nbsp;&nbsp;<b>명소 리스트</b></h2>
		<div class="container">
			<if test="${fn:length(sList) > 0}">
			<div class="row sight">
				<c:forEach items="${sList }" var="sightList" varStatus="index">
					<div class="col-4" style="margin-top: 20px;">
						<div class="card">
							<c:if test="${sightList.sPicture != null }">
								<img src="${sightList.sPicture }" alt="" class="card-img-top"
									width="265.66" height="176.84" />
							</c:if>
							<c:if test="${sightList.sPicture == null }">
								<img src="/resources/images/noimage.png" alt=""
									class="card-img-top" width="265.66" height="176.84" />
							</c:if>
							<div class="card-body">
								<h5 class="card-title">${sightList.sName}</h5>
								<a href="selectSight.tpo?sno=${sightList.sNo }"  class="btn btn-primary">More</a>
							</div>
						</div>
					</div>
				</c:forEach>
				<c:if test="${fn:length(sList) == 0}">
				<span style="margin-left:20px;">제공하지 않는 데이터 입니다.</span>
			</c:if>
			</div>
			<!-- 페이징 처리 -->
			<div class="pageDiv" style="margin-bottom:100px; margin-left:180px; margin-top:50px;">

				<div class="pagination" style="margin-top: -0.5%; color: #09c6ab;">
				<c:if test="${pi.currentPage<=1 }">
				<a href="${before }"style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Previous</a>&nbsp;
				               </c:if>
				<c:url var="before" value="sightChkList.tpo">
					<c:param name="page" value="${pi.currentPage-1 }"></c:param>
					<c:param name="page" value="${pi.currentPage+1 }"></c:param>
					<c:param name="parking" value="${chkValue.parking }"></c:param>
					<c:param name="baby" value="${chkValue.babyCar }"></c:param>
					<c:param name="pet" value="${chkValue.pet }"></c:param>
					<c:param name="sLocation" value="${chkValue.sLocation }"></c:param>
				</c:url>
				<c:if test="${pi.currentPage ne 1 }">
				<a href="${before }"style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Previous</a>
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<%-- <c:url var="pagination" value="restList.tpo">
				c:param name="page" value="${p }"></c:param>
				<c:url> --%>
				<c:url var="pagination" value="sightChkList.tpo">
						<c:param name="page" value="${p }"></c:param>
						<c:param name="parking" value="${chkValue.parking }"></c:param>
						<c:param name="baby" value="${chkValue.babyCar }"></c:param>
						<c:param name="pet" value="${chkValue.pet }"></c:param>
						<c:param name="sLocation" value="${chkValue.sLocation }"></c:param>
				</c:url>
				<c:if test="${p eq pi.currentPage}">
				<a class="is-active" style="background-color: #007c6b; color: white; border: 1px solid #007c6b; border-radius: 30px;" href="${pagination }">${p }</a>&nbsp; 
				</c:if>
				<c:if test="${p ne pi.currentPage}">
				<a href="${pagination }" style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">${p }</a>&nbsp;
				</c:if>
				</c:forEach>
				
				<!--       다음 -->
				
				<c:if test="${pi.currentPage>=pi.maxPage }">
				 <a href="#" style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Next</a>&nbsp;
				 </c:if>
				<c:if test="${pi.currentPage<pi.maxPage }">
				<c:url var="after" value="sightChkList.tpo">
				    <c:param name="page" value="${pi.currentPage+1 }"></c:param>
					<c:param name="parking" value="${chkValue.parking }"></c:param>
					<c:param name="baby" value="${chkValue.babyCar }"></c:param>
					<c:param name="pet" value="${chkValue.pet }"></c:param>
					<c:param name="sLocation" value="${chkValue.sLocation }"></c:param>
				</c:url>
				<a href="${after }"style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Next</a>&nbsp;
				</c:if>
				</div>
				</div>
			</if>
		</div>
		</form>
	</section>
	<!-- footer -->
	<jsp:include page="/include/includeFooter.jsp" />
	
</body>
</html>