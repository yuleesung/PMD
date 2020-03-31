<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시물 보기</title>
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
	
	<!-- 페이징 css적용 -->
	<link rel="stylesheet" href="resources/css/text.css"/>
    <!-- Theme Style -->
    <link rel="stylesheet" href="resources/css/style.css">
    
    <style type="text/css">
    	#t1{
    		width: 100%;
    		border-collapse: collapse;
    		font-size: 18px;
    		color: #000;
    	}
    	
    	#t1 caption{
    		text-indent: -9999px;
    		height: 0;
    	}
    	
    	#t1 th, #t1 td{
    		border: 1px solid #ccc;
    		padding: 20px;
    		color: black;
    	}
    	
    	#t1 tbody td a{
    		color: black;
    	}
		
		#t1 thead tr, #t1 thead td{
			border: none;
		}
		
		#t1 th{
			background-color: #d6ecfa;
			text-align: center;
		}
    </style>
  </head>
  <body>
    
    <jsp:include page="menubar.jsp"/>
    
    <section class="home-slider owl-carousel">
      
      <div class="slider-item" style="background-image: url('resources/images/mario.gif'); background-size: 30%;">
        <div class="container">
          <div class="row slider-text align-items-center justify-content-center">
            <div class="col-md-8 text-center col-sm-12 element-animate">
              <h1 style="font-family: inherit;"></h1>
              <p class="mb-5"></p>
            </div>
          </div>
        </div>
      </div>

    </section>
    
    <section class="section element-animate">
      <div class="container">

        <div class="row">
          <div class="col-md-12">
	          <div>
		          <table id="t1">
		          	<caption>게시물 보기</caption>
		          	<colgroup>
		          		<col width="200px"/>
		          		<col width="*"/>
		          		<col width="200px"/>
		          		<col width="300px"/>
		          	</colgroup>
		          	<thead>
		          		<tr>
		          			<td colspan="4" style="text-align: right;">
		          				<c:if test="${vo.uvo.u_idx eq sessionScope.userInfo.u_idx }">
			          				<input type="button" class="btn btn-primary" value="수정"  style="font-size: 15px;" onclick="javascript: location.href='updateBoard.inc?b_idx=${vo.b_idx}&b_category=${b_category }&nowPage=${nowPage }'"/>
			          				<input type="button" class="btn btn-danger" value="삭제"  style="font-size: 15px;" onclick="javascript: location.href='delBoard.inc?b_idx=${vo.b_idx}&b_category=${b_category }&nowPage=${nowPage }'"/>
		          				</c:if>
		          				<input type="button" class="btn btn-primary" value="목록" style="font-size: 15px;" onclick="javascript: location.href='list.inc?nowPage=${nowPage}&b_category=${b_category }'"/>
		          			</td>
		          		</tr>
		          	</thead>
		          	<tbody>
		          		<c:if test="${vo ne null }">
			          		<tr>
			          			<th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
			          			<td colspan="3">${vo.subject }</td>
			          		</tr>
			          		<tr>
			          			<th>파일 이름</th>
			          			<c:if test="${vo.file_name ne null }">
			          				<td>${vo.file_name }</td>
			          			</c:if>
			          			<c:if test="${vo.file_name eq null }">
			          				<td></td>
			          			</c:if>
			          			<th>날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
			          			<td>${vo.write_date }</td>
			          		</tr>
			          		<tr>
			          			<th colspan="4">내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
			          		</tr>
			          		<tr>
			          			<td colspan="4" style="height: 600px; white-space: pre-line; overflow-y: scroll;">${vo.b_content }</td>
			          		</tr>
		          		</c:if>
		          		<c:if test="${vo eq null }">
		          			<tr>
		          				<td colspan="4" style="height: 300px;">내용이 없습니다.</td>
		          			</tr>
		          		</c:if>
		          	</tbody>
		          	
		          </table>
	        </div>
          </div>

        </div>

        
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
    

    <script>
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
    </script>
  </body>
</html>