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
	<div class="container content" style="padding: 0;">
		
		<div class="row profile">
			<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img
							src="https://media.rockstargames.com/chinatownwars/global/downloads/avatars/zhou_256x256.jpg"
							class="img-responsive" alt="">
					</div>

					<div class="profile-usertitle">
						<div class="profile-usertitle-name">${userInfo.nickname }</div>

						<div class="profile-usertitle-job">${userInfo.email }</div>
					</div>

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
				<div class="profile-content" id="profile-content" style="width: 700px;"></div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

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