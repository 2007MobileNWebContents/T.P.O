<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">

<!-- restPage.css -->
<link rel="stylesheet" href="resources/css/restPage.css">
</head>
<body style="background-color: #ececec">


	<div class="gtco-loader"></div>

	<div id="page"></div>


	<!-- <div class="page-inner"> -->
	<jsp:include page="/include/includeHeader.jsp" />
	<!--헤더 끝-->
	<!--section시작-->
	<section class="gtco-container sectionmain" role="contentinfo">
		<div class="section-container" style="margin-top: 950px;">
			<div class="section-main">
				<div class="main-side"
					style="width: 25%; height: 100%; float: left;">

					<div class="well well-lg search"
						style="background-color: #0D7B6C; color: white; padding-left: 6%; padding-top: 6%; width: 100%; padding-bottom: 3%;">
						<form action="searchAllList.tpo" method="get" onSubmit="return searchAllList()">
							<h3>
								<b id="rs" style="color: white;">숙소검색</b>
							</h3>
							<div class="search-list">
								<b>목적지</b> <input type="text" class="well well-sm location"
									name="location" id="location" value="${search.location }"
									style="margin-top: 5%; margin-bottom: 7%; background-color: white; width: 99%; height: 35px; color:black;">
							</div>
							<div class="search-list">
								<b>숙박기간</b> <input type="text" class="well well-sm sleep"
									name="sleep" value="${search.sleep }"
									style="width: 40px; margin-top: -50%; margin-left: 4%; margin-bottom: 7%; height: 0%; color:black; background-color: white;">
								<b>박</b> <input type="text" class="well well-sm sleep"
									style="width: 40px; margin-top: -50%; margin-left: 4%; margin-bottom: 7%; height: 0%; color:black; background-color: white;">
								<b>일</b>

							</div>
							<b>객실 및 인원</b>
							<div class="well well-sm total"
								style="width: 100%; height: 130px; background-color: white; margin-top: 7%;">
								<div class="total-amount"
									style="background-color: #09c6ab; color: white; width: 38%; height: 100%; margin-bottom: -1%; padding-top: 3%; padding-left: 6%; border-radius: 4px; float: left; line-height: 2;">
									<b>객실수</b><br> <b>성인</b><br> <b>어린이</b><br>
								</div>
								<div
									style="width: 60%; height: 100%; float: left; margin-bottom: -1%; padding-left: 6%;">
									<div id="roomCount">
										<button type="button" class="updown" id="rPlus" value=" + "
											style="width: 30px; border-style: none; background-color: #00a38d; color: white">+</button>
										<input type="text" id="rAmount" class="amount" name="rAmount"
											value="1" size="2"
											style="border-style: none; color:black; padding-left: 15px; border-style: none; padding-left: 14px; margin-left: 1px;">
										<button type="button" class="updown" id="rminus" value=" - "
											style="width: 30px; border-style: none; background-color: #00a38d; color: white">-</button>
									</div>
									<div id="adultCount" style="margin-top: 10px;">
										<button type="button" class="updown" id="aPlus" value=" + "
											style="width: 30px; border-style: none; background-color: #00a38d; color: white">+</button>
										<input type="text" id="aAmount" class="amount" name="aAmount"
											value="1" size="2"
											style="border-style: none; color:black; padding-left: 15px;">
										<button type="button" class="updown" id="aminus" value=" - "
											style="width: 30px; border-style: none; background-color: #00a38d; color: white">-</button>
									</div>
									<div id="kidAmount" style="margin-top: 10px;">
										<button type="button" class="updown" id="kPlus" value=" + "
											style="width: 30px; border-style: none; background-color: #00a38d; color: white">+</button>
										<input type="text" id="kAmount" class="amount" name="kAmount"
											value="1" size="2"
											style="border-style: none; color:black; padding-left: 15px;">
										<button type="button" class="updown" id="kminus" value=" - "
											style="width: 30px; border-style: none; background-color: #00a38d; color: white">-</button>
									</div>
								</div>
							</div>
							<div class="search-list"
								style="margin-top: 10%; margin-left: 1%; width: 100%; margin-bottom: 5%;">
								<button type="submit" class="btn btn-sm"
									style="width: 220px; background-color: #f8ca00; color: black; font-size: 18px; font-weight: bold;">검&nbsp;&nbsp;&nbsp;색</button>
							</div>
						</form>
					</div>

					<div class="well well-lg search price-search"
						style="background-color: white; border: 1px solid #09c6ab; padding-left: 10%; padding-top: 6%; margin-top: 20px; width: 100%; height: 305px;">

						<h3>
							<b id="rs">가격</b>
						</h3>
						<div class="search-list">
							<form action="rPriceSearch.tpo" method="get" onSubmit="return rPriceSearch()">
								<b>최저금액 </b><br> <input type="text"
									class="well well-sm location"
									style="margin-top: 5%; margin-bottom: 7%; background-color: white; width: 65%; height: 35px;"
									name="minPrice" value="${search.minPrice}" id="min"> 원
								부터<br> <b>최고금액 </b><br> <input type="text"
									class="well well-sm location"
									style="margin-top: 5%; margin-bottom: 7%; background-color: white; width: 65%; height: 35px;"
									name="maxPrice" value="${ search.maxPrice}" id="max"> 원
								까지
								<button type="submit" class="btn btn-primary btn-sm"
									style="width: 220px; background-color: #09c6ab">찾아보기</button>
							</form>
						</div>
					</div>
					<div class="well well-lg search name-search"
						style="background-color: white; border: 1px solid #09c6ab; padding-left: 10%; padding-top: 6%; width: 100%; float: left; height: 195px;">

						<h3>
							<b id="rs">숙소명</b>
						</h3>
						<div class="nameList">
							<form action="rNameSearch.tpo" method="get">
								<input type="text" class="well well-sm location"
									name="searchName"
									style="margin-top: 5%; background-color: white; width: 99%; height: 35px;">&nbsp;
								<button type="submit" class="btn btn-primary btn-sm"
									style="width: 100px; margin-left: 50%; margin-top: -20%;">검색</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			
		
			
			<div class="main-right" style="width: 75%; height: 100%; float: left;">
				<div class="well well-sm search sortarea"
					style="border: none; background-color: white; width: 100%; height: 60px; margin-left: 5%; float: left; padding-left: 30px; padding-top: 18px;">
					<a href="alignList.tpo?alignList=Name" value="alignName"
						style="color: black;"><b>이름 </b></a><b style="color: black;">
						| </b> <a href="alignList.tpo?alignList=Price" value="alignPrice"
						style="color: black;"><b>요금 </b></a><b style="color: black;">
						|</b> <a href="alignList.tpo?alignList=Click" value="alignClick"
						style="color: black;"><b> 최다클릭 </b></a>
				</div>
				
				<c:if test="${msg eq null}">
				<div class=" restInfo-area"
					style="width: 100%; height: 100%; margin-top: 10%;">
					<c:forEach items="${rList }" var="rest">
						<input type="hidden" value="${rest.reNo}">
						<a href="restDetail.tpo?reNo=${rest.reNo}">
							<div class="well well-lg search restInfo" 
							style="background-color: white; border: none; margin-top: 2%; margin-left: 5%; height: 260px; width: 100%; color: black;">
								<c:if test="${rest.reImage eq '없음'}">
									<div style="float: left">
										<img src="resources/images/noimage.png"
											style="width: 270px; height: 230px;" />
									</div>
									<div style="float: left; margin-left: 15px; margin-top:2%;">
									<p style="line-height : 230%;">
									 <c:forTokens items="${rest.reName }" delims="[" varStatus="status" var="name">
										<c:if test="${status.index eq 0}">									
										<b style="font-size:18px; line-height:290%;">${name}</b>
										</c:if>
										</c:forTokens><br>
										<b>전화번호 :</b> ${rest.rePhone }
										<br> <b>상세주소 :</b> <br> ${rest.reAddr } <br>
										<c:if test="${rest.sumPrice ne 0 }">
											<b>최저금액 :</b>
											${rest.sumPrice }
										</c:if>
										<c:if test="${rest.rowMin ne 0 }">
											<b >최저금액 :</b>
											${rest.rowMin }
										</c:if>
										</p>
									</div>

								</c:if>
								<c:if test="${rest.reImage ne '없음'}">
									<div style="float: left">
										<img src="${rest.reImage }"
											style="width: 270px; height: 210px;" />
									</div>
									<div style="float: left; margin-left: 15px;">
									<p style="line-height : 230%;">
									
		
										<c:url var="restDetail" value="restDetail.tpo">
											<c:param name="reName" value="${rest.reName }"></c:param>
											<c:param name="page" value="${pi.currentPage }"></c:param>
										</c:url>
										<c:forTokens items="${rest.reName }" delims="[" varStatus="status" var="name">
										
										<c:if test="${status.index eq 0}">
												<b style="font-size:18px; line-height:290%;">${name}</b>
										</c:if>
										</c:forTokens>
										<br> <b>전화번호 :</b> ${rest.rePhone } <br> <b>상세주소
											: </b> <br> ${rest.reAddr } <br>
										<c:if test="${rest.sumPrice ne 0 }">
											<b>최저금액 :</b>
											${rest.sumPrice }
										</c:if>
										<c:if test="${rest.rowMin ne 0 }">
											<b>최저금액 :</b>
											${rest.rowMin }
										</c:if>
										</p>
									</div>
								</c:if>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
	</c:if>
	<c:if test="${msg ne null }">
	<div class="well well-lg search restInfo" style="background-color: white; border: none; margin-top: 10%; margin-left: 5%; height: 260px; width: 100%; color: black">
		${msg }
	</div>
	</c:if>



			<div class="pageDiv" >

				<div class="pagination" style="margin-top: -0.5%; color: #09c6ab; margin-left:75px;">
					<c:if test="${pi.currentPage<=1 }">
						<a href="${before }"
							style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Previous</a>&nbsp;
               </c:if>
					<c:choose>
						<c:when test="${search.alignList eq 'Name' }">
							<c:if test="${pi.currentPage>1 }">
								<c:url var="before" value="alignList.tpo">
									<c:param name="alignList" value="${search.alignList}"></c:param>
									<c:param name="page" value="${pi.currentPage-1 }"></c:param>
								</c:url>
								<a href="${before }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Previous</a>
							</c:if>
						</c:when>
						<c:when test="${search.alignList eq 'Price' }">
							<c:if test="${pi.currentPage>1 }">
								<c:url var="before" value="alignList.tpo">
									<c:param name="alignList" value="${search.alignList}"></c:param>
									<c:param name="page" value="${pi.currentPage-1 }"></c:param>
								</c:url>
								<a href="${before }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Previous</a>
							</c:if>
						</c:when>
						<c:when test="${search.alignList eq 'Click' }">
							<c:if test="${pi.currentPage>1 }">
								<c:url var="before" value="alignList.tpo">
									<c:param name="alignList" value="${search.alignList}"></c:param>
									<c:param name="page" value="${pi.currentPage-1 }"></c:param>
								</c:url>
								<a href="${before }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Previous</a>
							</c:if>
						</c:when>
						<c:when test="${search.location ne null }">
							<c:if test="${pi.currentPage>1 }">
								<c:url var="before" value="searchAllList.tpo">
									<c:param name="location" value="${search.location}"></c:param>
									<c:param name="sleep" value="${search.sleep}"></c:param>
									<c:param name="rAmount" value="${search.rAmount}"></c:param>
									<c:param name="aAmount" value="${search.aAmount}"></c:param>
									<c:param name="kAmount" value="${search.kAmount}"></c:param>
									<c:param name="page" value="${pi.currentPage-1 }"></c:param>
								</c:url>
								<a href="${before }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Previous</a>
							</c:if>
						</c:when>
						<c:when test="${search.searchName ne null  }">
							<c:if test="${pi.currentPage>1 }">
								<c:url var="before" value="rNameSearch.tpo">
									<c:param name="searchName" value="${search.searchName}"></c:param>
									<c:param name="page" value="${pi.currentPage-1 }"></c:param>
								</c:url>
								<a href="${before }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Previous</a>
							</c:if>
						</c:when>
						<c:when test="${search.maxPrice ne null  }">
							<c:if test="${pi.currentPage>1 }">
								<c:url var="before" value="rPriceSearch.tpo">
									<c:param name="minPrice" value="${search.minPrice}"></c:param>
									<c:param name="maxPrice" value="${search.maxPrice}"></c:param>
									<c:param name="page" value="${pi.currentPage-1 }"></c:param>
								</c:url>
								<a href="${before }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Previous</a>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:url var="before" value="restList.tpo">
								<c:param name="page" value="${pi.currentPage-1 }"></c:param>
							</c:url>
							<c:if test="${pi.currentPage ne 1 }">
								<a href="${before }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Previous</a>
							</c:if>
						</c:otherwise>
					</c:choose>

					<!-- 페이지 -->
					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endpage }">
						<c:choose>
							<c:when test="${search.alignList eq 'Name' }">
								<c:url var="pagination" value="alignList.tpo">
									<c:param name="alignList" value="${search.alignList}"></c:param>
									<c:param name="page" value="${p }"></c:param>
								</c:url>
								<c:if test="${p eq pi.currentPage}">
									<a class="is-active"
										style="background-color: #007c6b; color: white; border: 1px solid #007c6b; border-radius: 30px;"
										href="${pagenation }">${p }</a>&nbsp; 
								</c:if>
								<c:if test="${p ne pi.currentPage}">
									<a href="${pagination }"
										style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">${p }</a>&nbsp;
						</c:if>
							</c:when>
							<c:when test="${search.alignList eq 'Price' }">
								<c:url var="pagination" value="alignList.tpo">
									<c:param name="alignList" value="${search.alignList}"></c:param>
									<c:param name="page" value="${p }"></c:param>
								</c:url>
								<c:if test="${p eq pi.currentPage}">
									<a class="is-active"
										style="background-color: #007c6b; color: white; border: 1px solid #007c6b; border-radius: 30px;"
										href="${pagenation }">${p }</a>&nbsp; 
							<%-- <font color="red" size="4">[${p }]</font> --%>
									<%-- ${p } --%>
								</c:if>
								<c:if test="${p ne pi.currentPage}">
									<a href="${pagination }"
										style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">${p }</a>&nbsp;
					</c:if>
							</c:when>
							<c:when test="${search.alignList eq 'Click' }">
								<c:url var="pagination" value="alignList.tpo">
									<c:param name="alignList" value="${search.alignList}"></c:param>
									<c:param name="page" value="${p }"></c:param>
								</c:url>
								<c:if test="${p eq pi.currentPage}">
									<a class="is-active"
										style="background-color: #007c6b; color: white; border: 1px solid #007c6b; border-radius: 30px;"
										href="${pagenation }">${p }</a>&nbsp; 
							<%-- <font color="red" size="4">[${p }]</font> --%>
									<%-- ${p } --%>
								</c:if>
								<c:if test="${p ne pi.currentPage}">
									<a href="${pagination }"
										style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">${p }</a>&nbsp;
					</c:if>
							</c:when>
							<c:when test="${search.location ne null }">
								<c:url var="pagination" value="searchAllList.tpo">
									<c:param name="location" value="${search.location}"></c:param>
									<c:param name="sleep" value="${search.sleep}"></c:param>
									<c:param name="rAmount" value="${search.rAmount}"></c:param>
									<c:param name="aAmount" value="${search.aAmount}"></c:param>
									<c:param name="kAmount" value="${search.kAmount}"></c:param>
									<c:param name="page" value="${p }"></c:param>
								</c:url>
								<c:if test="${p eq pi.currentPage}">
									<a class="is-active"
										style="background-color: #007c6b; color: white; border: 1px solid #007c6b; border-radius: 30px;"
										"
										href="${pagenation }">${p }</a>&nbsp; 
							<%-- <font color="red" size="4">[${p }]</font> --%>
									<%-- ${p } --%>
								</c:if>
								<c:if test="${p ne pi.currentPage}">
									<a href="${pagination }"
										style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">${p }</a>&nbsp;
						</c:if>
							</c:when>
							<c:when test="${search.searchName ne null }">
								<c:url var="pagination" value="rNameSearch.tpo">
									<c:param name="searchName" value="${search.searchName}"></c:param>
									<c:param name="page" value="${p }"></c:param>
								</c:url>
								<c:if test="${p eq pi.currentPage}">
									<a class="is-active"
										style="background-color: #007c6b; color: white; border: 1px solid #007c6b; border-radius: 30px;"
										"
										href="${pagenation }">${p }</a>&nbsp; 
							<%-- <font color="red" size="4">[${p }]</font> --%>
									<%-- ${p } --%>
								</c:if>
								<c:if test="${p ne pi.currentPage}">
									<a href="${pagination }"
										style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">${p }</a>&nbsp;
						</c:if>
							</c:when>
							<c:when
								test="${search.maxPrice ne null && search.minPrice ne null }">
								<c:url var="pagination" value="rPriceSearch.tpo">
									<c:param name="minPrice" value="${search.minPrice}"></c:param>
									<c:param name="maxPrice" value="${search.maxPrice}"></c:param>
									<c:param name="page" value="${p }"></c:param>
								</c:url>
								<c:if test="${p eq pi.currentPage}">
									<a class="is-active"
										style="background-color: #007c6b; color: white; border: 1px solid #007c6b; border-radius: 30px;"
										"
										href="${pagenation }">${p }</a>&nbsp; 
							<%-- <font color="red" size="4">[${p }]</font> --%>
									<%-- ${p } --%>
								</c:if>
								<c:if test="${p ne pi.currentPage}">
									<a href="${pagination }"
										style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">${p }</a>&nbsp;
						</c:if>
							</c:when>
							<c:otherwise>
								<c:url var="pagination" value="restList.tpo">
									<c:param name="page" value="${p }"></c:param>
								</c:url>
								<c:if test="${p eq pi.currentPage}">
									<a class="is-active"
										style="background-color: #007c6b; color: white; border: 1px solid #007c6b; border-radius: 30px;"
										href="${pagenation }">${p }</a>&nbsp; 
							<%-- <font color="red" size="4">[${p }]</font> --%>
									<%-- ${p } --%>
								</c:if>
								<c:if test="${p ne pi.currentPage}">
									<a href="${pagination }"
										style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">${p }</a>&nbsp;
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 		다음 -->
					
					<c:if test="${pi.currentPage>=pi.maxPage and pi.startPage != pi.maxPage }">
                     <a href="#" style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Next</a>&nbsp;
       			     </c:if>
					<c:choose>
						<c:when test="${search.alignList eq 'Name' }">
							<c:if test="${pi.currentPage<=pi.maxPage }">
								<c:url var="after" value="alignList.tpo">
									<c:param name="alignList" value="${search.alignList}"></c:param>
									<c:param name="page" value="${pi.currentPage+1 }"></c:param>
								</c:url>
								<c:if test="${pi.currentPage ne pi.maxPage }">
								<a href="${after }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Next</a>&nbsp;
								</c:if>
               </c:if>
						</c:when>
						<c:when test="${search.alignList eq 'Price' }">
							<c:if test="${pi.currentPage<=pi.maxPage }">
								<c:url var="after" value="alignList.tpo">
									<c:param name="alignList" value="${search.alignList}"></c:param>
									<c:param name="page" value="${pi.currentPage+1 }"></c:param>
								</c:url>
								<c:if test="${pi.currentPage ne pi.maxPage }">
								<a href="${after }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Next</a>&nbsp;
								</c:if>s
               </c:if>
						</c:when>
						<c:when test="${search.alignList eq 'Click' }">
							<c:if test="${pi.currentPage<=pi.maxPage }">
								<c:url var="after" value="alignList.tpo">
									<c:param name="alignList" value="${search.alignList}"></c:param>
									<c:param name="page" value="${pi.currentPage+1 }"></c:param>
								</c:url>
								<c:if test="${pi.currentPage ne pi.maxPage }">
								<a href="${after }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Next</a>&nbsp;
								</c:if>
               </c:if>
						</c:when>
						<c:when test="${search.location ne null }">
							<c:if test="${pi.currentPage<=pi.maxPage }">
								<c:url var="after" value="searchAllList.tpo">
									<c:param name="location" value="${search.location}"></c:param>
									<c:param name="sleep" value="${search.sleep}"></c:param>
									<c:param name="rAmount" value="${search.rAmount}"></c:param>
									<c:param name="aAmount" value="${search.aAmount}"></c:param>
									<c:param name="kAmount" value="${search.kAmount}"></c:param>
									<c:param name="page" value="${pi.currentPage+1 }"></c:param>
								</c:url>
								<c:if test="${pi.currentPage ne pi.maxPage }">
								<a href="${after }" style="background-color:white; border:1px solid #007c6b; border-radius: 30px;">Next</a>&nbsp;
								</c:if>
               </c:if>
						</c:when>
						<c:when test="${search.searchName ne null  }">
							<c:if test="${pi.currentPage<=pi.maxPage }">
								<c:url var="after" value="rNameSearch.tpo">
									<c:param name="searchName" value="${search.searchName}"></c:param>
									<c:param name="page" value="${pi.currentPage+1 }"></c:param>
								</c:url>
								<c:if test="${pi.currentPage ne pi.maxPage }">
								<a href="${after }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Next</a>&nbsp;
									</c:if>
               </c:if>
						</c:when>
						<c:when test="${search.maxPrice ne null }">
							<c:if test="${pi.currentPage<=pi.maxPage }">
								<c:url var="after" value="rPriceSearch.tpo">
									<c:param name="minPrice" value="${search.minPrice}"></c:param>
									<c:param name="maxPrice" value="${search.maxPrice}"></c:param>
									<c:param name="page" value="${pi.currentPage+1 }"></c:param>
								</c:url>
								<c:if test="${pi.currentPage ne pi.maxPage }">
								<a href="${after }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Next</a>&nbsp;
								</c:if>
               </c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${pi.currentPage<=pi.maxPage }">
								<c:url var="after" value="restList.tpo">
									<c:param name="page" value="${pi.currentPage+1 }"></c:param>
								</c:url>
								<c:if test="${pi.currentPage ne pi.maxPage }">
								<a href="${after }"
									style="background-color: white; border: 1px solid #007c6b; border-radius: 30px;">Next</a>&nbsp;
							</c:if>		
               			   </c:if>
						</c:otherwise>
					</c:choose>
				</div>

			</div>
		</div>

	</section>

	<!--section 끝-->
	
	<script type="text/javascript">
