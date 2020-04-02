<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 메뉴 배너 영역 -->
<div style="background: #6a99cb;">
	<div id="sign"
		style="display: inline-block; float: right; margin: .2rem .8rem;">
		<c:choose>
			<c:when test="${userInfo != null}">
				<span>${userInfo.nickname }님 환영합니다.</span>
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
	<div id="header" class="container">
		<div id="logo">
			<h1>
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
<script>
	function logout(sns_type) {
		// 카카오 인증키 등록
	    Kakao.init('5899acc3cddfce334c3dd49beff92a37');
		
		if(sns_type == "kakao"){ // 카카오 로그인을 했을 때
			kakaoLogout();
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
</script>