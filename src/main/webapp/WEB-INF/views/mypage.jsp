<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link rel="stylesheet" href="resources/css/mypage.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="menubar.jsp" />

	<div class="container content">
		<div class="row profile" style="width: 1600px;">
			<div class="col-md-3">
				<div class="profile-sidebar position-fixed">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img
							src="https://media.rockstargames.com/chinatownwars/global/downloads/avatars/zhou_256x256.jpg"
							class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">${userInfo.u_name }</div>
						<c:choose>
							<c:when test="${userInfo.sns_id ne null }">
								<div class="profile-usertitle-job">( ${userInfo.sns_id } )</div>
							</c:when>
							<c:otherwise>
								<div class="profile-usertitle-job">( ${userInfo.u_id } )</div>
							</c:otherwise>
						</c:choose>
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
									class="fa fa-flag"></i> Help </a></li>
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>
			<div class="col-md-9">
				<div class="profile-content" id="profile-content"></div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-9 ft">
				<footer class="footer">
					<div class="row">
						<div class="col-md-4">
							<span class="copyright">Copyright &copy; Your Website 2018</span>
						</div>
						<div class="col-md-4">
							<ul class="list-inline social-buttons">
								<li class="list-inline-item"><a
									href="https://github.com/ELMORABITYounes"> <i
										class="fa fa-github"></i>
								</a></li>
								<li class="list-inline-item"><a
									href="https://www.facebook.com/younes.elmorabit.92"> <i
										class="fa fa-facebook"></i>
								</a></li>
								<li class="list-inline-item"><a
									href="https://www.linkedin.com/in/younes-elmorabit-2a162310b/">
										<i class="fa fa-linkedin"></i>
								</a></li>
							</ul>
						</div>

					</div>
				</footer>
			</div>
		</div>
	</div>
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