//객실부분
var rSum = 1;	
$("#rPlus").click(function(){
	rSum = rSum+1;
	$("#rAmount").attr('value',rSum);
});
$("#rminus").click(function(){
	rSum = rSum-1;
	$("#rAmount").attr('value',rSum);
	if(rSum <0){
		alert('다시 확인해주세요');
	$("#rAmount").attr('value',1);
	}
});	

// 성인부분
var aSum = 1;	
$("#aPlus").click(function(){
	aSum = aSum+1;
	$("#aAmount").attr('value',aSum);
});
$("#aminus").click(function(){
	aSum = aSum-1;
	$("#aAmount").attr('value',aSum);
	if(aSum <0){
		alert('다시 확인해주세요');
	$("#aAmount").attr('value',1);
	}
});			

// 어린이 부분
var kSum = 1;	
$("#kPlus").click(function(){
	kSum = kSum+1;
	$("#kAmount").attr('value',kSum);
	
});
$("#kminus").click(function(){
	kSum = kSum-1;
	$("#kAmount").attr('value',kSum);
	if(kSum <0){
		alert('다시 확인해주세요');
	$("#kAmount").attr('value',1);
	}
});	

// 숙소검색 값이 하나라도 없는 경우 막기(목적지 / 숙박기간 )
function searchAllList(){
	
	var location = $('input[name="location"]');
	var sleep = $('input[name="sleep"]');
	
	var locationValue = $('input[name="location"]').val();
	var sleepValue = $('input[name="sleep"]').val();
	if(locationValue==''){
		location.focus();
		alert("목적지를 입력해 주세요.");
		return false;
	}
	else if(sleepValue=='' || sleepValue==0){
		sleep.focus();
		alert("숙박기간을 입력해 주세요.");
		return false;
	}else{
		return true;
	}
}

function rPriceSearch(){
	var minPrice = $('input[name="minPrice"]');
	var maxPrice = $('input[name="maxPrice"]');
	
	var minPriceValue = $('input[name="minPrice"]').val();
	var maxPriceValue = $('input[name="maxPrice"]').val();
	
	if(minPriceValue==0 && maxPriceValue==0){
		minPrice.focus();
		alert("최저/최고 금액을 입력해주세요.");
		return false;
	}
	else if(minPriceValue=='' && maxPriceValue==''){
		minPrice.focus();
		alert("최저/최고 금액을 입력해주세요.");
		return false;
	}
	else if(minPriceValue>maxPriceValue){
		minPrice.focus();
		alert("최저금액이 최고금액보다 높을 수 없습니다.");
		minPrice.val(0);
		maxPrice.val(0);
		return false;
	}else{
		return true;
	}
}
</script>
	
	
	<jsp:include page="/include/includeFooter.jsp" />


</body>
</html>
