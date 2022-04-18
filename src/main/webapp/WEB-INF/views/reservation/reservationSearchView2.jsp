<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TPO_항공권 검색</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
	#selectGoSchedule br {
     	display: none;
	}
</style>
</head>
<body style="background-color: #ececec;">
	<jsp:include page="/include/includeHeader.jsp"/>
	<div id="page"></div>
	<%-- <c:forEach items="${fList }" var="fly">
		${fly.vihicleId }
		${fly.airlineNm }
		<c:set var="time" value="${fly.depPlandTime }"/>
			${fn:substring(time,8,10) }: ${fn:substring(time,10,12) }
		<c:set var="time2" value="${fly.arrPlandTime }"/>
			${fn:substring(time2,8,10) }: ${fn:substring(time2,10,12) }
      	${fly.depAirportNm }
      	${fly.arrAirportNm }
      	${fly.economyCharge }
      	${fly.prestigeCharge }
      	<br>
	</c:forEach> --%>
	<!-- 컨텐츠 시작 -->
	<section class="gtco-container" style="margin-top: 50px;">
	<c:set var="depDay" value="${fList[0].depPlandTime }"/>
	<c:set var="arrDay" value="${fList[0].arrPlandTime }"/>
		<article>
            <div style="width: 50%; float: left;">
                <div style="font-size: 25px; font-weight: 500">
                    <img src="../resources/images/plane2.png" style="width: 50px;">
                    가는편 [${fList[0].depAirportNm } -> ${fList[0].arrAirportNm }]
                </div>
                <div>
                    <div style="float: left;">
                        ${fn:substring(depDay,4,6) }월 ${fn:substring(depDay,6,8) }일
                    </div>
                    <div style="text-align: right; margin-right: 20px;">
                         <select id="dAirport">
                            <option value="dAllAirLine">항공사</option>
                            <option value="대한항공">대한항공</option>
                            <option value="아시아나항공">아시아나</option>
                            <option value="제주항공">제주항공</option>
                            <option value="진에어">진에어</option>
                            <option value="이스타항공">이스타항공</option>
                            <option value="티웨이항공">티웨이항공</option>
                            <option value="에어부산">에어부산</option>
                            <option value="에어서울">에어서울</option>
                            <option value="플라이강원">플라이강원</option>
                            <option value="하이에어">하이에어</option>
                        </select>
                        <select id="dTime">
                            <option value="dAllTime">시간대</option>
                            <option value="06">06시</option>
                            <option value="07">07시</option>
                            <option value="08">08시</option>
                            <option value="09">09시</option>
                            <option value="10">10시</option>
                            <option value="11">11시</option>
                            <option value="12">12시</option>
                            <option value="13">13시</option>
                            <option value="14">14시</option>
                            <option value="15">15시</option>
                            <option value="16">16시</option>
                            <option value="17">17시</option>
                            <option value="18">18시</option>
                            <option value="19">19시</option>
                            <option value="20">20시</option>
                            <option value="21">21시</option>
                            <option value="22">22시</option>
                            <option value="23">23시</option>
                        </select>
                    </div>
                </div>
			<script type="text/javascript">
				$("#dAirport").on("change",function(){
	            	var airNm = $("#dAirport").val();
	               	var time = $("#dTime").val();
	               	if (airNm == "dAllAirLine" && time == "dAllTime") {
	               		$(".dAir.dTime").show();
	               	} else if (airNm == "dAllAirLine" && time != "dAllTime"){
	               		$(".dAir.dTime").hide();
	               		$(".dAir.d"+time).show();
	               	} else if (airNm != "dAllAirLine" && time == "dAllTime"){
	               		$(".dAir.dTime").hide();
	               		$(".d"+airNm+".dTime").show();
	               	} else if (airNm != "dAllAirLine" && time != "dAllTime") {
	               		$(".dAir.dTime").hide();
	               		$(".d"+airNm+".d"+time).show();
	               	}
	            });
	            
	            $("#dTime").on("change",function() {
	            	var airNm = $("#dAirport").val();
	               	var time = $("#dTime").val();
	               	if (time == "dAllTime" && airNm == "dAllAirLine") {
	               		$(".dAir.dTime").show();
	               	} else if (time == "dAllTime" && airNm != "dAllAirLine"){
	               		$(".dAir.dTime").hide();
	               		$(".d"+airNm+".dTime").show();
	               	} else if (time != "dAllTime" && airNm == "dAllAirLine"){
	               		$(".dAir.dTime").hide();
	               		$(".dAir.d"+time).show();
	               	} else if (time != "dAllTime" && airNm != "dAllAirLine"){
	               		$(".dAir.dTime").hide();
	               		$(".d"+airNm+".d"+time).show();
	               	}
	            });
           	</script>
           
	            <div>
	                <table class="table table-hover">
	                    <thead>
	                        <tr style="display:table; width:100%;">
	                            <th style="width: 125px; text-align: center;">항공/편명</th>
	                            <th style="width: 157px; text-align: center;">운항시간</th>
	                            <th style="width: 94px; text-align: center;">좌석</th>
	                            <th style="width: 79px; text-align: center;">가격</th>
	                            <th colspan="2" style="width: 60px; padding-left: -20px;">잔여석</th>
	                        </tr>
	                    </thead>
	                    <tbody style="display:block; height:480px; overflow:auto; background-color: #ffffff;" align="center" id="goTbody">
	                       	<c:forEach items="${fList }" var="flight">
	                       	<c:set var="time" value="${flight.depPlandTime }"/>
	                  		<c:set var="time2" value="${flight.arrPlandTime }"/>
                        	<c:if test="${flight.airlineNm ne null }">
                        	<tr style="display:table; width:100%;" class="d${flight.airlineNm } dAir d${fn:substring(time,8,10) } dTime">
	                            <td style="width: 120px;">${flight.airlineNm }<br>&nbsp;${flight.vihicleId }</td>
	                            <td style="line-height: 2.5; width: 150px;">${fn:substring(time,8,10) } : ${fn:substring(time,10,12) } ~ ${fn:substring(time2,8,10) } : ${fn:substring(time2,10,12) }</td>
			                    <c:if test="${flight.prestigeCharge eq 0 || flight.prestigeCharge eq null}">
			                        <td style="line-height: 2.5; width: 90px;">일반석</td>
			                        <td style="line-height: 2.5; width: 75px;">${flight.economyCharge }</td>
			                    </c:if>
			                    <c:if test="${flight.prestigeCharge ne null && flight.prestigeCharge ne 0}">
			                        <td style="line-height: 2.5; width: 90px;">비즈니스</td>
			                    	<td style="line-height: 2.5; width: 75px;">${flight.prestigeCharge }</td>
			                    </c:if>
	                            <td style="line-height: 2.5; width: 20px;">9</td>
	                            <td style="width: 30px;" id="departure"><input style="margin-top: 13px;" type="radio" name="DepSelect" id="departure"></td>
	                        </tr>
                        	</c:if>
                        	</c:forEach>
                    	</tbody>
	                </table>
	            </div>
	        </div>
            <div style="float: left; width: 535px; height:600px; text-align: center; border: 1px solid #09c6ab; background-color: #ffffff;">
               	<b style="font-size: 20px; font-weight: 1000;">
               	<br><br><br><br><br><br><br><br>
               	편도를 선택하셔서 검색되는 항공권이 없습니다.</b><br>
				선택 조건 변경 하신 후 재검색 부탁드립니다.
            </div>
        </article>
	
		<table align="center" class="table table-bordered" style="height: 100px; font-size: 20px;">
			<caption><b>선택한 항공 스케줄</b></caption>
       		<thead style="background-color: #09c6ab; color: white; text-align: center;">
				<tr style="text-align: center;">
					<th style="text-align: center;">여정</th>
                   	<th style="text-align: center;">항공편</th>
                   	<th style="text-align: center;">출발시간</th>
                   	<th style="text-align: center;">도착시간</th>
                   	<th style="text-align: center;">좌석등급</th>
                   	<th style="text-align: center;">금액(1인)</th>
                   	<th style="text-align: center;">요청좌석</th>
               	</tr>
           	</thead>
            <tbody style="text-align: center;">
				<tr id="selectGoSchedule" style="background-color: #ffffff;">
					<td style="line-height: 2">${fList[0].depAirportNm } -> ${fList[0].arrAirportNm }</td>
                    <td style="line-height: 2" id="depAlNm"></td>
                    <td style="line-height: 2" id="depPTime"></td>
                    <td style="line-height: 2" id="arrPTime"></td>
                    <td style="line-height: 2" id="sGrade"></td>
                    <td style="line-height: 2" id="oneFare"></td>
                    <td style="line-height: 2">${acCount }석</td>    
                </tr>
                <tr id="selectNoneGo">
                	<td style="line-height: 2; background-color: #ffffff;" colspan="7">가는편을 선택해주세요.</td>
                </tr>
            </tbody>
		</table>
        <script>
        	$(document).ready(function() {
        		/* 가는편 테이블 */
        		for (var i = 0; i < 7; i++) {
	               	$("#selectGoSchedule td:eq("+i+")").hide();
        		}
        		$("#selectNoneGo td").show();
               	$("#goTbody>tr").click(function(e) {
                   	console.log($(e))
                   	var depMonth = ${fn:substring(depDay,4,6) };
                   	var depDay = ${fn:substring(depDay,6,8) };
                   	var tdArr = new Array();
                   
                   	var tr = $(this);
                   	var td = tr.children();
                   	var fsRadio = td.eq(5).children().val();
                   
                   	$(this).find("input[name='DepSelect']:radio").prop('checked', true);
                   
                   	$("input:checked[id=departure]").each(function() {
                      	if (fsRadio != $(this).val()) {
                         	$(this).attr("checked", false);
                      	}
                   	});

                   	td.each(function(index, item) {
                   		for (var i = 0; i < 7; i++) {
        	               	$("#selectGoSchedule td:eq("+i+")").show();
                		}
                   		$("#selectNoneGo td").hide();
	                   	tdArr.push(td.eq(index, item).text());
	                   	var sIndex = index + 1;
	                   	if (sIndex == 2) {
	                      	console.log(item.innerHTML);
	                      	var timeValue = item.innerHTML;
	                      	console.log(timeValue.trim());
	                    	var depHour = timeValue.trim().substr(0,2)+":"+timeValue.trim().substr(5,2);
	                      	var arrHour = timeValue.trim().substr(10,2)+":"+timeValue.trim().substr(15,2);
	                      	$("#selectGoSchedule td:eq"+"("+(sIndex)+")").html(depMonth+"."+depDay+" "+depHour);
	                      	$("#selectGoSchedule td:eq"+"("+(sIndex+1)+")").html(depMonth+"."+depDay+" "+arrHour);
	                   	} else if( sIndex == 1){
	                      	$("#selectGoSchedule td:eq"+"("+(sIndex)+")").html(item.innerHTML);
	                   	} else if( sIndex == 3) {
	                      	$("#selectGoSchedule td:eq"+"("+(sIndex+1)+")").html(item.innerHTML);
	                   	} else if( sIndex == 4) {
	                      	$("#selectGoSchedule td:eq"+"("+(sIndex+1)+")").html(item.innerHTML);
	                   	}
                	});
	               	$("#depAirlineNm").val($("#depAlNm").text());
	               	$("#depTime").val($("#depPTime").text());
	               	$("#arrTime").val($("#arrPTime").text());
	               	$("#seatGrade").val($("#sGrade").text());
	               	$("#fare").val($("#oneFare").text());
                });
            });
        </script>
        <article>
            · 상기 요금은 항공운임/발권대행수수료 등 총액이 포함된 금액이며, 발권일/환률 등에 따라 유류할증료와 제세공과금은 변동될 수 있습니다.<br>
            · <span style="color: red;">발권대행수수수료는 인원별 1,000원씩 부과되며 인터파크로 별도 승인, 결제 완료 후 항공권 취소 시 환불되지 않습니다. (편도-성인/소아기준)</span><br>
            · 유류할증료(편도기준/성인,소아 동일) : 0원 | 제세공과금(편도기준) : 성인 4,000원 / 소아 2,000원<br>
            · 소아/유아는 단독 탑승이 불가하며, 탑승 수속 시 생년월일을 확인할 수 있는 증빙 서류(의료보험증/등본/여권 등)를 반드시 지참하시기 바랍니다.
        </article>
        <br><br>
        <article>
            <fieldset>
                <legend>※ 항공 예약 시 유의사항</legend>
                · <b style="color: red;">즉시 결제하지 않으면 예약이 자동취소 됩니다. (예약과 동시구매)</b><br>
                · <b style="color: red;">전 항공사가 결제는 신용카드, 체크카드만 가능합니다. (현금결제 불가)</b><br>
                · <span style="color: red;">결제하지 않은 예약 건은 마이페이지에 미노출됩니다.</span><br>
                · <span style="color: red;">예약 후 일정/인원/항공시간/항공사/이름 변경이 불가하며 취소 후 재 예약 하셔야 합니다.</span><br>
                · <span style="color: red;">대한항공, 아시아나항공인 경우 결제 후 카드 승인이 되어도 정상 예약이 되지 않는 경우가 있으니 반드시 마이페이지에서 예약 건을 확인해주세요.</span><br>
                · 항공좌석과 할인석 요금은 실시간 변동입니다.<br>
                · 예약은 성인과 유아를 포함하여 최대 9명까지 가능하며, 10명이상 예약 시 인원을 나누어 예약 진행하셔야 합니다.<br>
                · 개인신분할인 중 동반보호자 및 유가족 할인은 1인만 할인 가능합니다.<br><br>
                
                · 아시아나항공 김포/부산, 부산/제주, 대구/제주, 김포/울산, 울산/제주 구간의 일부 편은 에어부산 항공사와 공동운항됩니다.<br>
                &nbsp;&nbsp;(에어부산 공동운항편의 경우 탑승 수속 시 에어부산 항공 카운터를 이용하시기 바랍니다.)<br>
                · 공동 운항편의 경우 실제 운항사와 운임이 상이할 수 있습니다. 상이한 운임에 대해선 차액환불이 불가합니다.<br>
                · 항공권 예매 후 항공사 사정 및 천재지변으로 인하여 시간 변경 또는 결항될 수 있습니다.<br>
                &nbsp;&nbsp;필히 출발 전 마이페이지에서 항공 시간 재확인 바랍니다.<br>
                · 항공권은 타인양도 및 명의 변경이 불가하오니 반드시 실제 탑승하시는 고객의 성함을 정확하게 기입하시기 바랍니다.<br>
                &nbsp;&nbsp;사진이 부착된 신분증과 상이한 정보로 예약한 경우 탑승이 거절될 수 있으며, 결제 후 변경 시에는 취소 환불 후 재예약 하셔야 합니다.<br>
                &nbsp;&nbsp;단, 수수료가 발생할 수 있으며, 원하는 항공권 및 좌석이 없을 수 있습니다.<br>
                · 이름 입력 시 공백 또는 특수문자는 입력이 불가합니다.<br>
                · 동명이인의 경우 인터넷으로 동시 예약이 불가능하오니, 각 탑승자 별로 예약을 진행해 주시기 바랍니다.<br>
                &nbsp;&nbsp;동시예약을 하고자하시는 분은 각 항공사를 통해 예약바랍니다.
            </fieldset>
        </article>
        <br><br>
        <article>
            <form action="passengerFormOne.tpo" method="get">
	        	<div id="dep">
			        <input type="hidden" id="depJourney" name="depJourney" value="${fList[0].depAirportNm } -> ${fList[0].arrAirportNm }">
			        <input type="hidden" id="depAirlineNm" name="depAirlineNm" value="">
			        <input type="hidden" id="depTime" name="depTime" value="">
			        <input type="hidden" id="arrTime" name="arrTime" value="">
			        <input type="hidden" id="seatGrade" name="seatGrade" value="">
			        <input type="hidden" id="fare" name="fare" value="">
			        <input type="hidden" id="people" name="people" value="${acCount }">
		        </div>
		        <input type="hidden" name="tCount" value="${tCount}">
		        <input type="hidden" name="adultCount" value="${adultCount}">
		        <input type="hidden" name="childCount" value="${childCount}">
		        <input type="hidden" name="infantCount" value="${infantCount}">
		        
	            <div style="width: 35%; margin: auto;">
	                <button type="button" onclick="location.href='reservation.tpo'" class="btn btn-secondary" style="font-size: 18px; height: 60px; background-color: #f8ca00; color: #000000;">
	                    <b>항공권 다시 선택</b>
	                </button>
	                <input type="submit" value="다음 단계" id="btn" style="font-size: 18px; font-weight: bold; background-color: #09c6ab; height: 60px; border-radius: 5px; border: 1px solid #09c6ab; color: white; width: 150px;">
	            </div>
	            <script>
	            	/* 다음 단계 버튼 클릭시 항공권 선택 여부 확인 */
	            	$(document).ready(function() {
	            		$("#btn").click(function() {
	            			var checkGoSchedule = $("#depAlNm").html();
	            			console.log(checkGoSchedule);
	            			if(checkGoSchedule == "") {
	            				alert("항공권을 선택해주세요.");
	            				return false;
	            			}
	            		})
	            	});
	            </script>
            </form>
        </article>
    </section>
    <!-- 컨텐츠 끝 -->
    <jsp:include page="/include/includeFooter.jsp"/>
</body>
</html>