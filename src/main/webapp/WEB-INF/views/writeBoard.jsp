<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
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


<!-- Theme Style -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/summernote-lite.css" />

<style type="text/css">
.dropdown-toggle:after {
	border-top: 0em;
}

input[type=text] {
	width: 400px;
}

.control-label {
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
			<div class="slider-item"
				style="background-image: url('resources/images/mario.gif'); background-size: 30%;">
				<div class="container">
					<div
						class="row slider-text align-items-center justify-content-center">
						<div class="col-md-8 text-center col-sm-12 element-animate">
							<h1 style="font-family: inherit;"></h1>
							<p class="mb-5"></p>
						</div>
					</div>
				</div>
			</div>
		</section>


		<c:choose>
			<c:when test="${userInfo.u_idx ne null }">
				<section class="section element-animate">
					<div class="container">
						<form class="form-horizontal" method="post" action="write.inc"
							name="writeFrm" enctype="multipart/form-data">
							<div class="form-group">
								<label for="title" class="col-sm-2 control-label">Title</label>
								<div>
									<select id="category" name="b_category" class="col-sm-10"
										style="width: 150px; cursor: pointer;">
										<option value="none" style="cursor: pointer;">::
											Category ::</option>
										<option value="free"
											<c:if test="${b_category == 'free' }">selected</c:if>
											style="cursor: pointer;">자유게시판</option>
										<option value="qa"
											<c:if test="${b_category == 'qa' }">selected</c:if>
											style="cursor: pointer;">Q&A</option>
										<option value="adv"
											<c:if test="${b_category == 'adv' }">selected</c:if>
											style="cursor: pointer;">광고문의</option>
									</select> <span id="sel_area"><c:if
											test="${b_category == 'adv'}">
											<label style="color: black;"><input type="checkbox" name="secret_content"
												id="secret_content" checked="checked"/>비밀글</label>
										</c:if> </span> <input type="text" class="form-control" id="title"
										name="subject" placeholder="제목" style="width: 90%;">
								</div>
							</div>
							<div class="form-group">
								<label for="upload" class="col-sm-2 control-label">Upload
									File</label>
								<div class="col-sm-10" style="cursor: pointer;">
									<input type="file" name="upload" id="upload"
										style="cursor: pointer;" />
								</div>
							</div>

							<input type="hidden" name="u_idx" value="${userInfo.u_idx }" />
							<input type="hidden" name="b_content" id="str" /> <input
								type="hidden" id="ran_val" value="${ran_val }">
						</form>

						<table style="width: 90%;">
							<tbody>
								<tr>
									<td
										style="padding-bottom: 15px; padding-left: 15px; width: 900px;">
										<textarea name="content" cols="50" rows="8" id="content"></textarea>
									</td>
								</tr>

								<tr>
									<td><label for="human" class="col-sm-2 control-label"
										style="font-size: 16px;">${ran1 } + ${ran2 } = ? </label> <input
										type="text" class="form-control" id="input_val"
										placeholder="매크로방지" style="width: 150px; margin-left: 15px;">
										<div style="float: right;">
											<label
												style="font-size: 16px; color: black; font-weight: bold;">작성자
												: ${userInfo.nickname }</label><br /> <input id="submit_btn"
												type="button" value="작성완료" class="btn btn-primary"
												style="cursor: pointer;">&nbsp;&nbsp; <input
												id="cancel_btn" type="button" style="cursor: pointer;"
												value="이전으로" class="btn btn-primary"
												onclick="location.href='list.inc?b_category=${b_category}&nowPage=${nowPage }'">
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
			</c:when>
			<c:otherwise>
				<div class="container">
					<h1
						style="height: 300px; text-align: center; padding-top: 30px; font-style: inherit;">로그인
						후 이용해주세요</h1>
				</div>
			</c:otherwise>
		</c:choose>

		<jsp:include page="footer.jsp" />
		<jsp:include page="scroll.jsp" />
	</div>
	<!-- loader! -->
	<div id="loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#f4b214" />
		</svg>
	</div>

	<!-- Script 영역 -->
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelement-and-player.min.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.countdown.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="resources/js/summernote-lite.js"></script>
	<script src="resources/js/lang/summernote-ko-KR.min.js"></script>
	<script>
		$(function() {

			$("#submit_btn").click(
					function() {
						var ran_val = $("#ran_val").val();
						var input_val = $("#input_val").val();

						var category = $("#category").val();
						var title = $("#title").val();
						var str = $("#content").val();
						$("#str").val(str);

						if (input_val == ran_val) {
							if (category != "none" && title.trim().length > 0
									&& str.trim().length > 0) {
								//console.log(category);

								/* 비밀글 체크여부  secret_content  */
								if ($("#secret_content").prop("checked")) {
									$("#secret_content").val(1);
								} else {
									$("#secret_content").val(0);
								}
								document.writeFrm.submit();

							} else {
								alert("다시 확인하세요");
							}
						} else {
							alert("다시 확인하세요");
						}

					});

			$("#content").summernote({
				height : 400,
				width : '100%',
				lang : "ko-KR",
				dialogsInBody : true,
				callbacks : {
					onImageUpload : function(files, editor) {

						for (var i = 0; i < files.length; i++) {
							sendFile(files[i], editor);
						}
					},
				}
			});

			$("#content").summernote("lineHeight", 1.0);

			 $("#category").on("click", function() {
					var select = $("#category option:selected").val();
					if (select == 'adv') {
						$("#sel_area").html('<label style="color:black;"><input type="checkbox" name="secret_content" id="secret_content" checked="checked"/>비밀글</label>');
					} else {
						$("#sel_area").html("");
					}
	
				});

		}); //jquery함수 끝

		function sendFile(file, editor) {
			//파라미터를 전달하기 위해 폼객체 준비!
			var frm = new FormData();

			//보내고자 하는 자원을 파라미터 값으로 등록(추가)
			frm.append("upload", file);

			//비동기식 통신
			$.ajax({
				url : "saveImage.inc",
				type : "post",
				dataType : "json",

				contentType : false,
				processData : false,
				data : frm

			}).done(function(data) {
				$("#content").summernote("editor.insertImage", data.url);
			}).fail(function(err) {
				console.log(err);
			});
		}
	</script>
</body>
</html>