<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>

<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="http://fonts.googleapis.com/css?family=Didact+Gothic"
	rel="stylesheet">
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css"
	media="all">
<link href="resources/css/default.css" rel="stylesheet" type="text/css"
	media="all">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="resources/css/mypage.css">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="menubar.jsp" />

	<div class="container content">
		<div class="row profile" style="width: 1600px;">
			<div class="col-md-3">
				<div class="profile-sidebar position-fixed" style="position: absolute!important;">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img
							src="https://media.rockstargames.com/chinatownwars/global/downloads/avatars/zhou_256x256.jpg"
							class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">${userInfo.nickname }</div>

						<div class="profile-usertitle-job">${userInfo.email }</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->
					<!-- <div class="profile-userbuttons">
						<button type="button" class="btn btn-success btn-sm">Follow</button>
						<button type="button" class="btn btn-danger btn-sm">Message</button>
					</div> -->
					<!-- END SIDEBAR BUTTONS -->
					<!-- SIDEBAR MENU -->
					<div class="profile-usermenu sidebar-sticky"
						style="margin-top: 100px;">
						<ul class="nav flex-column">
							<li class="active nav-item"><a class="nav-link active"
								href="javascript:changePage('0')"><i
									class="fa fa-address-card"></i> 상세 페이지 </a></li>
							<li class="nav-item"><a class="nav-link"
								href="javascript:changePage('1')"><i class="fa fa-edit"></i>
									수정 페이지 </a></li>
							<li class="nav-item"><a class="nav-link"
								href="javascript:changePage('2')"><i class="fa fa-trash"></i>
									탈퇴 페이지 </a></li>
							<li class="nav-item"><a class="nav-link" href="#"><i
									class="fa fa-flag"></i> Help (예비메뉴) </a></li>
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>
			<div>
				<div class="profile-content" id="profile-content"></div>
			</div>
		</div>
	</div>


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
						<li class="d-block"><span class="d-block">Address:</span> <span
							class="text-white">34 Street Name, City Name Here, United
								States</span></li>
						<li class="d-block"><span class="d-block">Telephone:</span><span
							class="text-white">+1 242 4942 290</span></li>
						<li class="d-block"><span class="d-block">Email:</span><span
							class="text-white">info@yourdomain.com</span></li>
					</ul>
				</div>

			</div>
			<div class="row">
				<div class="col-12 text-md-left text-left">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						<br> Demo Images Unsplash
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- END footer -->

	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#profile-content").load("/drm/mypage_menu.inc?menu=0"); // 맨 처음에 내정보가 표시
		});

		function changePage(menu) {// 선택한 메뉴별 jsp호출
			$("#profile-content").load("/drm/mypage_menu.inc?menu=" + menu);
		}
	
		$('li').click(function() { // 선택한 메뉴 css적용
			 $('li').removeClass('active');
			 $(this).addClass('active');
		});

	</script>
</body>
</html>