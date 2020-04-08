<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>수정하기</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800|Playfair+Display:,300, 400, 700"
	rel="stylesheet">

<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">
<link rel="stylesheet"
	href="resources/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="resources/fonts/fontawesome/css/font-awesome.min.css">

<!-- 메뉴바 관련 추가 -->
<link href="http://fonts.googleapis.com/css?family=Didact+Gothic"
	rel="stylesheet">
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css"
	media="all">
<link href="resources/css/default.css" rel="stylesheet" type="text/css"
	media="all">
<link rel="stylesheet" href="resources/fonts/fontawesome/css/font-awesome.min.css" />

<!-- Theme Style -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/summernote-lite.css" />

<style type="text/css">
	.dropdown-toggle:after {
		border-top: 0em;
	}
input[type=text]{
	width: 400px;
}
.control-label{
	font-size: 18px;
	color: black;
	font-weight: bold;
}
</style>
</head>
<body>

	<jsp:include page="menubar.jsp" />

	<div class="container" style="padding: 0;"> 
		<section class="home-slider owl-carousel">
			<div class="slider-item" style="background-image: url('resources/images/mario.gif'); background-size: 30%;">
				<div class="container"> <div class="row slider-text align-items-center justify-content-center">
					<div class="col-md-8 text-center col-sm-12 element-animate">
						<h1 style="font-family: inherit;"></h1> <p class="mb-5"></p>
					</div>
				</div> </div>
			</div>
		</section>
	</div>

<c:choose>
<c:when test="${userInfo.u_idx ne null }">
	<section class="section element-animate">  
	  <div class="container">
		<form class="form-horizontal" method="post" action="edit.inc" name="editFrm" enctype="multipart/form-data">
			<div class="form-group" >
				<label for="title" class="col-sm-2 control-label">Title</label>
				<div class="col-sm-10">
					<select id="category" name="b_category" class="col-sm-10" style="width: 150px; cursor: pointer;">
						<option value="none">:: Category ::</option>
						<option value="free"
						<c:if test="${vo.b_category == 'free' }">selected</c:if>>자유게시판</option>
						<option value="qa"
						<c:if test="${vo.b_category == 'qa' }">selected</c:if>>Q&A</option>
						<option value="adv"
						<c:if test="${vo.b_category == 'adv' }">selected</c:if>>광고문의</option>
					</select>
				
					<c:if test="${vo.b_category eq 'adv' && vo.secret_content ne 1 }">
						<label id="label" style="margin-bottom: 0;">
							<input type="checkbox" id="secret_content"/>비밀글
							<input type="hidden" name="secret_content" id="secret_content2"/>
						</label>
					</c:if>
					<c:if test="${vo.b_category eq 'adv' && vo.secret_content eq 1 }">
						<label id="label" style="margin-bottom: 0;">
							<input type="checkbox" id="secret_content" checked="checked"/>비밀글
							<input type="hidden" name="secret_content" id="secret_content2"/>
						</label>
					</c:if>
					

					<input type="text" class="form-control" id="title" name="subject"
						placeholder="제목" style="width: 100%;" value="${vo.subject }"/>
				</div>
			</div>
			<div class="form-group">
				<label for="upload" class="col-sm-2 control-label">Upload File</label>
				<div class="col-sm-10">
					<input type="file" name="upload" id="upload" style="cursor: pointer;"/>
				</div>
			</div>
			<input type="hidden" name="b_idx" id="b_idx" value="${vo.b_idx }"/>
			<input type="hidden" name="u_idx" value="${userInfo.u_idx }"/>
			<input type="hidden" name="b_content" id="str"/>
		</form>

		<table>
			<tbody>
				<tr>
					<td style="padding-bottom: 15px; padding-left: 15px; width: 900px;">
						<textarea name="content" cols="50" rows="8" id="content">${vo.b_content }</textarea>
					</td>
				</tr>
				<tr>
					<td>
					<div style="float: right;">
					<label style="font-size: 16px; color: black; font-weight: bold;">작성자 : ${userInfo.nickname }</label><br/>
					<input id="submit_btn" type="button" value="Submit" class="btn btn-primary" style="cursor: pointer;">&nbsp;&nbsp;
						<input id="cancel_btn" type="button" value="Cancel" class="btn btn-primary" style="cursor: pointer;"
						onclick="location.href='viewBoard.inc?b_idx=${vo.b_idx}&nowPage=${vo.nowPage }&b_category=${vo.b_category }'"> 
						<!-- 해당게시물로 돌아가기 -->
					</div>
					</td>
				</tr>
			</tbody>
		</table>
	  </div>
	</section>
	</c:when>
	<c:otherwise>
		<div class="container">
			<h1 style="height: 300px; text-align: center; padding-top: 30px; font-style: inherit;">로그인 후 이용해주세요</h1>
		</div>
	</c:otherwise>
