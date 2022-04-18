<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TPO_탑승자 정보 입력</title>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body style="background-color: #ececec;">
   <jsp:include page="/include/includeHeader.jsp" />
   <div id="page"></div>
   
   <!-- 컨텐츠 시작 -->
    <section class="gtco-container" style="margin-top: 50px;">
        <form action="multipleInsertRound.tpo" method="post" class="was-validated">
        <article>
            <h2>예약 정보 입력</h2>
            <div style="margin: auto; text-align: center;">
                <table align="center" class="table table-bordered" style="height: 150px; font-size: 20px;">
                    <thead style="background-color: #09c6ab; color: white; text-align: center;">
                        <tr style="text-align: center;">
                            <th style="text-align: center;">여정</th>
                            <th style="text-align: center;">항공편</th>
                            <th style="text-align: center;">출발시간</th>
                            <th style="text-align: center;">도착시간</th>
                            <th style="text-align: center;">좌석등급</th>
                            <th style="text-align: center;">금액</th>
                            <th style="text-align: center;">요청좌석</th>
                        </tr>
                    </thead>
                    <tbody style="text-align: center; background-color: #ffffff">
                        <tr>
                            <td style="line-height: 2">${depJourney }</td>
                            <td style="line-height: 2">${depAirlineNm }</td>
                            <td style="line-height: 2">${depTime }</td>
                            <td style="line-height: 2">${arrTime }</td>
                            <td style="line-height: 2">${seatGrade }</td>
                            <td style="line-height: 2">${fare }</td>
                            <td style="line-height: 2">${people }석</td>
                        </tr>
                        <tr>
                            <td style="line-height: 2">${depJourney2 }</td>
                            <td style="line-height: 2">${depAirlineNm2 }</td>
                            <td style="line-height: 2">${depTime2 }</td>
                            <td style="line-height: 2">${arrTime2 }</td>
                            <td style="line-height: 2">${seatGrade2 }</td>
                            <td style="line-height: 2">${fare2 }</td>
                            <td style="line-height: 2">${people2 }석</td>
                        </tr>
                    </tbody>
                </table>
                <p style="text-align: left;">
                    · 상기 요금은 항공운임/발권대행수수료 등 총액이 포함된 금액이며, 발권일 등에 따라 유류할증료와 제세공과금은 변동될 수 있습니다.<br>
                    · <span style="color: red;">발권대행수수수료는 인원별 1,000원씩 부가되며 인터파크로 별도 승인, 결제 완료 후 항공권 취소 시 환불되지 않습니다.(편도-성인/소아기준)</span><br>
                    · 유류항증료(편도기준/성인,소아 동일) : 0원|제세공과금(편도기준) : 성인 4,000원 / 소아 2,000원<br>
                    · 소아/유아는 단독 탑승이 불가하며, 탑승 수속 시 생년월일을 확인할 수 있는 증빙 서류(의료보험증/등존/여권 등)를 반드시 지잠하시기 바랍니다.
                </p>
            </div>
        </article>
        <script>
           $(document).ready(function(){
              var depArea = "${depJourney }";
              $("#depArea").val(depArea.substr(0,2));
              $("#arrArea").val(depArea.substr(5,7));
              var depArea2 = "${depJourney2 }";
              $("#depArea2").val(depArea2.substr(0,2));
              $("#arrArea2").val(depArea2.substr(5,7));
           });
        </script>
        <br>
        <article>
            <h3>대표 탑승자 정보 입력<span style="color: red;">[필수입력]</span></h3>
            <table class="table table-bordered">
                <tr>
                    <td style="background-color: #09c6ab; color: white; font-size: 20; line-height: 2.3; text-align: center; padding:14px 8px 2px 8px; width: 210px;">
                        <b style="color: red;">*</b>&nbsp;<b>이름</b>
                    </td>
                    <td style="background-color: #ffffff;">
                        <input id="passengerName" name="pName" class="form-control form-control-sm" style="width: 200px; background-color: #ffffff;" type="text" placeholder="이름을 입력해주세요" >
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #09c6ab; color: white; font-size: 20; line-height: 2.3; text-align: center; padding:13px 8px 3px 8px; width: 210px;">
                        <b style="color: red;">*</b>&nbsp;<b>성별</b>
                    </td>
                    <td style="background-color: #ffffff;">
                        <select id="pGender" name="pGender" class="form-control form-control-sm" style="width: 150px; background-color: #ffffff;" required>
                            <option value="">== 성별 ==</option>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #09c6ab; color: white; font-size: 20; line-height: 2.3; text-align: center; padding:14px 8px 2px 8px; width: 210px;">
                        <b style="color: red;">*</b>&nbsp;<b>국적</b>
                    </td>
                    <td class="mb-3" style="background-color: #ffffff;">
                        <select id="nationality" name="pNationality" class="form-control form-control-sm" style="width: 150px; background-color: #ffffff;" required>
                            <option value="">== 국적 ==</option>
                            <option value="korea">한국</option>
                            <option value="china">중국</option>
                            <option value="japan">일본</option>
                            <option value="russia">러시아</option>
                            <option value="usa">미국</option>
                            <option value="canada">캐나다</option>
                            <option value="australia">호주</option>
                            <option value="england">영국</option>
                            <option value="france">프랑스</option>
                            <option value="etc">기타</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #09c6ab; color: white; font-size: 20; line-height: 2.3; text-align: center; padding:14px 8px 2px 8px; width: 210px;">
                        <b style="color: red;">*</b>&nbsp;<b>생년월일</b>
                    </td>
                    <td style="background-color: #ffffff;">
                        <input id="pBirthDay" name="pBirthday" class="form-control form-control-sm" style="width: 350px; background-color: #ffffff;" type="text" placeholder="ex)20000101" >
                    </td>
                </tr>
                <tr >
                    <td style="background-color: #09c6ab; color: white; font-size: 20; line-height: 2.3; text-align: center; padding:14px 8px 2px 8px; width: 210px;">
                        <b style="color: red;">*</b>&nbsp;<b>이메일</b>
                    </td>
                    <td style="background-color: #ffffff;">
                        <input id="pEmail" name="pEmail" class="form-control form-control-sm" style="width: 350px; background-color: #ffffff;" type="email" placeholder="이메일을 입력해주세요"  >
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #09c6ab; color: white; font-size: 20; line-height: 2.3; text-align: center; padding:14px 8px 2px 8px; width: 210px;">
                        <b style="color: red;">*</b>&nbsp;<b>전화번호</b>
                    </td>
                    <td style="background-color: #ffffff;">
                        <input id="pPhone" name="pPhone" class="form-control form-control-sm" style="width: 350px; background-color: #ffffff;" type="text" placeholder="ex)01012345678" >
                    </td>
                </tr>
            </table>
        </article>
        <br>
        <article>
            <fieldset>
                <legend>
                    ※ 탑승자 정보 입력 시 유의사항
                </legend>
                <p>
                    · 일부 할인운임의 경우 소아할인 이중적용이 불가할 수 있습니다.<br>
                    · 개인신분할인은 할인석과 이중 할인이 적용되지 않으며, 오류 적용 시 발생되는 차액금은 고객님이 부담하셔야 합니다.<br>
                    · 탑승자명이 오류 시 수정 절대불가!! 취소 후 재예약 해야 합니다.<br>
                    · 탑승자명은 사진이 부착된 신분증상의 이름과 동일해야 하며 상이할 경우 탑승이 거절 됩니다.<br>
                    · 유아는 보호자 1인당 1명만 예약이 기능 합니다.<br>
                    · 임산부 손님의 경우 각 항공사로 사전에 탑승 기준을 반드시 확인하시기 바랍니다.<br>
                    · 반려동물을 동반하시는 경우 해당 항공사 예약센터로 사전에 동반 가능여부를 확인하시기 바랍니다.
                </p>
            </fieldset>
        </article>
        <jsp:include page="/include/accordion.jsp"/>
        <br>
        <article>
            <div style="margin-left: 700px;">
                <table class="table table-bordered">
                    <colgroup>
                        <col width="80px;">
                        <col width="80px;">
                    </colgroup>
                    <tr id="totalCharge">
                        <th style="height: 50px; font-size: 20px; line-height: 2.5; text-align: center; background-color: #09c6ab; color: white;"><b>총 합계 금액 (원)</b></th>
                        <td style="font-size: 20px; line-height: 2.5; text-align: center; background-color: #ffffff;"></td>
                    </tr>
                </table>
            </div>
            <script>
            $(document).ready(function() {
            	var fare=${fare};
            	console.log(fare);
            	var acCount=${people};
            	console.log(acCount);
            	var fare2=${fare2};
            	console.log(fare2);
            	$("#totalCharge td").html((fare+fare2)*acCount);
            });
            </script>
        </article>
        <br>
        <input type="hidden" name="rPeople" value="${tCount }">
       <input type="hidden" name="userId" value="${loginUser.userId }">
       
       <input type="hidden" name="riVihicleId" value="${depAirlineNm }">
       <input type="hidden" name="riVihicleId2" value="${depAirlineNm2 }">
       <input type="hidden" id="depArea" name="riDepartureArea" value="">
       <input type="hidden" id="depArea2" name="riDepartureArea2" value="">
       <input type="hidden" id="arrArea" name="riArrivalArea" value="">
       <input type="hidden" id="arrArea2" name="riArrivalArea2" value="">
       <input type="hidden" name="riDepartureDate" value="${depTime }">
       <input type="hidden" name="riDepartureDate2" value="${depTime2 }">
       <input type="hidden" name="riArrivalDate" value="${arrTime }">
       <input type="hidden" name="riArrivalDate2" value="${arrTime2 }">
       <input type="hidden" name="riFare" value="${fare }">
       <input type="hidden" name="riFare2" value="${fare2 }">
       <input type="hidden" name="riSeatGrade" value="${seatGrade }">
       <input type="hidden" name="riSeatGrade2" value="${seatGrade2 }">
       
       <input type="hidden" name="tCount" value="${tCount }">
       <input type="hidden" name="acCount" value="${people }">
       <input type="hidden" name="adultCount" value="${adultCount }">
       <input type="hidden" name="childCount" value="${childCount }">
       <input type="hidden" name="infantCount" value="${infantCount }">
    </form>
        <article>
            <div style="width: 35%; margin: auto;">
                <button onclick="location.href='reservation.tpo'" class="btn btn-secondary" style="font-size: 18px; height: 60px; background-color: #f8ca00; color: #000000">
                    <b>항공권 다시 선택</b>
                </button>
             <button type="button" id="check_module" onclick="checkModule();" style="font-size: 18px; background-color: #09c6ab; height: 60px; border-radius: 5px; border: 1px solid #09c6ab; color: white; width: 150px;"><b>다음단계</b></button>
            </div>
        </article>
    </section>
    <!-- 컨텐츠 끝 -->
    
    <!-- 약관동의 유효성검사 -->
    <script>
    /* 모든 약관 동의 */
    $("#all_chk").click(function(){
        var radios = $(":radio[value='Y']");
        if($("#all_chk").prop("checked")) {
            radios.prop("checked",true);
        } else {
            radios.prop("checked",false); 
        }
    });

    /* 동의여부 확인 및 value=Y선택 확인 */
    /* $("#check_module").click(function() {
          var check = $(".radio_chk:checked").length;
        var radios = $(":radio[value='Y']");
          if(check == 0) {
             alert('동의여부를 확인해주세요');
             return false;
          } else if (check > 0){
             for(var i = 0; i < radios.length; i++) {
               var $this = $(radios[i]);
                if(!$this.is(":checked")) {
                   alert('반드시 동의해야 합니다.');
                    $this.focus();
                }
                return false;
             }
          }
    }); */
    /* $("#check_module").click(function() { */
    function checkModule() {
       
       /* 탑승객 정보 입력확인 */
       var pName = $("#passengerName").val();
       var gender = $("#pGender").val();
       var nation = $("#nationality").val();
       var pBirthDay = $("#pBirthDay").val();
       var pEmail = $("#pEmail").val();
       var pPhone = $("#pPhone").val();      
       if (pName == "") {
          alert("이름을 입력해주세요.");
          $("#passengerName").focus();
          return false;
       } else if (gender == "") {
          alert("성별을 선택해주세요.");
          $("#pGender").focus();
          return false;
       } else if (nation == "") {
          alert("국적을 선택해주세요.");
          $("#nationality").focus();
          return false;
       } else if (pBirthDay == "") {
          alert("생년월일을 입력해주세요.");
          $("#pBirthDay").focus();
          return false;
       } else if (pEmail == "") {
          alert("이메일을 입력해주세요.");
          $("#pEmail").focus();
          return false;
       } else if (pPhone == "") {
          alert("전화번호를 입력해주세요.");
          $("#pPhone").focus();
          return false;
       }
      
       /* 약관동의 확인 및 동의함 체크여부 */
       var check = $(".radio_chk:checked").length;
        var radios = $(":radio[value='Y']");
          if(check == 0) {
             alert('동의여부를 확인해주세요');
             return false;
          } else if (check > 0){
             for(var i = 0; i < radios.length; i++) {
               var $this = $(radios[i]);
                if(!$this.is(":checked")) {
                   alert('반드시 동의해야 합니다.');
                    $this.focus();
                   return false;
                }
             }
          }
          
          /* 로그인 상태 확인 */
       	var id=$("input[name='userId']").val();
       	console.log(id);
		if(id == '') {
			alert("로그인 후 결제가 가능합니다.");
			location.href='loginView.tpo';
		}
       
          /* 결제 */
        var IMP = window.IMP;
          IMP.init('imp55814317');
      // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
      // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
      IMP.request_pay({
         pg : 'inicis', // version 1.1.0부터 지원.
         /*
          'kakao':카카오페이,
          html5_inicis':이니시스(웹표준결제)
          'nice':나이스페이
          'jtnet':제이티넷
          'uplus':LG유플러스
          'danal':다날
          'payco':페이코
          'syrup':시럽페이
          'paypal':페이팔
          */
         pay_method : 'card',
         /*
          'samsung':삼성페이,
          'card':신용카드,
          'trans':실시간계좌이체,
          'vbank':가상계좌,
          'phone':휴대폰소액결제
          */
         merchant_uid : 'merchant_' + new Date().getTime(),
         /*
          merchant_uid에 경우
          https://docs.iamport.kr/implementation/payment
          위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
          참고하세요.
          나중에 포스팅 해볼게요.
          */
         name : '항공편 예매',
         amount : 100, // 가격
         buyer_email : 'iamport@siot.do', // 예매자 이메일 ${loginUser.email}
         buyer_name : '구매자이름', // 예매자 이름 ${loginUser.userName}
         buyer_tel : '010-1234-5678', // 예매자 전화번호 ${loginUser.phone}
         buyer_addr : '서울특별시 강남구 삼성동', // 예매자 주소 ${loginUser.address}
         buyer_postcode : '123-456', // 우편번호에 대한 정보가 우리는 없음..
         m_redirect_url : 'https://www.yourdomain.com/payments/complete'
      /*
       모바일 결제시,
       결제가 끝나고 랜딩되는 URL을 지정
       (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
       */
      }, function(rsp) {
         if (rsp.success) {
            var msg = '결제가 완료되었습니다.\n';
            msg += '고유ID : ' + rsp.imp_uid + '\n';
            msg += '상점 거래ID : ' + rsp.merchant_uid + '\n';
            msg += '결제 금액 : ' + rsp.paid_amount + '\n';
            msg += '카드 승인번호 : ' + rsp.apply_num;
            alert(msg);
            $("form").submit();
            return true;
         } else {
            var msg = '결제에 실패하였습니다.\n';
            msg += '에러내용 : ' + rsp.error_msg;
            alert(msg);
            return false;
         }
         alert(msg);
      });
    }

    </script>
   
   <jsp:include page="/include/includeFooter.jsp" />
</body>
</html>