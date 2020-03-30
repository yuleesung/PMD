<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.form_main {
	width: 100%;
}

.form_main h4 {
	font-family: roboto;
	font-size: 20px;
	font-weight: 300;
	margin-bottom: 15px;
	margin-top: 20px;
	text-transform: uppercase;
}

.heading {
	border-bottom: 1px solid #A9A59F;
	padding-bottom: 9px;
	position: relative;
}

.heading span {
	background: #6D6C6A none repeat scroll 0 0;
	bottom: -2px;
	height: 3px;
	left: 0;
	position: absolute;
	width: 75px;
}

.form {
	border-radius: 7px;
	padding: 6px;
}

.txt[type="text"] {
	border: 1px solid #ccc;
	margin: 5px 0;
	padding: 4px 0 4px 5px;
	border-radius: 5px;
	width: 80%;
}

.txt[type="password"] {
	border: 1px solid #ccc;
	margin: 5px 0;
	padding: 4px 0 4px 5px;
	border-radius: 5px;
	width: 80%;
}

.txt2:hover {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	color: #949390;
	transition: all 0.5s ease 0s;
}

.order-content {
	padding: 20px;
	min-height: 460px;
	width: 800px;
}
</style>
</head>
<body>
	<div class="col-md-9 order-content">
		<div class="form_main">
			<h2 class="heading">
				<strong>Leave </strong> Page <span></span>
			</h2>
			<br />
			<c:choose>
				<c:when test="${userInfo.u_id ne null }">
					<div class="form">
						<form action="mypage_leave.inc" method="post" id="leaveFrm"
							name="editFrm">
							<input type="password" placeholder="Input Your Pwd" name="u_pw"
								id="u_pw" class="txt" style="width: 400px;">
							<button type="button" class="btn btn-default" id="sub_btn"
								style="margin-left: 20px;">Leave Now</button>
							<input type="hidden" id="ss_pw" value="${userInfo.u_pw }" />
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="form">
						<button type="button" class="btn btn-default" id="sub_btn2" 
						style="width: 150px; height: 50px; font-size: 16px;">연동해제</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#sub_btn").click(function() {
				var u_pw = $("#u_pw").val();
				var ss_pw = $("#ss_pw").val();

				if (u_pw == ss_pw) {
					alert("삭제");
				} else {
					alert("실패");
				}
			});
			
			$("#sub_btn2").click(function(){
				var con = confirm("연동을 해제하시겠습니까?");
				
				if(con){
					alert("연동이 해제되었습니다");
					location.href = "naverLeave.inc";
				}
			});
		});
	</script>
</body>
</html>