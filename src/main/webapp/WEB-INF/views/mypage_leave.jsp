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
						<form action="mypage_leave.inc" method="post" id="leaveFrm" name="leaveFrm">
							<input type="password" placeholder="Input Your Pwd" name="u_pw"
								id="u_pw" class="txt" style="width: 400px;">
							<button type="button" class="btn btn-default" onclick="leave('${sessionScope.userInfo.u_idx}')"
								style="margin-left: 20px;">Leave Now</button>
						</form>
					</div>
				</c:when>
				<c:otherwise>
				<c:if test="${sessionScope.userInfo.sns_type ne 'google' }">
					<div class="form">
						<button type="button" class="btn btn-default" onclick="discon('${sessionScope.userInfo.sns_type}')" 
						style="width: 150px; height: 50px; font-size: 16px;">연동해제</button>
					</div>
				</c:if>
				<c:if test="${sessionScope.userInfo.sns_type eq 'google' }">
					<div class="form">
						<p>Google에서 직접 연동해제 하시길 바랍니다.</p>
					</div>
				</c:if>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		// 카카오 인증키 등록
	    Kakao.init('5899acc3cddfce334c3dd49beff92a37');
		
		function leave(u_idx) { // 일반회원 탈퇴
			var u_pw = $("#u_pw").val();
			var param = "u_idx="+encodeURIComponent(u_idx)+"&u_pw="+encodeURIComponent(u_pw);
			
			var con = confirm("정말 탈퇴하시겠습니까?");
			
			if(con){
				$.ajax({
					url: "mypage_leave.inc",
					type: "post",
					data: param,
					dataType: "json"
				}).done(function(data){
					if(data.chk){
						alert("성공적으로 탈퇴하였습니다!");
						location.href = "main.inc";
					}else{
						alert("비밀번호가 다릅니다!");
					}
				}).fail(function(err){
					console.log(err);
				});
			}
		}
		
		function discon(sns_type) { // 소셜연동 탈퇴
			var con = confirm("연동을 해제하시겠습니까?");
			
			if(con){
				if(sns_type == "kakao"){ // 카카오 로그인 탈퇴
					unlinkApp();
				}else{
					alert("연동이 해제되었습니다");
					location.href = "naverLeave.inc";
				}
			}
		}
		
		function unlinkApp() {
		    Kakao.API.request({
		      url: '/v1/user/unlink',
		      success: function(res) {
		        var id = res["id"];
		        ajax_k(id);
		      },
		      fail: function(err) {
		        alert("카카오 연동해제를 실패하였습니다!")
		      },
		    })
		  }
		
		function ajax_k(id) {
			$.ajax({
	        	url: "disconnectKakao.inc",
	        	type: "post",
	        	data: "sns_id="+encodeURIComponent(id),
	        	dataType: "json"
	        }).done(function(data){
	        	if(data.chk){
	        		alert("카카오 연동이 해제되었습니다!");
	        		location.href = "main.inc";
	        	}else{
	        		alert("카카오 연동해제를 실패하였습니다!");
	        	}
	        }).fail(function(err){
	        	console.log(err);
	        });
		}
	</script>
</body>
</html>