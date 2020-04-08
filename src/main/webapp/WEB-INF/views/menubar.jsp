<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="1048979766914-cjmet6566e6qmc0tnc1tv8jm9doenhk2.apps.googleusercontent.com">
<style type="text/css">
#logo a {
    text-decoration: none;
    color: rgba(255,255,255,1);
    font-size: 1.2em;
    font-family: Cuprum; 
}
</style>
</head>
<body>
<div style="background: #6a99cb;" class="container">
	<div id="header">
		<div id="sign"
			style="float: right; margin: .2rem .8rem; position: absolute; top: 2px; right: 5px;">
			<c:choose>
				<c:when test="${userInfo != null}">
					<span style="color: rgba(189,204,86, 1)">${userInfo.nickname }님 환영합니다.</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="mypage.inc" title="내정보"
						style="color: rgba(255, 255, 255, 0.80); font-size: 13px;">내정보</a>&nbsp;&nbsp;
					<a href="javascript: logout('${sessionScope.userInfo.sns_type }')" title="로그아웃"
						style="color: rgba(255, 255, 255, 0.80); font-size: 13px;">로그아웃</a>			
				</c:when>
				<c:otherwise>
					<a href="login.inc" title="로그인"
						style="color: rgba(255, 255, 255, 0.80); font-size: 13px;">로그인</a>&nbsp;&nbsp;
					<a href="join.inc" title="회원가입"
						style="color: rgba(255, 255, 255, 0.80); font-size: 13px;">회원가입</a>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="logo">
			<h1 class="home">
				<a href="main.inc">P M D</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="chart.inc">지역별 과정현황</a></li>
				<li><a href="list.inc?b_category=free">자유게시판</a></li>
				<li><a href="list.inc?b_category=qa">Q&A</a></li>
				<li><a href="list.inc?b_category=adv">광고문의</a></li>
			</ul>

		</div>
	</div>
</div>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script>

	function init() {
	  gapi.load('auth2', function() {
	    /* Ready. Make a call to gapi.auth2.init or some other API */
		  gapi.auth2.init();
	  });
	}
	function logout(sns_type) {
		// 카카오 인증키 등록
	    Kakao.init('5899acc3cddfce334c3dd49beff92a37');
		
		if(sns_type == "kakao"){ // 카카오 로그인을 했을 때
			kakaoLogout();
		}else if(sns_type == "google"){
			signOut();
		}else{ //
			location.href = "logout.inc";
		}
		
	}
	
	function kakaoLogout() {
	    if (!Kakao.Auth.getAccessToken()) {
	      alert('카카오 로그인이 되어있지 않습니다.')
	      return
	    }
	    Kakao.Auth.logout(function() {
	      location.href = "logout.inc";
	    })
	  }
	
	function signOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	    	location.href = "logout.inc";
	    });
	    
	    auth2.disconnect();
	  }
</script>
</body>
</html>