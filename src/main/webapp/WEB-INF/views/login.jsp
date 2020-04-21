<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<!--Made with love by Mutiullah Samim -->
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<!--Bootsrap 4 CDN-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!--Custom styles-->
<link rel="stylesheet" href="resources/css/login.css">

<!-- 구글 로그인 용 -->
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="resources/css/google.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">


</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>Sign In</h3>
					<div class="d-flex justify-content-end social_icon">
						<span><a href="${url }"><img alt="naver"
								src="resources/images/naverLogin.PNG" /></a></span> <span><a
							href="javascript: loginWithKakao()"><img alt="kakao"
								src="resources/images/kakao_login_btn.png" /></a></span> <span> <a>
								<div id="customBtn" class="customGPlusSignIn"
									style="margin-top: 23px;">
									<img alt="구글" src="resources/images/google.png">
								</div>
						</a>
						</span>
					</div>
				</div>
				<div class="card-body">
					<form action="loginGo.inc" name="loginForm" method="post">
						<!-- 액션추가 -->
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="아이디" id="id"
								name="u_id" onkeypress="enterkey(this.form)">
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="비밀번호"
								id="pw" name="u_pw" onkeypress="enterkey(this.form)">
						</div>
						<div class="form-group">
							<input type="button" value="로그인"
								class="btn float-right login_btn" id="login_btn">
						</div>
					</form>
				</div>
				<div class="card-footer"
					style="text-align: center; border-top: 2px dotted gray;">
					<input type="button" value="회원가입" class="btn float-left login_btn"
						onclick="location.href='join.inc?active=${active}'" style="margin-left: 40px;">
					<input type="button" value="메인으로" class="btn float-right login_btn"
						onclick="location.href='main.inc'" style="margin-right: 30px;">
				</div>
				<div class="card-footer" style="text-align: center; border-top: 0;">
					<a href="javascript:dialog();"><span>관리자 로그인</span></a>
				</div>
			</div>
		</div>
	</div>

	<div id="adminFrm" title="관리자 로그인">
		<form name="adFrm" method="post" action="">
			<!-- 관리자 로그인 액션추가 -->
			<fieldset>
				<input type="text" class="form-control" placeholder="아이디" id="ad_id"
					name="ad_id" onkeypress="enterkey(this.form)"> <br /> <input
					type="password" class="form-control" placeholder="비밀번호" id="ad_pw"
					name="ad_pw" onkeypress="enterkey(this.form)"> <br /> <input
					type="button" value="로그인" class="btn float-right login_btn"
					id="ad_btn">
			</fieldset>
		</form>
	</div>

	<div>
		<form method="post" name="socialFrm">
			<input type="hidden" name="sns_id" /> <input type="hidden"
				name="nickname" /> <input type="hidden" name="email" />
		</form>
	</div>

	<input type="hidden" id="loginAct" value="${param.loginAct }" />

	<jsp:include page="footer.jsp" />
	
	
	<%-- <input type="hidden" name="stop_u" id="stop_u" value="${status}" /> --%>

	<!-- 스크립트 영역 -->
	<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->

	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

	<!-- 구글 로그인용 -->
	<script src="https://apis.google.com/js/api:client.js"></script>

	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

	<script type="text/javascript">
		// 카카오 인증키 등록
		Kakao.init('5899acc3cddfce334c3dd49beff92a37');

		// SDK 초기화 여부를 판단합니다. true면 정상등록
		// console.log(Kakao.isInitialized());
		function loginWithKakao() {
			Kakao.Auth.login({
				success : function(authObj) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(res) {
							// alert(JSON.stringify(res))
							// console.log(JSON.stringify(res))
							sendData(res)
						},
						fail : function(error) {
							alert('login success, but failed to request user information: '+ JSON.stringify(error))
						},
					})
				},
				fail : function(err) {
					alert(JSON.stringify(err))
				},
			})
		}

		function dialog() { // 관리자 로그인 다이얼로그
			$("#adminFrm").dialog("open");
		}

		$(function() {
			startApp(); // 구글 로그인 함수

			$("#login_btn").click(function() { /* 로그인 버튼클릭 시 */
				login_submit(); // 기능호출
			});

			$("#adminFrm").dialog({ // 다이얼로그 세팅
				autoOpen : false, //자동으로 열리지않게
				position : [ "center" ], //x,y  값을 지정
				//"center", "left", "right", "top", "bottom"
				modal : true, //모달대화상자
				resizable : false, //크기 조절 못하게
			});

			$("#ad_btn").click(function() { // 관리자 로그인 제출
				var id = $("#ad_id").val();
				var pw = $("#ad_pw").val();

				$.ajax({
					url:"adminLogin.inc",
					type:"post",
					dataType:"json",
					data:"u_id=" + encodeURIComponent(id) + "&u_pw="+ encodeURIComponent(pw)
				}).done(function(data){
					if(data.chk){
						location.href = "admin.inc";
					} else{
						alert("관리자 로그인실패");
					}
				}).fail(function(err){
					console.log(err);
				});
			});
		});

		function enterkey(frm) { /* 엔터버튼 눌렀을 때 진입 */
			if (window.event.keyCode == 13) {
				login_submit(); // 기능호출
			}
		}

		function login_submit() { // 로그인 이벤트 실행
			var id = $("#id").val();
			var pw = $("#pw").val();

			if (id.trim().length < 1) {
				alert("아이디 미입력");
				return;
			}
			if (pw.trim().length < 1) {
				alert("패스워드 미입력");
				return;
			}

			$.ajax({
				url : "loginGo.inc",
				type : "post",
				dataType : "json",
				data : "u_id="+encodeURIComponent(id)+"&u_pw="+encodeURIComponent(pw)
			}).done(function(data){
				if (data.chk == "success") {
					location.href = data.path;
				} else if(data.chk == "stopOrLeave"){
					alert("탈퇴 또는 관리자에 의해 정지된 계정입니다");
				} else if(data.chk == "fail"){
					alert("아이디 또는 비밀번호가 다릅니다!");
				}
						
			}).fail(function(err){
				console.log(err);
			});

		}

		function sendData(res) {
			var id = res["id"];
			var kakao_account = res["kakao_account"];
			var profile = kakao_account["profile"];
			var nickname = profile["nickname"];
			var email = kakao_account["email"];

			document.socialFrm.action = "kakaoLogin.inc";
			document.socialFrm.sns_id.value = id;
			document.socialFrm.nickname.value = nickname;

			if (email != undefined) {
				document.socialFrm.email.value = email;
			}

			document.socialFrm.submit();
		}

		var googleUser = {};
		var startApp = function() {
			gapi.load('auth2',function() {
				// Retrieve the singleton for the GoogleAuth library and set up the client.
				auth2 = gapi.auth2.init({
					client_id : '1048979766914-cjmet6566e6qmc0tnc1tv8jm9doenhk2.apps.googleusercontent.com',
					cookiepolicy : 'single_host_origin',
					// Request scopes in addition to 'profile' and 'email'
					//scope: 'additional_scope'
				});
				attachSignin(document.getElementById('customBtn'));
			});
		};

		function attachSignin(element) {
			// console.log(element.id);
			auth2.attachClickHandler(element, {}, function(googleUser) {
				// Useful data for your client-side scripts:
				var profile = googleUser.getBasicProfile();

				var id = profile.getId(); // Don't send this directly to your server!
				var name = profile.getName();
				var email = profile.getEmail();

				document.socialFrm.action = "googleLogin.inc";
				document.socialFrm.sns_id.value = id;
				document.socialFrm.nickname.value = name;
				document.socialFrm.email.value = email;

				document.socialFrm.submit();
			});
		}
		
	</script>
</body>
</html>