<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html style="background-color: white;">
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
<link href="//fonts.googleapis.com/css?family=Cuprum:400,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="resources/css/text.css" rel="stylesheet" />
<link href="resources/css/main_style.css" rel="stylesheet" type="text/css" media="all">
<!-- 캐러셀 -->
<link rel="stylesheet" type="text/css" href="resources/css/carousel.css">

<!-- 메뉴바 관련 추가 -->
<link href="http://fonts.googleapis.com/css?family=Didact+Gothic"
	rel="stylesheet">
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css"
	media="all">
<link href="resources/css/default.css" rel="stylesheet" type="text/css"
	media="all">

<style type="text/css">
html, body {
	width: 100%; height: 100%;
}
.search-sec {
	padding: 2rem;
}

.search-slt {
	display: block;
	width: 90%;
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
		background: rgba(26, 70, 104, 0.51);
	}
}

option {
	color: black;
}
.carousel_section{
	width: 270px;
}
.carousel_section img{
	width: 100%;
}

.carousel_section img:hover{

	border-bottom: 5px solid #BDBDBD;
	border-right: 5px solid #BDBDBD;
	border-radius: 12px;
}

.carousel_section img:active{
	border-left: 5px solid #BDBDBD;
	border-top: 5px solid #BDBDBD;
	border-bottom: 0;
	border-right: 0;
	border-radius: 12px;
}
</style>
</head>
<body>
	
	<jsp:include page="menubar2.jsp" />
	

	<div class="container">

		<!-- 이미지 Height+시간조절은 js에서 변경-->
		<div style="width: 1080px; margin: auto;">
			<div id="carousel_section" class="carousel_section">
				<ul>
					<c:forEach var="img_ar1" items="${img_ar1 }" varStatus="st">
						<li><a href="${link_ar1[st.index] }"><img title="${link_ar1[st.index] }" src="${img_ar1 }"></a></li>
					</c:forEach>
				</ul>
			</div>

			<div id="carousel_section2" class="carousel_section">
				<ul>
					<c:forEach var="img_ar2" items="${img_ar2 }" varStatus="st">
						<li><a href="${link_ar2[st.index] }"><img title="${link_ar2[st.index] }" src="${img_ar2 }"></a></li>
					</c:forEach>
				</ul>
			</div>

			<div id="carousel_section3" class="carousel_section">
				<ul>
					<c:forEach var="img_ar3" items="${img_ar3 }" varStatus="st">
						<li><a href="${link_ar3[st.index] }"><img title="${link_ar3[st.index] }" src="${img_ar3 }"></a></li>
					</c:forEach>
				</ul>
			</div>
			<div id="carousel_section4" class="carousel_section">
				<ul>
					<c:forEach var="img_ar4" items="${img_ar4 }" varStatus="st">
						<li><a href="${link_ar4[st.index] }"><img title="${link_ar4[st.index] }" src="${img_ar4 }"></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- 배너 추천 훈련과정 -->

		<div id="myCarousel" class="carousel slide" data-ride="carousel" style="position: unset;">
			<div class="carousel-inner row w-100 mx-auto">

				<c:forEach var="mvo" items="${ar }" varStatus="st">
					<c:if test="${st.index == 0 }">
						<div class="carousel-item col-md-4 active">
							<a style="color: black;" href="javascript: goView('${mvo.trprId}', '${mvo.trprDegr}', '${mvo.traStartDate}', '${mvo.traEndDate}', '${mvo.trainstCstId}', '${mvo.trainTarget}', '${mvo.superViser}', '${mvo.yardMan}', '${mvo.regCourseMan}')">
							<c:choose>
								<c:when test="${fn:length(mvo.categoryNm) lt 12 }">
									<h3 style="width: 100%; border: 3px solid rgba(0, 20, 230, 0.8); border-radius: 10px; text-align: center; padding: 5px;">
										${mvo.categoryNm }
									</h3>
								</c:when>
								<c:otherwise>
									<h4 style="width: 100%; border: 3px solid rgba(0, 20, 230, 0.8); border-radius: 10px; text-align: center; padding: 5px;">
										${mvo.categoryNm }
									</h4>
								</c:otherwise>
							</c:choose>
							<div class="panel panel-default">
								<div class="panel-thumbnail">
									<div class="card h-100 thumb">
											<img class="card-img-top img-fluid mx-auto d-block" src="resources/images/occupation/${mvo.category}.jpg"
												alt="${mvo.subTitle }" width="350px" height="150px" />
										<div class="card-body">
												<c:choose>
													<c:when test="${fn:length(mvo.title) lt 25 }">
														<h4 class="card-title"
															style="text-align: center; height: 90px; vertical-align: middle; color: #007bff">${mvo.title }</h4>
													</c:when>
													<c:otherwise>
														<h5 class="card-title"
															style="text-align: center; height: 90px; vertical-align: middle; color: #007bff">${mvo.title }</h5>
													</c:otherwise>
												</c:choose>
											<p class="card-text" style="text-align: center;">
												<c:choose>
													<c:when test="${fn:length(mvo.subTitle) lt 10 }">
														<span
															style="font-weight: bold; font-size: 1.2em; font-size: 18px;">${mvo.subTitle }</span>
													</c:when>
													<c:otherwise>
														<span
															style="font-weight: bold; font-size: 1.2em; font-size: 15px;">${mvo.subTitle }</span>
													</c:otherwise>
												</c:choose>
												<br /> 
												<span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span>
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
							</a>
						</div>
					</c:if>
					<c:if test="${st.index > 0 }">
						<div class="carousel-item col-md-4">
							<a style="color: black;" href="javascript: goView('${mvo.trprId}', '${mvo.trprDegr}', '${mvo.traStartDate}', '${mvo.traEndDate}', '${mvo.trainstCstId}', '${mvo.trainTarget}', '${mvo.superViser}', '${mvo.yardMan}', '${mvo.regCourseMan}')">
								<c:choose>
									<c:when test="${fn:length(mvo.categoryNm) lt 12 }">
										<h3
											style="width: 100%; border: 3px solid rgba(0, 20, 230, 0.8); border-radius: 10px; text-align: center; padding: 5px;">${mvo.categoryNm }</h3>
									</c:when>
									<c:otherwise>
										<h4
											style="width: 100%; border: 3px solid rgba(0, 20, 230, 0.8); border-radius: 10px; text-align: center; padding: 5px;">${mvo.categoryNm }</h4>
									</c:otherwise>
								</c:choose>
								<div class="panel panel-default">
									<div class="panel-thumbnail">
										<div class="card h-100 thumb">	
												<img class="card-img-top img-fluid mx-auto d-block"
												src="resources/images/occupation/${mvo.category}.jpg"
												alt="${mvo.subTitle }" width="350px" height="150px" />
											<div class="card-body">
													<c:choose>
														<c:when test="${fn:length(mvo.title) lt 25 }">
															<h4 class="card-title"
																style="text-align: center; height: 90px; vertical-align: middle; color: #007bff">${mvo.title }</h4>
														</c:when>
														<c:otherwise>
															<h5 class="card-title"
																style="text-align: center; height: 90px; vertical-align: middle; color: #007bff">${mvo.title }</h5>
														</c:otherwise>
													</c:choose>
												<p class="card-text" style="text-align: center;">
													<c:choose>
														<c:when test="${fn:length(mvo.subTitle) lt 10 }">
															<span
																style="font-weight: bold; font-size: 1.2em; font-size: 18px;">${mvo.subTitle }</span>
														</c:when>
														<c:otherwise>
															<span
																style="font-weight: bold; font-size: 1.2em; font-size: 15px;">${mvo.subTitle }</span>
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
							</a>
						</div>
					</c:if>
				</c:forEach>				
			</div>	
		</div>

