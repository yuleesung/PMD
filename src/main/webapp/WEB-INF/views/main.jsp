<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords"
	content="Doctor Search Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
<title>Main</title>
<!-- Calendar -->
<link rel="stylesheet" href="resources/css/jquery-ui.css">

<!--stylesheets-->
<link rel="stylesheet" href="resources/css/style.css">
<link href="resources/css/main_style.css" rel="stylesheet" type="text/css" media="all">
<link href="//fonts.googleapis.com/css?family=Cuprum:400,700" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="resources/css/text.css" rel="stylesheet" />

<!-- 캐러셀 -->
<link rel="stylesheet" type="text/css" href="resources/css/carousel.css">
<style type="text/css">
.search-sec {
	padding: 2rem;
}

.search-slt {
	display: block;
	width: 100%;
	font-size: 0.875rem;
	line-height: 1.5;
	color: #55595c;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	height: calc(3rem + 2px) !important;
	border-radius: 0;
}

.wrn-btn {
	width: 100%;
	font-size: 16px;
	font-weight: 400;
	text-transform: capitalize;
	height: calc(3rem + 2px) !important;
	border-radius: 0;
}

@media ( min-width : 992px) {
	.search-sec {
		position: relative;
		top: -114px;
		background: rgba(26, 70, 104, 0.51);
	}
}

@media ( max-width : 992px) {
	.search-sec {
		background: #1A4668;
	}
}

