<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="resources/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/page.css" />
<link rel="stylesheet" href="resources/css/admin.css" />
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
	<input type="hidden" id="a_idx" value="${a_idx }"/>
	<input type="hidden" id="nowPage" value="${nowPage }"/>
	<input type="hidden" id="adv_group" value="${adv_group }"/>
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var hometown = $("#hometown").val(); // 광고추가 했을 때 들어오는 영역
			var a_idx = $("#a_idx").val(); // 광고수정시 들어오는 파라미터
			var adv_group = $("#adv_group").val(); // 광고수정시 들어오는 파라미터
			var nowPage = $("#nowPage").val(); // 광고수정시 들어오는 파라미터
			var adv_group = $("#adv_group").val();
			
			if(hometown == "" && a_idx == "" && adv_group == ""){
				// 오른쪽 화면에서 가장 먼저 로드 되는 기능
				$("#right").load("/drm/memSet.inc");
			}else if(hometown == "fromInsertAdv" && a_idx == "" && adv_group == ""){ // 광고 넣기를 하고 광고 목록 보기 화면으로 자동 이동
				
				viewPage('3');
				$("#menu>li>a:first-child").addClass("active");
				$("#menu>li>a:last-child").removeClass("active");
				$("#slide").slideDown();
				$("#slide li:last-child").addClass("slideActive");
				
				$("#hometown").empty();
				hometown = "";
			}else if(hometown == "" && a_idx != "" && nowPage != "" && adv_group == ""){ // 수정버튼을 눌렀을 때 광고 수정페이지를 보여주는 기능
				
				$("#right").load("/drm/showAdvUpdate.inc?a_idx="+a_idx+"&nowPage="+nowPage);
			
				$("#a_idx").empty();
				a_idx = "";
				$("#nowPage").empty();
				nowPage = "";
			}else if(hometown == "fromUpdateAdv" && a_idx == "" && nowPage != "" && adv_group != ""){ // 광고 수정을 하고 나서 광고목록으로 가는 기능
				
				$("#right").load("/drm/admin_advList.inc?nowPage="+nowPage+"&adv_group="+adv_group);
				$("#menu>li>a:first-child").addClass("active");
				$("#menu>li>a:last-child").removeClass("active");
				$("#slide").slideDown();
				$("#slide li:last-child").addClass("slideActive");
				
				$("#hometown").empty();
				hometown = "";
				$("#nowPage").empty();
				nowPage = "";
				$("#adv_group").empty();
				adv_group = "";
			}
			
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