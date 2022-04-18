<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공예약정보</title>
<style type="text/css">
 #reservation tr{
	text-align:center;
}
#reservation td{
	text-align:center;
}
#reservation th{
	text-align:center;
	color:gray;
	background:#F0F0F0;
}
.cancelBtn{
	background: #555555;
	border-radius: 4px;
	border: 1px solid #555555;
	color: white;
}
</style>
</head>
<body>
	<div id="reservationPage" >
	<h2 style="text-decoration:underline; margin-left:420px;">Reservation Info</h2>
	<p style="margin-left:850px;">HOME > 마이페이지 > <b>항공예약정보</b></p>
	<br>
	<table id="reservation" class="table table-hover" cellspacing="5" style="background:white;width:78%;">
 		<tr>
 			<th style="width:50px;">순번</th>
			<th style="width:103px;">예매일자</th>
			<th style="width:50px;">구분</th>
			<th style="width:160px;">항공편명</th>
 			<th style="width:75px;;">출발지</th>
 			<th style="width:75px;">도착지</th>
 			<th style="width:103px;">출발 시간</th>
 			<th style="width:103px;">도착 시간</th>
 			<th style="width:50px;">인원</th>
 			<th style="width:75px;">좌석</th>
 			<th style="width:103px;">요금</th>
 			<th style="width:103px;">취소요청</th>
 		</tr>
 		<c:if test="${!empty rList }">
		<c:forEach var="reservationList" items="${rList }" varStatus="status">
		<c:if test="${!empty reservationList.riNo }">
 		<tr>
 		<!-- 다음번 째 예매등록번호를 담아놓음 -->
 			<c:set var="NextNo" value="${rList[status.index+1].enNo }"/>
 			<c:set var="prevNo" value="${rList[status.index-1].enNo }"/>
 			<td>${status.index+1 }</td>
 			<td>${reservationList.rDate }</td>
 			<c:if test="${reservationList.enNo eq NextNo || reservationList.enNo eq prevNo}">
 			<td>왕복</td>
 			</c:if>
 			 <c:if test="${reservationList.enNo ne NextNo  && reservationList.enNo ne prevNo}">
 			<td>편도</td>
 			</c:if>
 			<td>${reservationList.riVihicleId }</td>
 			<td>${reservationList.riDepartureArea }</td>
 			<td>${reservationList.riArrivalArea }</td>
 			<td>${reservationList.riDepartureDate }</td>
 			<td>${reservationList.riArrivalDate }</td>
 			<td>${reservationList.rPeople }</td>
 			<td>${reservationList.riSeatGrade }</td>
 			<td><fmt:formatNumber value="${reservationList.riFare }" pattern="#,###" /></td>
 			<td><button class="cancelBtn" onclick="location.href='reservationCancel.tpo?riNo=${reservationList.riNo}'">취소</button></td>
 		</tr>
 		</c:if>
 		</c:forEach>
 		</c:if>
	</table>
	</div>
	
	<script>
		function fnCancel(){
		}
	</script>
</body>
</html>