option{
	color: black;
}
</style>
</head>
<body>
	<div class="header">
		<!-- <a class="navbar-brand absolute" href="main.inc"> <span
			style="font-size: 30px; color: white;">PMD</span>
		</a> -->
		
		<nav class="navbar navbar-expand navbar-dark">
			<div class="container-fluid">
				<a class="navbar-brand absolute" href="main.inc"> <span
					style="font-size: 30px; color: white;">P M D</span>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end"
					id="navbarNavDropdown">
					<ul class="navbar-nav align-self-end" id="nav">
						<li class="nav-item" style="margin-right: 30px;"><a
							class="nav-link" href="#" style="color: white;">item 1</a></li>
						<li class="nav-item" style="margin-right: 30px;"><a
							class="nav-link" href="#" style="color: white;">item 2</a></li>
						<li class="nav-item" style="margin-right: 30px;"><a
							class="nav-link" href="#" style="color: white;">Item 3</a></li>
						<li class="nav-item" style="margin-right: 30px;"><a
							class="nav-link" href="#" style="color: white;">Item 4</a></li>
						<li class="nav-item dropdown d-none">
							창 크기에 따라 메뉴바 형태를 바꿔주는 부분 <a
							class="nav-link dropdown-toggl" href="#" id="navbarDropdownMenu"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span class="navbar-toggler-icon"></span>
						</a>
							<ul class="dropdown-menu dropdown-menu-right bg-info"
								aria-labelledby="navbarDropdownMenu">
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		
	</div>

	<!-- 캐러셀 -->
	<div id="carousel_section">
		<ul>
			<li> <img src="resources/images/test1.gif"> </li>
			<li> <img src="resources/images/test2.gif"> </li>
			<li> <img src="resources/images/test3.gif"> </li>
		</ul>
	</div>


	<!-- 배너 추천 훈련과정 -->
	<div class="container-fluid">
		<div id="carouselExample" class="carouselPrograms carousel slide"
			data-ride="carousel" data-interval="false">
			<div class="carousel-inner row w-100 mx-auto" role="listbox">
				<c:forEach var="mvo" items="${ar }" varStatus="st">
					<c:if test="${st.index == 0 }">
						<div class="carousel-item col-md-4 active"
							style="width: 360px; height: 600px;">
							<c:choose>
								<c:when test="${fn:length(mvo.categoryNm) lt 12 }">
									<h3 style="width: 100%; border: 3px solid rgba(0, 20, 230, 0.8); border-radius: 10px; text-align: center; padding: 5px;">${mvo.categoryNm }</h3>
								</c:when>
								<c:otherwise>
									<h4 style="width: 100%; border: 3px solid rgba(0, 20, 230, 0.8); border-radius: 10px; text-align: center; padding: 5px;">${mvo.categoryNm }</h4>
								</c:otherwise>
							</c:choose>
							<div class="panel panel-default">
								<div class="panel-thumbnail">
									<div class="card h-100 thumb">
										<a
											href="view.inc?srchTrprId=${mvo.trprId}&srchTrprDegr=${mvo.trprDegr}&traStartDate=${mvo.traStartDate}&traEndDate=${mvo.traEndDate}&trainstCstId=${mvo.trainstCstId}&trainTarget=${mvo.trainTarget}&superViser=${mvo.superViser}&yardMan=${mvo.yardMan}&regCourseMan=${mvo.regCourseMan}">
											<img class="card-img-top img-fluid mx-auto d-block"
											src="resources/images/occupation/${mvo.category}.jpg"
											alt="${mvo.subTitle }" width="350px" height="150px" />
										</a>
										<div class="card-body">
											<a href="view.inc?srchTrprId=${mvo.trprId}&srchTrprDegr=${mvo.trprDegr}&traStartDate=${mvo.traStartDate}&traEndDate=${mvo.traEndDate}&trainstCstId=${mvo.trainstCstId}&trainTarget=${mvo.trainTarget}&superViser=${mvo.superViser}&yardMan=${mvo.yardMan}&regCourseMan=${mvo.regCourseMan}">
											<c:choose>
												<c:when test="${fn:length(mvo.title) lt 25 }">
													<h4 class="card-title" style="text-align: center; height: 90px; vertical-align: middle;">${mvo.title }</h4>
												</c:when>
												<c:otherwise>
													<h5 class="card-title" style="text-align: center; height: 90px; vertical-align: middle;">${mvo.title }</h5>
												</c:otherwise>
											</c:choose>
											</a>
											<p class="card-text" style="text-align: center;">
											<c:choose>
												<c:when test="${fn:length(mvo.subTitle) lt 10 }">
													<span style="font-weight: bold; font-size: 1.2em; font-size: 18px;">${mvo.subTitle }</span>
												</c:when>
												<c:otherwise>
													<span style="font-weight: bold; font-size: 1.2em; font-size: 15px;">${mvo.subTitle }</span>
												</c:otherwise>
											</c:choose>
												<br /> <span
													style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총
													훈련비</span>
												<fmt:formatNumber value="${mvo.courseMan }" pattern="#,###" />
												원
												<c:choose>
													<c:when test="${mvo.regCourseMan lt mvo.yardMan }">
														<span
															style="border-radius: 10px; background-color: rgba(0, 150, 60, 0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
													</c:when>
													<c:otherwise>
														<span
															style="border-radius: 10px; background-color: rgba(150, 0, 60, 0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집마감</span>
													</c:otherwise>
												</c:choose>
											</p>
											<hr />
											<p class="card-text" style="text-align: center;">
												훈련기간<br /> ${mvo.traStartDate } ~ ${mvo.traEndDate }
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${st.index > 0 }">
						<div class="carousel-item col-md-4 "
							style="width: 360px; height: 600px;">
							<c:choose>
								<c:when test="${fn:length(mvo.categoryNm) lt 12 }">
									<h3 style="width: 100%; border: 3px solid rgba(0, 20, 230, 0.8); border-radius: 10px; text-align: center; padding: 5px;">${mvo.categoryNm }</h3>
								</c:when>
								<c:otherwise>
									<h4 style="width: 100%; border: 3px solid rgba(0, 20, 230, 0.8); border-radius: 10px; text-align: center; padding: 5px;">${mvo.categoryNm }</h4>
								</c:otherwise>
							</c:choose>	
							<div class="panel panel-default">
								<div class="panel-thumbnail">
									<div class="card h-100 thumb">
										<a href="view.inc?srchTrprId=${mvo.trprId}&srchTrprDegr=${mvo.trprDegr}&traStartDate=${mvo.traStartDate}&traEndDate=${mvo.traEndDate}&trainstCstId=${mvo.trainstCstId}&trainTarget=${mvo.trainTarget}&superViser=${mvo.superViser}&yardMan=${mvo.yardMan}&regCourseMan=${mvo.regCourseMan}">
											<img class="card-img-top img-fluid mx-auto d-block"
											src="resources/images/occupation/${mvo.category}.jpg"
											alt="${mvo.subTitle }" width="350px" height="150px" />
										</a>
										<div class="card-body">
											<a href="view.inc?srchTrprId=${mvo.trprId}&srchTrprDegr=${mvo.trprDegr}&traStartDate=${mvo.traStartDate}&traEndDate=${mvo.traEndDate}&trainstCstId=${mvo.trainstCstId}&trainTarget=${mvo.trainTarget}&superViser=${mvo.superViser}&yardMan=${mvo.yardMan}&regCourseMan=${mvo.regCourseMan}">
											<c:choose>
												<c:when test="${fn:length(mvo.title) lt 25 }">
													<h4 class="card-title" style="text-align: center; height: 90px; vertical-align: middle;">${mvo.title }</h4>
												</c:when>
												<c:otherwise>
													<h5 class="card-title" style="text-align: center; height: 90px; vertical-align: middle;">${mvo.title }</h5>
												</c:otherwise>
											</c:choose>
											</a>
											<p class="card-text" style="text-align: center;">
												<c:choose>
												<c:when test="${fn:length(mvo.subTitle) lt 10 }">
													<span style="font-weight: bold; font-size: 1.2em; font-size: 18px;">${mvo.subTitle }</span>
												</c:when>
												<c:otherwise>
													<span style="font-weight: bold; font-size: 1.2em; font-size: 15px;">${mvo.subTitle }</span>
												</c:otherwise>
											</c:choose>
												<br /> <span
													style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총
													훈련비</span>
												<fmt:formatNumber value="${mvo.courseMan }" pattern="#,###" />
												원
												<c:choose>
													<c:when test="${mvo.regCourseMan lt mvo.yardMan }">
														<span
															style="border-radius: 10px; background-color: rgba(0, 150, 60, 0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
													</c:when>
													<c:otherwise>
														<span
															style="border-radius: 10px; background-color: rgba(150, 0, 60, 0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집마감</span>
													</c:otherwise>
												</c:choose>
											</p>
											<hr />
											<p class="card-text" style="text-align: center;">
												훈련기간<br /> ${mvo.traStartDate } ~ ${mvo.traEndDate }
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<a class="carousel-control-prev" href="#carouselExample"
				role="button" data-slide="prev"> <img alt="right"
				src="resources/images/left.png" style="position:absolute; left:2px; width: 50px; height: 50px;" />		
			</a>
			<a class="carousel-control-next text-faded" href="#carouselExample"
				role="button" data-slide="next"> <img alt="right"
				src="resources/images/right.png" style="position:absolute; right:2px; width: 50px; height: 50px;" />
			</a>
		</div>
	</div>






	<section class="search-sec" style="margin-top: 120px;">
		<div class="container">
			<form action="#" method="post" novalidate="novalidate">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-sm-12 p-0">
								<input type="text" class="form-control search-slt"
									id="srchTraOrganNm" placeholder="훈련기관" />
							</div>
							<div class="col-lg-3 col-md-3 col-sm-12 p-0">
								<input type="text" class="form-control search-slt"
									id="srchTraProcessNm" placeholder="훈련과정" />
							</div>
							<div class="col-lg-3 col-md-3 col-sm-12 p-0">
								<select class="form-control search-slt" id="crseTracseSe">
									<option value="none">::훈련유형::</option>
									<option value="C0055">내일배움카드(구직자)</option>
									<option value="C0054">국가기간전략산업직종</option>
									<option value="C0068">컨소시엄 채용예정자</option>
									<option value="C0053">지역구직자</option>
									<option value="C0059">청년취업아카데미</option>
									<option value="Y0054">4차산업혁명인력양성</option>
									<option value="Z">중장년특화과정</option>
									<option value="C0077">지역맞춤형일자리창출지원</option>
									<option value="C0074">장애인직업능력개발훈련</option>
									<option value="C0075">건설일용근로자기능향상</option>
									<option value="C0071">베이비부머과정(폴리텍대학)</option>
									<option value="C0069">기능사과정(폴리텍대학)</option>
									<option value="C0070">기능장과정(폴리텍대학)</option>
									<option value="C0072">여성재취업과정(폴리텍대학)</option>
								</select>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-12 p-0">
								<select class="form-control search-slt" id="srchKeco1">
									<option value="none">::훈련분야::</option>
									<option value="01">사업관리(01)</option>
									<option value="02">경영·회계·사무(02)</option>
									<option value="03">금융·보험(03)</option>
									<option value="04">교육·자연·사회과학(04)</option>
									<option value="05">법률·경찰·소방·교도·국방(05)</option>
									<option value="06">보건·의료(06)</option>
									<option value="07">사회복지·종교(07)</option>
									<option value="08">문화·예술·디자인·방송(08)</option>
									<option value="09">운전·운송(09)</option>
									<option value="10">영업판매(10)</option>
									<option value="11">경비·청소(11)</option>
									<option value="12">이용·숙박·여행·오락·스포츠(12)</option>
									<option value="13">음식서비스(13)</option>
									<option value="14">건설(14)</option>
									<option value="15">기계(15)</option>
									<option value="16">재료(16)</option>
									<option value="17">화학(17)</option>
									<option value="18">섬유·의복(18)</option>
									<option value="19">전기·전자(19)</option>
									<option value="20">정보통신(20)</option>
									<option value="21">식품가공(21)</option>
									<option value="22">인쇄·목재·가구·공예(22)</option>
									<option value="23">환경·에너지·안전(23)</option>
									<option value="24">농림어업(24)</option>
								</select>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-12 p-0">
								<input type="text" class="form-control search-slt"
									id="srchTraStDt" placeholder="훈련시작일">
							</div>
							<div class="col-lg-3 col-md-3 col-sm-12 p-0">
								<select class="form-control search-slt" id="srchTraArea1">
									<option value="none">::훈련지역 시도::</option>
									<option value="11">서울</option>
									<option value="26">부산</option>
									<option value="27">대구</option>
									<option value="28">인천</option>
									<option value="29">광주</option>
									<option value="30">대전</option>
									<option value="31">울산</option>
									<option value="36">세종</option>
									<option value="41">경기</option>
									<option value="42">강원</option>
									<option value="43">충북</option>
									<option value="44">충남</option>
									<option value="45">전북</option>
									<option value="46">전남</option>
									<option value="47">경북</option>
									<option value="48">경남</option>
									<option value="50">제주</option>
								</select>
							</div>
							<div style="width: 350px; margin: auto;">
								<button type="button" class="btn btn-danger wrn-btn"
									id="search_btn" style="border-radius: 10px; width: 300px;">검 색</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>

	<!-- 리스트 -->
	<div class="container" id="result" style="display: none;"></div>

	<!--scripts-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/carousel.js"></script>
	<script src="resources/js/menubar.js"></script>
	<script>
	
		addEventListener("load", function() {
			setTimeout(hideURLbar, 0);
		}, false);
		function hideURLbar() {
			window.scrollTo(0, 1);
		}

		$(function() {
			$("#srchTraStDt").datepicker(
					{
						dateFormat : "yy년mm월dd일",
						dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
						monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
								"7월", "8월", "9월", "10월", "11월", "12월" ],
						showMonthAfterYear : true,

					});
			$('#carouselExample').on(
					'slide.bs.carousel',
					function(e) {

						var $e = $(e.relatedTarget);
						var idx = $e.index();
						var itemsPerSlide = 3;
						var totalItems = $('.carousel-item').length;

						if (idx >= totalItems - (itemsPerSlide - 1)) {
							var it = itemsPerSlide - (totalItems - idx);
							for (var i = 0; i < it; i++) {
								// append slides to end
								if (e.direction == "left") {
									$('.carousel-item').eq(i).appendTo(
											'.carousel-inner');
								} else {
									$('.carousel-item').eq(0).appendTo(
											'.carousel-inner');
								}
							}
						}
					});

			/* show lightbox when clicking a thumbnail */
			$('a.thumb').click(function(event) {
				event.preventDefault();
				var content = $('.modal-body');
				content.empty();
				var title = $(this).attr("title");
				$('.modal-title').html(title);
				content.html($(this).html());
				$(".modal-profile").modal({
					show : true
				});
			});

			$("#search_btn")
					.click(
							function() {

								var srchTraOrganNm = $("#srchTraOrganNm").val(); // 훈련기관
								var srchTraProcessNm = $("#srchTraProcessNm").val(); // 훈련과정
								var crseTracseSe = $("#crseTracseSe").val(); // 훈련유형
								var srchKeco1 = $("#srchKeco1").val(); // 훈련분야
								var date = $("#srchTraStDt").val(); // 훈련시작일
								var srchTraArea1 = $("#srchTraArea1").val(); // 훈련지역

								var year = date.substring(0, 4);
								var month = date.substring(5, 7);
								var day = date.substring(8, 10);

								var srchTraStDt = year + month + day;

								var param = "";

								if (srchTraOrganNm.trim().length > 0) {
									param += "&srchTraOrganNm="
											+ srchTraOrganNm;
								}

								if (srchTraProcessNm.trim().length > 0) {
									param += "&srchTraProcessNm="
											+ srchTraProcessNm;
								}

								if (crseTracseSe != "none") {
									param += "&crseTracseSe=" + crseTracseSe;
								}

								if (srchKeco1 != "none") {
									param += "&srchKeco1=" + srchKeco1;
								}

								if (date.trim().length > 0) {
									param += "&srchTraStDt=" + srchTraStDt;
								}

								if (srchTraArea1 != "none") {
									param += "&srchTraArea1=" + srchTraArea1;
								}

								var data = "";

								if (param.startsWith("&")) {
									data = param.substring(1, param.length);
								}

								$.ajax({
											url : "search.inc",
											type : "post",
											data : data,
											dataType : "json"
										})
										.done(
												function(res) {
													$("#result").css("display",
															"block");
													// console.log(res.ar[0].trprId);

													var str = "<h1 class='my-5' style='font-weight: bold;'>검색 결과</h1>";
													str += "<hr/>";
													str += "<div class='row'>";

													for (var i = 0; i < res.ar.length; i++) {
														str += "<div class='col-lg-4 col-md-6 col-sm-12 p-3'>";
														str += "<div class='card h-100'>";
														str += "<a href='view.inc?srchTrprId="
																+ res.ar[i].trprId
																+ "&srchTrprDegr="
																+ res.ar[i].trprDegr
																+ "&traStartDate="
																+ res.ar[i].traStartDate
																+ "&traEndDate="
																+ res.ar[i].traEndDate
																+ "&trainstCstId="
																+ res.ar[i].trainstCstId
																+ "&trainTarget="
																+ res.ar[i].trainTarget
																+ "&superViser="
																+ res.ar[i].superViser
																+ "&yardMan="
																+ res.ar[i].yardMan
																+ "&regCourseMan="
																+ res.ar[i].regCourseMan
																+ "'>";
														str += "<h5 class='card-title' style='text-align: center; color: white; background-color: rgba(0, 0, 255, 0.5); border-radius: 10px; width: 100%; margin: 10px auto;'>"
																+ res.ar[i].subTitle
																+ "</h5>";
														str += "</a>";
														str += "<div class='card-body'>";
														str += "<a href='view.inc?srchTrprId="
																+ res.ar[i].trprId
																+ "&srchTrprDegr="
																+ res.ar[i].trprDegr
																+ "&traStartDate="
																+ res.ar[i].traStartDate
																+ "&traEndDate="
																+ res.ar[i].traEndDate
																+ "&trainstCstId="
																+ res.ar[i].trainstCstId
																+ "&trainTarget="
																+ res.ar[i].trainTarget
																+ "&superViser="
																+ res.ar[i].superViser
																+ "&yardMan="
																+ res.ar[i].yardMan
																+ "&regCourseMan="
																+ res.ar[i].regCourseMan
																+ "'>";
														str += "<h4 class='card-title' style='text-align: center; height: 90px; vertical-align: middle;'>"
																+ res.ar[i].title
																+ "</h4>";
														str += "</a>";
														str += "<p class='card-text' style='text-align: center;'>";
														str += "<span style='font-weight: bold; color: rgba(250, 0, 0, 0.7);'>총 훈련비</span>&nbsp;";
														str += numberWithCommas(res.ar[i].courseMan)
																+ "원&nbsp;";

														if (res.ar[i].regCourseMan < res.ar[i].yardMan) {
															str += "<span style='border-radius: 10px; background-color: rgba(0, 150, 60, 0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;'>모집중</span>";
														} else {
															str += "<span style='border-radius: 10px; background-color: rgba(150, 0, 60, 0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;'>모집마감</span>";
														}

														str += "</p>";
														str += "<hr/>";
														str += "<p class='card-text' style='text-align: center;'>훈련기간<br/>"
																+ res.ar[i].traStartDate
																+ "~"
																+ res.ar[i].traEndDate
																+ "</p>";
														str += "</div>";
														str += "</div>";
														str += "</div>";
													}
													str += "</div>";
													str += "<div style='width: 300px; margin: auto;'>";
													str += res.pageCode;
													str += "</div>";
													console.log(str);
													$("#result").html(str);

												}).fail(function(err) {
											console.log(err);
										});

							});

		});

		function page(nowPage) {
			var srchTraOrganNm = $("#srchTraOrganNm").val(); // 훈련기관
			var srchTraProcessNm = $("#srchTraProcessNm").val(); // 훈련과정
			var crseTracseSe = $("#crseTracseSe").val(); // 훈련유형
			var srchKeco1 = $("#srchKeco1").val(); // 훈련분야
			var date = $("#srchTraStDt").val(); // 훈련시작일
			var srchTraArea1 = $("#srchTraArea1").val(); // 훈련지역

			var year = date.substring(0, 4);
			var month = date.substring(5, 7);
			var day = date.substring(8, 10);

			var srchTraStDt = year + month + day;

			var param = "";

			if (srchTraOrganNm.trim().length > 0) {
				param += "&srchTraOrganNm=" + srchTraOrganNm;
			}

			if (srchTraProcessNm.trim().length > 0) {
				param += "&srchTraProcessNm=" + srchTraProcessNm;
			}

			if (crseTracseSe != "none") {
				param += "&crseTracseSe=" + crseTracseSe;
			}

			if (srchKeco1 != "none") {
				param += "&srchKeco1=" + srchKeco1;
			}

			if (date.trim().length > 0) {
				param += "&srchTraStDt=" + srchTraStDt;
			}

			if (srchTraArea1 != "none") {
				param += "&srchTraArea1=" + srchTraArea1;
			}

			var data = "";

			if (param.startsWith("&")) {
				data = param.substring(1, param.length);
			}

			data += "&nowPage=" + nowPage;

			$
					.ajax({
						url : "search.inc",
						type : "post",
						data : data,
						dataType : "json"
					})
					.done(
							function(res) {
								$("#result").css("display", "block");
								// console.log(res.ar[0].trprId);

								var str = "<h1 class='my-5' style='font-weight: bold;'>검색 결과</h1>";
								str += "<hr/>";
								str += "<div class='row'>";

								for (var i = 0; i < res.ar.length; i++) {
									str += "<div class='col-lg-4 col-md-6 col-sm-12 p-3'>";
									str += "<div class='card h-100'>";
									str += "<a href='view.inc?srchTrprId="
											+ res.ar[i].trprId
											+ "&srchTrprDegr="
											+ res.ar[i].trprDegr
											+ "&traStartDate="
											+ res.ar[i].traStartDate
											+ "&traEndDate="
											+ res.ar[i].traEndDate
											+ "&trainstCstId="
											+ res.ar[i].trainstCstId
											+ "&trainTarget="
											+ res.ar[i].trainTarget
											+ "&superViser="
											+ res.ar[i].superViser
											+ "&yardMan=" + res.ar[i].yardMan
											+ "&regCourseMan="
											+ res.ar[i].regCourseMan + "'>";
									str += "<h5 class='card-title' style='text-align: center; color: white; background-color: rgba(0, 0, 255, 0.5); border-radius: 10px; width: 100%; margin: 10px auto;'>"
											+ res.ar[i].subTitle + "</h5>";
									str += "</a>";
									str += "<div class='card-body'>";
									str += "<a href='view.inc?srchTrprId="
											+ res.ar[i].trprId
											+ "&srchTrprDegr="
											+ res.ar[i].trprDegr
											+ "&traStartDate="
											+ res.ar[i].traStartDate
											+ "&traEndDate="
											+ res.ar[i].traEndDate
											+ "&trainstCstId="
											+ res.ar[i].trainstCstId
											+ "&trainTarget="
											+ res.ar[i].trainTarget
											+ "&superViser="
											+ res.ar[i].superViser
											+ "&yardMan=" + res.ar[i].yardMan
											+ "&regCourseMan="
											+ res.ar[i].regCourseMan + "'>";
									str += "<h4 class='card-title' style='text-align: center; height: 90px; vertical-align: middle;'>"
											+ res.ar[i].title + "</h4>";
									str += "</a>";
									str += "<p class='card-text' style='text-align: center;'>";
									str += "<span style='font-weight: bold; color: rgba(250, 0, 0, 0.7);'>총 훈련비</span>&nbsp;";
									str += numberWithCommas(res.ar[i].courseMan)
											+ "원&nbsp;";

									if (res.ar[i].regCourseMan < res.ar[i].yardMan) {
										str += "<span style='border-radius: 10px; background-color: rgba(0, 150, 60, 0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;'>모집중</span>";
									} else {
										str += "<span style='border-radius: 10px; background-color: rgba(150, 0, 60, 0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;'>모집마감</span>";
									}

									str += "</p>";
									str += "<hr/>";
									str += "<p class='card-text' style='text-align: center;'>훈련기간<br/>"
											+ res.ar[i].traStartDate
											+ "~"
											+ res.ar[i].traEndDate + "</p>";
									str += "</div>";
									str += "</div>";
									str += "</div>";
								}
								str += "</div>";
								str += "<div style='width: 300px; margin: auto;'>";
								str += res.pageCode;
								str += "</div>";
								console.log(str);
								$("#result").html(str);

							}).fail(function(err) {
						console.log(err);
					});
		}

		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
	</script>

</body>
</html>