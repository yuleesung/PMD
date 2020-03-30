<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
	<!--Made with love by Mutiullah Samim -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	   
	<!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	
	<!--Custom styles-->
	<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
	<%-- <form action="">
		<input type="text" id="id" name="id" placeholder="아이디"/><br/>
		<input type="password" id="pw" name="pw" placeholder="비밀번호"/><br/>
		<a href="${url }">
			<img alt="네이버" src="resources/images/naver.PNG" >
		</a>
	</form> --%>
	
	<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><a href="${url }"><img alt="naver" src="resources/images/naverLogin.PNG"/></a></span>
				</div>
			</div>
			<div class="card-body">
				<form action="login.inc" name="loginForm" method="post"> <!-- 액션추가 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" placeholder="username" id="id" name="u_id">				
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" placeholder="password" id="pw" name="u_pw">
					</div>				
					<div class="form-group">
						<input type="button" value="Login" class="btn float-right login_btn" id="login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Don't have an account?<a href="#">Sign Up</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="forgot.inc">Forgot your password?</a>
				</div>		
			</div>
			<div class="card-footer" style="text-align: center;">
					<a href="main.inc">Back to main page</a>
				</div>
		</div>
	</div>
</div>
	
	<!-- 스크립트 영역 -->
	<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			if('${loginFail}' == 'fail')
				alert("아이디나 비밀번호가 틀렸습니다");
		});
	
		$(function(){		
			$("#login_btn").click(function(){
				var id = $("#id").val();
				var pw = $("#pw").val();
				
				if(id.trim().length < 1){
					alert("아이디 미입력");
					return;
				}
				if(pw.trim().length < 1){
					alert("패스워드 미입력");
					return;
				}
				
				document.loginForm.submit();
			});
		});
	</script>
</body>
</html>