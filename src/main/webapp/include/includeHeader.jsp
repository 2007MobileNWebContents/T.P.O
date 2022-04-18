<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>TPO</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content=""/>
<meta property="og:image" content=""/>
<meta property="og:url" content=""/>
<meta property="og:site_name" content=""/>
<meta property="og:description" content=""/>
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="resources/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="resources/css/icomoon.css">
<!-- Themify Icons-->
<link rel="stylesheet" href="resources/css/themify-icons.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="resources/css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="resources/css/magnific-popup.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="resources/css/bootstrap-datepicker.min.css">

<!-- Owl Carousel  -->
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">

<!-- Theme style  -->
<link rel="stylesheet" href="resources/css/style.css">
<!-- Modernizr JS -->
<script src="resources/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
<script src="resources/js/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="resources/css/urban.css">
<link rel="stylesheet" type="text/css" href="resources/css/city.css">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/gyeonggido.css"> -->
<!-- jQuery 쿼리 추가 -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<!--  주소팝업창 script 추가 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- jQuery Modal script 추가-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
</head>
<body>
	<div class="page"></div>
   <!-- 헤더 시작 -->
   <header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image:url(resources/images/img_bg_2.jpg)">
      <div class="overlay"></div>
      <div class="gtco-container">
         <div class="row">
            <div class="col-md-12 col-md-offset-0 text-left">
               <div class="row row-mt-15em">
                  <div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
                     <h1>Time<br>Place<br>Occasion</h1>   
                  </div>
               </div>
            </div>
         </div>
      </div>
   </header>
   <!-- 헤더 끝 -->
   
   <!-- 네비게이션 시작 -->
   <!-- <div class="page-inner"> -->
   <nav class="gtco-nav" role="navigation">
      <div class="gtco-container">
         <div class="row">
            <div class="col-sm-4 col-xs-12">
               <div id="gtco-logo"><a href="mainPage.tpo">TPO</a></div>
            </div>
            <div class="col-xs-8 text-right menu-1">
               <ul>
                  <li><a href="reservation.tpo">Reservation</a></li>
                  <li><a href="sightList.tpo">Attraction</a></li>
                  <li><a href="restList.tpo">Room</a></li>
                  <li class="has-dropdown">
                   <c:if test="${empty loginUser }">
                   	<a href="loginView.tpo">Login</a>
                   </c:if>
                    <c:if test="${!empty loginUser }">
                          <a href="#"><img src="../resources/images/login.png" style="width:30px;"></a>
                     <ul class="dropdown">
                     	<li><a href="logout.tpo">Logout</a></li>
                        <li><a href="myPageView.tpo">My Page</a></li>
                     </ul>
                     </c:if>
                  </li>
               </ul>   
            </div>
         </div>
      </div>
   </nav>
   <!-- 네비게이션 끝 -->
   
   <!-- jQuery -->
   <script src="resources/js/jquery.min.js"></script>
   <!-- jQuery Easing -->
   <script src="resources/js/jquery.easing.1.3.js"></script>
   <!-- Bootstrap -->
   <!-- <script src="resources/js/bootstrap.min.js"></script> -->
   <!-- Waypoints -->
   <script src="resources/js/jquery.waypoints.min.js"></script>
   <!-- Carousel -->
   <script src="resources/js/owl.carousel.min.js"></script>
   <!-- countTo -->
   <script src="resources/js/jquery.countTo.js"></script>
   <!-- Stellar Parallax -->
   <script src="resources/js/jquery.stellar.min.js"></script>
   <!-- Magnific Popup -->
   <script src="resources/js/jquery.magnific-popup.min.js"></script>
   <script src="resources/js/magnific-popup-options.js"></script>
   <!-- Datepicker -->
   <script src="resources/js/bootstrap-datepicker.min.js"></script>
   <!-- Main -->
   <script src="resources/js/main.js"></script>
   
</body>
</html>