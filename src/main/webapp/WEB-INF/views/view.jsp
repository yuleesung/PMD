<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>과정 검색</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800|Playfair+Display:,300, 400, 700" rel="stylesheet">
	
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/animate.css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">
    <link rel="stylesheet" href="resources/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="resources/fonts/fontawesome/css/font-awesome.min.css">

	<!-- 메뉴바 관련 추가 -->
	<link href="http://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet">
	<link href="resources/css/fonts.css" rel="stylesheet" type="text/css" media="all">
	<link href="resources/css/default.css" rel="stylesheet" type="text/css" media="all">
	
    <!-- Theme Style -->
    <link rel="stylesheet" href="resources/css/style.css">
  </head>
  <body>
    
    <jsp:include page="menubar.jsp"/>
    
    
    <!-- <header role="banner">
      <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
          <a class="navbar-brand absolute" href="main.inc"><span style="font-size: 30px; color: white;">PMD</span></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarsExample05">
            <ul class="navbar-nav mx-auto">
              <li class="nav-item">
                <a class="nav-link"></a>
              </li>
             </ul>
          </div>
        </div>
      </nav>
    </header> -->
    <!-- END header -->
    
    <section class="home-slider owl-carousel">
      
      <div class="slider-item" style="background-image: url('resources/images/mario.gif'); background-size: 30%;">
        <div class="container">
          <div class="row slider-text align-items-center justify-content-center">
            <div class="col-md-8 text-center col-sm-12 element-animate">
              <h1 style="font-family: inherit;">과정 검색 결과</h1>
              <p class="mb-5"></p>
            </div>
          </div>
        </div>
      </div>

    </section>
    <!-- END slider -->
    
    <!-- END section -->

    <section class="element-animate worship-time">
    	<div class="container">
	    	<div class="row" style="margin-top: 50px; padding-bottom:0px;">
		    	<div class="col-md-8" style="padding-bottom: 0px;  padding-top: 20px;">
		    		<h4 class="subtitle">${vo.inoNm }</h4>
			    	<h2 class="title" style="padding-bottom: 0px;">${vo.trprNm }</h2>
			    </div>
			    <div class="col-md-4">
			    	<button type="button" class="btn btn-danger ribbon" style="margin-bottom: 0; padding: 0;">
			    		<div id="getting-started" style="font-size:15px; color: white;"></div>
			    	</button>	
			    	<button type="button" class="btn btn-primary btn-block" style="margin-top: 0; border-radius: 0 0 10px 10px;" onclick="javascript: location.href='${vo.hpAddr}'">
			    		<h4 class="myBtn" >홈페이지</h4>
			    	</button>
		    	</div>
		    </div>
	      	<div class="half d-md-flex d-block">
	      		<div class="bg campmeeting">
		       		<div id="map"></div>
		       	</div>
		        <div id="view_table">
		          <a class="event-list-item first">
		            <span class="date center">담당자</span>
		            <p class="left">${vo.trprChap }</p>
		          </a>
		          <a class="event-list-item">
		            <span class="date center">연락처</span>
		            <p class="left">${vo.trprChapTel }</p>
		          </a>
		          <a class="event-list-item">
		            <span class="date center">이메일</span>
		            <p class="left">${vo.trprChapEmail }</p>
		          </a>
		          <a class="event-list-item">
		            <span class="date center">주소</span>
		            <p class="left">${vo.addr1 }, ${vo.addr2 }</p>
		          </a>
		        </div>
	       </div>
      </div>

    </section>
    
    <section class="section element-animate">
      <div class="container">

        <div class="row">
          <div class="col-md-12">
	          <div>
		          <h2 class="title">훈련과정 정보</h2>
		          <a class="event-list-item first">
		            <span class="date center">시작일</span>
		            <p class="p_left">${traStartDate }</p>
		          </a>
		          <a class="event-list-item">
		            <span class="date center">종료일</span>
		            <p class="p_left">${traEndDate }</p>
		          </a>
		          <a class="event-list-item">
		            <span class="date center">신청인원</span>
		            <p class="p_left">${param.regCourseMan} 명</p>
		          </a>
		          <a class="event-list-item">
		            <span class="date center">모집인원</span>
		            <p class="p_left">${param.yardMan } 명</p> 
		          </a>
		          <a class="event-list-item">
		            <span class="date center">모집률</span>
		            <p class="p_left">${percent} %</p>
		          </a>
		          <a class="event-list-item">
		            <span class="date center">훈련시간</span>
		            <p class="p_left">${vo.trDcnt }일, 총 ${vo.trtm }시간</p>
		          </a>
		          <a class="event-list-item">
		            <span class="date center">훈련비</span>
		            <p class="p_left"><fmt:formatNumber value="${vo.perTrco }" pattern="#,###" />원</p>
		          </a>
		          <a class="event-list-item">
		            <span class="date center">NCS직무분류</span>
		            <p class="p_left">${vo.ncsNm }(${vo.ncsCd })</p>
		          </a>
		          <a class="event-list-item">
		            <span class="date center">훈련유형</span>
		            <p class="p_left">${trainTarget }</p>
		          </a>
		          <a class="event-list-item">
		            <span class="date center">주관부처</span>
		            <p class="p_left">${superViser }</p>
		          </a>
	        </div>
          </div>

        </div>

        
      </div>
    </section>
    <!-- END section -->
    <section class="section element-animate">
	    <div class="container" style="margin-bottom: 50px;">
	    	<button type="button" class="btn btn-primary btn-block" onclick="detail('https://www.hrd.go.kr/hrdp/co/pcobo/PCOBO0100P.do?tracseId=${vo.trprId}&tracseTme=1&crseTracseSe=${vo.trprGbn }&trainstCstmrId=${ trainstCstId}')"><h4 class="myBtn">상세정보 더 보기</h4></button>
	    </div>
    </section>
    

    <footer class="site-footer" role="contentinfo">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-4 mb-5">
            <h3>PMD</h3>
            <p class="mb-5">People who Make a Dream.</p>
            <ul class="list-unstyled footer-link d-flex footer-social">
              <li><a href="#" class="p-2"><span class="fa fa-twitter"></span></a></li>
              <li><a href="#" class="p-2"><span class="fa fa-facebook"></span></a></li>
              <li><a href="#" class="p-2"><span class="fa fa-linkedin"></span></a></li>
              <li><a href="#" class="p-2"><span class="fa fa-instagram"></span></a></li>
            </ul>
          </div>
          <div class="col-md-4 mb-5">
            <h3>Visit or Talk to Us</h3>
            <ul class="list-unstyled footer-link">
              <li class="d-block">
                <span class="d-block">Address:</span>
                <span class="text-white">34 Street Name, City Name Here, United States</span></li>
              <li class="d-block"><span class="d-block">Telephone:</span><span class="text-white">+1 242 4942 290</span></li>
              <li class="d-block"><span class="d-block">Email:</span><span class="text-white">info@yourdomain.com</span></li>
            </ul>
          </div>
          
        </div>
        <div class="row">
          <div class="col-12 text-md-left text-left">
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --> <br> Demo Images Unsplash</p>
          </div>
        </div>
      </div>
    </footer>
    <!-- END footer -->

    <!-- loader -->
    <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/></svg></div>

    <script src="resources/js/jquery-3.2.1.min.js"></script>
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelement-and-player.min.js"></script>
    <script src="resources/js/jquery.waypoints.min.js"></script>
    <script src="resources/js/jquery.countdown.min.js"></script>
    <script src="resources/js/main.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5899acc3cddfce334c3dd49beff92a37&libraries=services,clusterer,drawing"></script>

    <script>
    	function detail(url) {
			console.log(url);
			 window.open(url, "상세보기", "width = 1022, height = 642, top = 100, left = 200, location = no");
		}
    
    
	    document.addEventListener('DOMContentLoaded', function() {
	              var mediaElements = document.querySelectorAll('video, audio'), total = mediaElements.length;
	
	              for (var i = 0; i < total; i++) {
	                  new MediaElementPlayer(mediaElements[i], {
	                      pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',
	                      shimScriptAccess: 'always',
	                      success: function () {
	                          var target = document.body.querySelectorAll('.player'), targetTotal = target.length;
	                          for (var j = 0; j < targetTotal; j++) {
	                              target[j].style.visibility = 'visible';
	                          }
	                }
	              });
	              }
	          });
	     
	     $("#getting-started")
	      .countdown("${traStartDate}", function(event) {
	        $(this).text(
	          event.strftime('D-day %D일 %H:%M:%S')
	        );
	     });
	
	     
	    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${vo.addr1}', function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;color:rgb(15,75,129);">${vo.inoNm}</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
    </script>
  </body>
</html>