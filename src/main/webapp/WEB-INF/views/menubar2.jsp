<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="1048979766914-cjmet6566e6qmc0tnc1tv8jm9doenhk2.apps.googleusercontent.com">
<style type="text/css">
#logo a {
	text-decoration: none;
	color: rgba(255, 255, 255, 1);
	font-size: 1.2em;
	font-family: Cuprum;
}
#menu_btn, #buttonMenu{
	display: none;
}

#menu a{
	font-size: 15px;
}
#buttonMenu ul li a{
	color: white;
}
#menu li a:hover{
	font-size: 1.2em;
	font-weight: bold;
	color: black;	
}

#menu>ul>li>a.menu_active{
	font-size: 1.2em;
	font-weight: bold;
	color: black;	
}

#sign a:hover{
	font-size: 14px;
	font-weight: bold;
	text-decoration: none;
}
#menu {
    width: 630px;
  }  
#menu>ul{
	width: 100%;
}
#menu>ul>li{
	height: 34px;
}
/* @media (min-width: 767px) {
  #menu {
    position: relative;
  }
} */
/* .fa-navicon:before, .fa-reorder:before, .fa-bars:before {
    content: "\f0c9";
} */
</style>
</head>
<body>
	<div style="background: #6a99cb;" class="container content">
		<div id="header" style="height: 105px;">
			<div id="sign"
				style="float: right; margin: .2rem .8rem; position: absolute; top: 2px; right: 5px;">
				<c:if test="${userInfo != null and userInfo.status eq 9 }"> 
					<a href="admin.inc" title="관리자페이지로" style="color: rgba(255, 255, 255, 0.80); font-size: 13px;">
						관리자 페이지
					</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				<c:choose>
					<c:when test="${userInfo != null}">
						<span
							style="color: rgba(189,204,86, 1); font-size: 16px; font-family: fantasy; font-weight: inherit;">${userInfo.nickname }님
							환영합니다.&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<a href="mypage.inc" title="내정보"
							style="color: rgba(255, 255, 255, 0.80); font-size: 13px;">내정보</a>&nbsp;&nbsp;
					<a href="javascript: logout('${sessionScope.userInfo.sns_type }', '${active }')"
							title="로그아웃"
							style="color: rgba(255, 255, 255, 0.80); font-size: 13px;">로그아웃</a>
					</c:when>
					<c:otherwise>
						<c:if test="${active ne null }">
							<a href="login.inc?active=${active }" title="로그인" style="color: rgba(255, 255, 255, 0.80); font-size: 13px;">로그인</a>&nbsp;&nbsp;
						</c:if>
						<c:if test="${active eq null }">
							<a href="login.inc" title="로그인" style="color: rgba(255, 255, 255, 0.80); font-size: 13px;">로그인</a>&nbsp;&nbsp;
						</c:if>
						<c:if test="${active ne null }">
							<a href="join.inc?active=${active }" title="회원가입" style="color: rgba(255, 255, 255, 0.80); font-size: 13px;">회원가입</a>
						</c:if>
						<c:if test="${active eq null }">
							<a href="join.inc" title="회원가입" style="color: rgba(255, 255, 255, 0.80); font-size: 13px;">회원가입</a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="logo">
				<h1 class="home">
					<a href="main.inc"><span
						style="font-family: cursive; font-size: 50px;">P M D</span></a>
				</h1>
			</div>
			<div id="menu">
				<ul>
					<c:if test="${active eq 'chart' }">
						<li><a href="chart.inc?active=chart" style="font-size: 19px;" class="menu_active">지역별 과정현황</a></li>
					</c:if>
					<c:if test="${active ne 'chart' }">
						<li><a href="chart.inc?active=chart" style="font-size: 19px;">지역별 과정현황</a></li>
					</c:if>

					<li><span style="line-height: 30px; padding: 0; font-size: 18px;">/</span></li>
					
					<c:if test="${active eq 'free' }">
						<li><a href="list.inc?b_category=free&active=free" style="font-size: 19px;" class="menu_active">자유게시판</a></li>
					</c:if>
					<c:if test="${active ne 'free' }">
						<li><a href="list.inc?b_category=free&active=free" style="font-size: 19px;">자유게시판</a></li>
					</c:if>
					
					<li><span style="line-height: 30px; padding: 0; font-size: 18px;">/</span></li>
					
					<c:if test="${active eq 'qa' }">
						<li><a href="list.inc?b_category=qa&active=qa" style="font-size: 19px;" class="menu_active">Q&A</a></li>
					</c:if>
					<c:if test="${active ne 'qa' }">
						<li><a href="list.inc?b_category=qa&active=qa" style="font-size: 19px;">Q&A</a></li>
					</c:if>
					
					<li><span style="line-height: 30px; padding: 0; font-size: 18px;">/</span></li>
					
					<c:if test="${active eq 'adv' }">
						<li><a href="list.inc?b_category=adv&active=adv" style="font-size: 19px;" class="menu_active">광고문의</a></li>
					</c:if>
					<c:if test="${active ne 'adv' }">
						<li><a href="list.inc?b_category=adv&active=adv" style="font-size: 19px;">광고문의</a></li>
					</c:if>
				</ul>
			</div>
			
			<button type="button" id="menu_btn" style="float: right; top: -20px; border: 1px solid white; border-radius: 5px; background-color: #6a99cb; width: 40px; height: 40px; margin: 20px 0px; padding: 1px 6px;">
				<img alt="menuBtn" style="width: 100%; height: 100%;" src="resources/images/menuIcon.png"/>
			</button>
			
			<div id="buttonMenu" style="background: #6a99cb; width: 100%; height: 164px; top: 50px; float: left; padding: 20px;">
				<ul>
					<li><a href="chart.inc">지역별 과정현황</a></li>
					<li><a href="list.inc?b_category=free">자유게시판</a></li>
					<li><a href="list.inc?b_category=qa">Q&A</a></li>
					<li><a href="list.inc?b_category=adv">광고문의</a></li>
				</ul>
			</div>
		</div>
	</div>

	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async
		defer></script>
	<script>

	$(function(){
		
		if($(window).width()< 991){
			$("#menu").css('display','none');
			$("#menu_btn").css('display','block');			
		}else{
			$("#menu").css('display','block');
			$("#menu_btn").css('display','none');
		}
		
		$(window).resize(function(){
			if($(window).width() < 991){
				$("#menu").css('display','none');
				$("#menu_btn").css('display','block');
			}else{
				$("#menu").css('display','block');
				$("#menu_btn").css('display','none');
			}
		});
		
		
		$("#menu_btn").click(function(){
			$("#buttonMenu").slideUp();
			if(!$(this).next().is(":visible"))
			{
				$(this).next().slideDown();
			}
		});

	});
	
	
	function init() {
	  gapi.load('auth2', function() {
	    /* Ready. Make a call to gapi.auth2.init or some other API */
		  gapi.auth2.init();
	  });
	}
	function logout(sns_type, active) {
		// 카카오 인증키 등록
	    Kakao.init('5899acc3cddfce334c3dd49beff92a37');
		
		if(sns_type == "kakao"){ // 카카오 로그인을 했을 때
			kakaoLogout(active);
		}else if(sns_type == "google"){
			signOut(active);
		}else{ //
			location.href = "logout.inc?active="+active;
		}
		
	}
	
	function kakaoLogout(active) {
	    if (!Kakao.Auth.getAccessToken()) {
	      alert('카카오 로그인이 되어있지 않습니다.')
	      return
	    }
	    Kakao.Auth.logout(function() {
	      location.href = "logout.inc?active="+active;
	    })
	  }
	
	function signOut(active) {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	    	location.href = "logout.inc?active="+active;
	    });
	    
	    auth2.disconnect();
	  }
</script>
</body>
</html>