<!-- 화살표 prev, next -->
				<a id="left" class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev"
				  	style="width: 50px; display: block; top: 600px;">
					<img alt="left" src="resources/images/back.png">
				</a> 
				<a id="right" class="carousel-control-next" href="#myCarousel" role="button" data-slide="next"
					style="width: 50px; display: block; top: 600px;">
					<img alt="left" src="resources/images/forward.png">
				</a>


		<section class="search-sec" style="margin-top: 170px; width: 100%;">

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
							<div style="width: 100%;">
								<button type="button" class="btn btn-danger wrn-btn"
									id="search_btn"
									style="border-radius: 10px; width: 300px; display: block; margin: auto;">검
									색</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</section>

		<!-- 리스트! -->
		<div class="container" id="result" style="display: none;"></div>
	</div>
	
	<div>
		<form action="view.inc" method="post" name="viewFrm">
			<input type="hidden" name="srchTrprId"/>
			<input type="hidden" name="srchTrprDegr"/>
			<input type="hidden" name="traStartDate"/>
			<input type="hidden" name="traEndDate"/>
			<input type="hidden" name="trainstCstId"/>
			<input type="hidden" name="trainTarget"/>
			<input type="hidden" name="superViser"/>
			<input type="hidden" name="yardMan"/>
			<input type="hidden" name="regCourseMan"/>
		</form>
	</div>

	<jsp:include page="footer.jsp" />
	
	<jsp:include page="scroll.jsp" />
	
	<!--scripts-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/carousel.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	

	<script>
		addEventListener("load", function() {
			setTimeout(hideURLbar, 0);
		}, false);
		function hideURLbar() {
			window.scrollTo(0, 1);
		}

		$(function() {
			
			if($(window).width()< 1300){ 
				$("#right").css('right', '0');
				$("#left").css('left', '0');
			}else if($(window).width()< 1500){
				$("#right").css('right', '10%');
				$("#left").css('left', '10%');
			} else {
				$("#right").css('right', '15%');
				$("#left").css('left', '15%');
			}
			
			$(window).resize(function(){
				if($(window).width()< 1300){
					$("#right").css('right', '0');
					$("#left").css('left', '0');
				}else if($(window).width()< 1500){
					$("#right").css('right', '10%');
					$("#left").css('left', '10%');
				} else {
					$("#right").css('right', '15%');
					$("#left").css('left', '15%');
				}
			});
			
			$('#myCarousel').carousel({
			    interval: 1500
			});
			
			$("#srchTraStDt").datepicker(
					{
						dateFormat : "yy년mm월dd일",
						dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
						monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
						showMonthAfterYear : true,
					});

		
			$("#myCarousel").on("slide.bs.carousel", function(e) {
						var $e = $(e.relatedTarget);
						var idx = $e.index();
						var itemsPerSlide = 3;
						var totalItems = $(".carousel-item").length;

						if (idx >= totalItems - (itemsPerSlide - 1)) {
							var it = itemsPerSlide - (totalItems - idx);
							for (var i = 0; i < it; i++) {
								// append slides to end
								if (e.direction == "left") {
									$(".carousel-item").eq(i).appendTo(".carousel-inner");
								} else { 
									$(".carousel-item").eq(0).appendTo($(this).find(".carousel-inner"));
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

			$("#search_btn").click(function() {
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
					param += "&srchTraOrganNm="+ srchTraOrganNm;
				}

				if (srchTraProcessNm.trim().length > 0) {
					param += "&srchTraProcessNm="+ srchTraProcessNm;
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
				}).done(function(res) {
					$("#result").css("display", "block");
					// console.log(res.ar[0].trprId);

					var str = "<h1 class='my-5' style='font-weight: bold;'>검색 결과 (총 "+ res.rowTotal+ "건)</h1>";
					str += "<hr/>";
					str += "<div class='row'>";

					for (var i = 0; i < res.ar.length; i++) {
						str += "<div class='col-lg-4 col-md-6 col-sm-12 p-3'>";
						str += "<a style='color: black;' href='javascript: goView(\""+res.ar[i].trprId+"\", \""+res.ar[i].trprDegr+"\", \""+res.ar[i].traStartDate+"\", \""+res.ar[i].traEndDate
						+"\", \""+res.ar[i].trainstCstId+"\", \""+res.ar[i].trainTarget+"\", \""+res.ar[i].superViser+"\", \""+res.ar[i].yardMan+"\", \""+res.ar[i].regCourseMan+"\")'>";
						str += "<div class='card h-100'>";
						str += "<h5 class='card-title' style='text-align: center; color: white; background-color: rgba(0, 0, 255, 0.5); border-radius: 10px; width: 100%; margin: 10px auto;'>"
								+ res.ar[i].subTitle
								+ "</h5>";
						str += "<div class='card-body'>";
						str += "<h4 class='card-title' style='text-align: center; height: 90px; vertical-align: middle; color: #007bff'>"
								+ res.ar[i].title
								+ "</h4>";
						str += "<p class='card-text' style='text-align: center;'>";
						str += "<span style='font-weight: bold; color: rgba(250, 0, 0, 0.7);'>총 훈련비</span>&nbsp;";
						str += numberWithCommas(res.ar[i].courseMan)+"원&nbsp;";

						if (res.ar[i].regCourseMan < res.ar[i].yardMan) {
							str += "<span style='border-radius: 10px; background-color: rgba(0, 150, 60, 0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;'>모집중</span>";
						} else {
							str += "<span style='border-radius: 10px; background-color: rgba(150, 0, 60, 0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;'>모집마감</span>";
						}

						str += "</p>";
						str += "<hr/>";
						str += "<p class='card-text' style='text-align: center;'>훈련기간<br/>"
								+ res.ar[i].traStartDate
								+ "&nbsp;~&nbsp;"
								+ res.ar[i].traEndDate
								+ "</p>";
						str += "</div>";
						str += "</div>";
						str += "</a>";
						str += "</div>";
					}
					str += "</div>";
					str += "<div class='pagination-wrap'>";
					str += res.pageCode;
					str += "</div>";
					// console.log(str);
					$("#result").html(str);
					$( 'html, body' ).stop().animate( { scrollTop : '+=1000' } )
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

			$.ajax({
				url : "search.inc",
				type : "post",
				data : data,
				dataType : "json"
			}).done(function(res) {
				$("#result").css("display", "block");
				// console.log(res.ar[0].trprId);

				var str = "<h1 class='my-5' style='font-weight: bold;'>검색 결과 (총 "
						+ res.rowTotal + "건)</h1>";
				str += "<hr/>";
				str += "<div class='row'>";

				for (var i = 0; i < res.ar.length; i++) {
					str += "<div class='col-lg-4 col-md-6 col-sm-12 p-3'>";
					str += "<a style='color: black;' href='javascript: goView(\""+res.ar[i].trprId+"\", \""+res.ar[i].trprDegr+"\", \""+res.ar[i].traStartDate+"\", \""+res.ar[i].traEndDate
							+"\", \""+res.ar[i].trainstCstId+"\", \""+res.ar[i].trainTarget+"\", \""+res.ar[i].superViser+"\", \""+res.ar[i].yardMan+"\", \""+res.ar[i].regCourseMan+"\")'>";
					str += "<div class='card h-100'>";
					str += "<h5 class='card-title' style='text-align: center; color: white; background-color: rgba(0, 0, 255, 0.5); border-radius: 10px; width: 100%; margin: 10px auto;'>"
							+ res.ar[i].subTitle + "</h5>";
					str += "<div class='card-body'>";
					str += "<h4 class='card-title' style='text-align: center; height: 90px; vertical-align: middle; color: #007bff'>"
							+ res.ar[i].title + "</h4>";
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
							+ "&nbsp;~&nbsp;"
							+ res.ar[i].traEndDate + "</p>";
					str += "</div>";
					str += "</div>";
					str += "</a>";
					str += "</div>";
				}
				str += "</div>";
				str += "<div class='pagination-wrap'>";
				str += res.pageCode;
				str += "</div>";
				//console.log(str);
				$("#result").html(str);

			}).fail(function(err) {
				console.log(err);
			});
		}

		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		function goView(trprId, trprDegr, traStartDate, traEndDate, trainstCstId, trainTarget, superViser, yardMan, regCourseMan) {
			document.viewFrm.srchTrprId.value = trprId;
			document.viewFrm.srchTrprDegr.value = trprDegr;
			document.viewFrm.traStartDate.value = traStartDate;
			document.viewFrm.traEndDate.value = traEndDate;
			document.viewFrm.trainstCstId.value = trainstCstId;
			document.viewFrm.trainTarget.value = trainTarget;
			document.viewFrm.superViser.value = superViser;
			document.viewFrm.yardMan.value = yardMan;
			document.viewFrm.regCourseMan.value = regCourseMan;
			
			document.viewFrm.submit();
		}
	</script>

</body>
</html>