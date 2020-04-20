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

#sub_btn {
	width: 150px; 
	height: 50px; 
	font-size: 16px;
	font-weight: inherit;
	border-radius: 15px; 
	background-color: #6a99cb; 
	color: white;
}

#sub_btn:hover {
	background-color: green;
	color: white;
}
</style>
</head>
<body>
	<div class="col-md-9 order-content">
		<div class="form_main">
			<h2 class="heading">
				<strong>Edit </strong> Page <span></span>
			</h2>
			<br />
			<c:choose>
				<c:when test="${userInfo.u_id ne null }">
					<c:if test="${userInfo.status ne '9' }">
						<div class="form">
							<form action="mypage_edit.inc" method="post" id="editFrm"
								name="editFrm">
								<input type="text" placeholder="이름" value="${userInfo.u_name }" name="u_name" id="u_name" class="txt"><br />
								<input type="text" placeholder="이메일" value="${userInfo.email }" name="email" id="email" class="txt"><br /> 
								<input type="text" placeholder="연락처" value="${userInfo.u_phone }" name="u_phone" id="u_phone" class="txt"><br /> 
								<input type="text" placeholder="닉네임" value="${userInfo.nickname }" name="nickname" id="nickname" class="txt"><br />
								<input type="password" placeholder="이전 비밀번호" name="pre_pw" id="pre_pw" class="txt"/><br/>
								<input type="password" placeholder="비밀번호 변경 (4글자 이상 입력하세요)" name="u_pw" id="u_pw" class="txt"><br/>
								<input type="password" placeholder="비밀번호 변경 확인 (4글자 이상 입력하세요)" name="u_pw_con" id="u_pw_con" class="txt"><br/>
								<span id="pwChk"></span>
								<br/><br/><br/>
								<button type="button" class="btn btn-default" id="sub_btn">회원정보 수정</button>
							</form>
						</div>
					</c:if>
					<c:if test="${userInfo.status eq '9' }">
						<div class="form">
							<form action="mypage_edit.inc" method="post" id="editFrm"
								name="editFrm">
								<input type="password" placeholder="이전 비밀번호" name="pre_pw" id="pre_pw" class="txt"/><br/>
								<input type="password" placeholder="비밀번호 변경 (4글자 이상 입력하세요)" name="u_pw" id="u_pw" class="txt"><br/>
								<input type="password" placeholder="비밀번호 변경 확인 (4글자 이상 입력하세요)" name="u_pw_con" id="u_pw_con" class="txt"><br/>
								<span id="pwChk"></span>
								<br/><br/><br/>
								<button type="button" class="btn btn-default" id="sub_btn">회원정보 수정</button>
							</form>
						</div>
					</c:if>
				</c:when>
				
				<c:otherwise>
					<div class="form">
						<p style="color: black;">이 계정은 SNS으로 연동되었습니다.</p>
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
				var u_pw_con = $("#u_pw_con").val();

				if (u_pw.trim().length < 3) {
					alert("비밀번호 변경란을 4자 이상 입력하세요!");
					$("#u_pw").focus();
					return;
				}
				
				if(u_pw_con.trim().length < 3){
					alert("비밀번호 변경 확인란을 4자 이상 입력하세요!");
					$("#u_pw_con").focus();
					return;
				}
				
				if(u_pw.trim() != u_pw_con.trim()){
					alert("비밀번호 변경과 확인란이 같지 않습니다!");
					return;
				}
			
			
				var pre_pw = $("#pre_pw").val();
				
				$.ajax({
					url: "checkPrePw.inc",
					type: "post",
					data: "pre_pw="+encodeURIComponent(pre_pw),
					dataType: "json"
				}).done(function(data){
					if(data.chk){
						document.editFrm.submit();
					}else{
						alert("이전 비밀번호가 다릅니다!");
						$("#pre_pw").focus();
					}
				}).fail(function(err){
					console.log(err);
				});
			
			});
			
			$("#u_pw_con,#u_pw").keyup(function(){
				var u_pw = $("#u_pw").val();
				var u_pw_con = $("#u_pw_con").val();
				
				if(u_pw.trim() != u_pw_con.trim() && u_pw_con.trim().length > 3){
					$("#pwChk").css("color", "red");
					$("#pwChk").css("fontWeight", "bold");
					$("#pwChk").html("비밀번호 변경과 확인이 서로 다릅니다!");
				}else if(u_pw.trim() == u_pw_con.trim()){
					$("#pwChk").css("color", "blue");
					$("#pwChk").css("fontWeight", "bold");
					$("#pwChk").html("비밀번호 변경과 확인이 같습니다.")
				}
			});
		});
	</script>
</body>
</html>