</c:choose>

	<footer class="site-footer" role="contentinfo">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md-4 mb-5">
					<h3>PMD</h3>
					<p class="mb-5">People who Make a Dream.</p>
					<ul class="list-unstyled footer-link d-flex footer-social">
						<li><a href="#" class="p-2"><span class="fa fa-twitter"></span></a></li>
						<li><a href="#" class="p-2"><span class="fa fa-facebook"></span></a></li>
						<li><a href="#" class="p-2"><span class="fa fa-linkedin"></span></a></li>
						<li><a href="#" class="p-2"><span class="fa fa-instagram"></span></a></li>
					</ul>
				</div>
				<div class="col-md-4 mb-5">
					<h3>Visit or Talk to Us</h3>
					<ul class="list-unstyled footer-link">
						<li class="d-block"><span class="d-block">Address:</span> <span
							class="text-white">34 Street Name, City Name Here, United
								States</span></li>
						<li class="d-block"><span class="d-block">Telephone:</span><span
							class="text-white">+1 242 4942 290</span></li>
						<li class="d-block"><span class="d-block">Email:</span><span
							class="text-white">info@yourdomain.com</span></li>
					</ul>
				</div>

			</div>
			<div class="row">
				<div class="col-12 text-md-left text-left">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						<br> Demo Images Unsplash
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- END footer -->

	<!-- loader -->
	<div id="loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214" />
		</svg>
	</div>

	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelement-and-player.min.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.countdown.min.js"></script>
	<script src="resources/js/main.js"></script>

	<script src="resources/js/summernote-lite.js"></script>
	<script src="resources/js/lang/summernote-ko-KR.min.js"></script>
	<script>
	$(function(){
	
		$("#submit_btn").click(function(){
	
			var category = $("#category").val();
			var title = $("#title").val();
			var str = $("#content").val();
			$("#str").val(str);
						
			if(category != "none" && title.trim().length > 0 && str.trim().length > 0){
				//console.log(category+","+title);
				
				//비밀글 체크여부  secret_content 
				if($("#secret_content").prop("checked")){
					$("#secret_content2").val(1);
				}else{
					$("#secret_content2").val(0);
				}
				//console.log($("#secret_content").val());
				document.editFrm.submit();
			} else{
				alert("다시 확인하세요");
			}
	
		});
	
	
		$("#content").summernote({
			height: 400,
			width: '100%',
			lang: "ko-KR",
			dialogsInBody: true,
			callbacks:{
				onImageUpload: function(files, editor){

					for(var i=0; i<files.length; i++){
						sendFile(files[i], editor);
					}
				},
			}
		});
		
		$("#content").summernote("lineHeight", 1.0);
		
		
		
		// 카테고리 선택에 따른 비밀글 기능
		$("#category").change(function(){
			if($("#category option:selected").val() == 'adv' ){
				$("#label").html('<input type="checkbox" name="secret_content" id="secret_content"/>비밀글');
			}else{
				$("#label").html('');
			}
		});
		
		
		
	});
	
	
	
	function sendFile(file, editor){	
		//파라미터를 전달하기 위해 폼객체 준비!
		var frm = new FormData();
		
		//보내고자 하는 자원을 파라미터 값으로 등록(추가)
		frm.append("upload", file);
		
		//비동기식 통신
		$.ajax({
			url: "saveImage.inc",
			type: "post",
			dataType: "json",

			contentType: false,
			processData: false,
			data: frm
			
		}).done(function(data){				
			$("#content").summernote("editor.insertImage", data.url);		
		}).fail(function(err){
			console.log(err);
		});
	}
    </script>
</body>
</html>