<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="resources/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/page.css" />
<style>
	body{
		margin: 0;
		padding: 0;
	}

	#container{
		width: 1200px;
		height: 900px;
		margin: auto;
		padding: 0;
		border: 1px solid black;
	}
	
	#left{
		width: 298px;
		height: 100%;
		float: left;
		padding: 0;
		margin: 0;
		border: 1px solid red;
		background-color: #6a99cb;
	}
	
	#right{
		width: 898px;
		height: 100%;
		float: left;
		padding: 0;
		margin: 0;
		overflow: hidden;
		border: 1px solid blue;
	}
	
	#right:hover{
		overflow: auto;
	}
	
	a{
		color: white;
		text-decoration: none;
	}
	
	#menu{
		padding: 0;
		margin: 0;
	}
	
	#menu li{
		list-style: none;
		padding: 20px;
		padding-left: 40px;
		font-size: 20px;
	}
	
	#menu li a{
		display: block;
		width: 100%;
		height: 100%;
	}
	
	#menu li a:hover{
		color: #0080ff;
	}
	
	#slide{
		padding-top: 10px;
		width: 100%;
		height: 70px;
		background-color: #CADBE9;
		display: none;
	}
	
	#slide ul{
		padding: 0;
	}
	
	#slide li{
		padding: 5px;
		font-size: 15px;
	}
	
	#slide li:hover{
		background-color: #0080ff;
	}
	
	#slide li a:hover{
		color: white;
	}
	
	#slide li a{
		text-indent: 50px;
	}
	
	.active{
		color: #0080ff;
	}
	
	.slideActive{
		background-color: #0080ff;
		color: white;
	}
		
</style>
</head>
<body>
	<div id="container">
		<div id="left">
			<div id="logo">
				<p style="font-family: cursive; font-size: 50px; color: white; text-align: center;">
					<a href="main.inc">
						P M D
					</a>
				</p>
				<ul id="menu">
					<li>
						<a href="javascript: viewPage('0')" class="active">
							<i class="far fa-id-card"></i>&nbsp;&nbsp;회원 관리
						</a>
					</li>
					<li>
						<a href="javascript: viewPage('1')">
							<i class="fas fa-tasks"></i>&nbsp;&nbsp;게시물 관리
						</a>
					</li>
					<li style="cursor: pointer;">
						<a id="adv">
							<i class="fas fa-ad"></i>&nbsp;&nbsp;광고 관리
						</a>
						<div id="slide">
							<ul>
								<li>
									<a href="javascript: viewPage('2')">
										광고 넣기
									</a>
								</li>
								<li>
									<a href="javascript: viewPage('3')">
										광고 목록 보기
									</a>
								</li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
			
		</div>
		<div id="right">
			
		</div>
	</div>
	<input type="hidden" id="hometown" value="${hometown }"/>
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
			// 광고문의 메뉴 클릭시 아코디언으로 보여주는 기능
			$("#adv").bind("click", function(){
				$("#slide").slideUp();
				if(!$(this).next().is(":visible")){
					$(this).next().slideDown();
				}
			});
			
			$("#menu>li>a").click(function(){
				$("#menu>li>a").removeClass("active");
				$(this).addClass("active");
			});
			
			$("#menu>li:first-child").click(function(){
				$("#slide").slideUp();
			});
			
			$("#menu>li:nth-child(2)").click(function(){
				$("#slide").slideUp();
			});
			
			$("#slide li").click(function(){
				$("#slide li").removeClass("slideActive");
				$(this).addClass("slideActive");
			});
			
			var hometown = $("#hometown").val();
			
			if(hometown == ""){
				// 오른쪽 화면에서 가장 먼저 로드 되는 기능
				$("#right").load("/drm/memSet.inc");
			}else if(hometown == "fromInsertAdv"){ // 광고 넣기를 하고 광고 목록 보기 화면으로 자동 이동
				$("#hometown").val("");
				hometown = "";
				viewPage('3');
				$("#menu>li>a:first-child").addClass("active");
				$("#menu>li>a:last-child").removeClass("active");
				$("#slide").slideDown();
				$("#slide li:last-child").addClass("slideActive");
			}
				
		});
		
		
		// 메뉴를 눌렀을 때 다른 페이지를 보여주는 기능!! 
		function viewPage(num) {
			if(num == '0')
				$("#right").load("/drm/memSet.inc");
			else if(num == '1')
				$("#right").load("/drm/adv_bbsList.inc");
			else if(num == '2')
				$("#right").load("/drm/advInsert.inc");
			else if(num == '3')
				$("#right").load("/drm/admin_advList.inc");
		}
		
	</script>
</body>
</html>