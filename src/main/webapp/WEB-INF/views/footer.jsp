<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

@media (max-width: 580px) {
	#footer{
		width: 1200px !important;
	}
}

 #footer{
	width: auto;
	padding: 40px 0px 50px;/* 위 좌/우 아래 */
	background: rgba(26, 70, 104, 0.51);
	margin-top: 100px;
}

#footer .footer_area{
	width: 900px;
	margin: auto;
}
#footer .foot_guide{
	overflow: hidden;
	padding-bottom: 20px;
	list-style: none;
	padding: 0;
}
#footer .foot_guide li{
	float: left;
	padding: 0 10px;
	border-left: 1px solid #999;
}

#footer .foot_guide li:first-child{
	border-left: none;
	padding-left: 0;
}
#footer .foot_guide li a{
	color: black;
	font-size: 12px;
	font-weight: bold;
	text-decoration: none;
}
#footer .foot_guide li a:hover{
	color: #ff5001;
}
#footer address{
	font-size: 12px;
	color: black;
	padding-bottom: 6px;
}
#footer .copyright{ font-size: 11px; }
</style>
</head>
<body>

    <div id="footer">
			<div class="footer_area" >
				<div style="margin-bottom: 10px;">
					<ul class="foot_guide">
						<li><a href="">개인정보취급방침</a></li>
						<li><a href="">웹회원 이용약관</a></li>
						<li><a href="">책임한계와 법적고지</a></li>
						<li><a href="">이메일 무단수집 거부</a></li>
					</ul>
				</div>
				<address style="font-size: 14px;">
				 서울특별시 관악구 조원동 &nbsp;
				 (대표이사: 마루치) <br/><br/>
				 고객상담: 국번없이 114 혹은 <br/>
				 02-1234-1234 (평일 09:00~17:00) <br/>
				</address> 
				<p class="copyright" style="color: black; font-size: 16px; font-weight: bold;">
					Copyright (c) PMD.
					All rights reserved.
				</p>
			</div>
		</div>
    <!-- END footer -->

</body>
</html>