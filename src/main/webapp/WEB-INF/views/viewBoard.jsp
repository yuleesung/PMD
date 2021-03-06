<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시물 보기</title>
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

<!-- 페이징 css적용 -->
<link rel="stylesheet" href="resources/css/text.css" />
<!-- Theme Style -->
<link rel="stylesheet" href="resources/css/style.css">

<style type="text/css">
table#t1, table#t2 {
	width: 100%;
	border-collapse: collapse;
	font-size: 18px;
	color: #000;
}

table caption {
	text-indent: -9999px;
	height: 0;
}

table#t1 th, table#t1 td {
	border: 1px solid #ccc;
	padding: 20px;
	color: black;
}

table#t1 tbody td a {
	color: black;
}

table#t1 thead tr, table#t1 thead td {
	border: none;
}

table#t1 th {
	background-color: #d6ecfa;
	text-align: center;
}

div#b_content {
	height: 600px;
	white-space: pre-line;
	overflow: hidden;
}

div#b_content:hover {
	overflow: auto;
}

textarea#comment {
	width: 100%;
	height: 100px;
	resize: none;
	border-color: #999;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	margin-bottom: 0;
	border-bottom: none;
}

div#comment_div1 {
	margin: 0;
	padding: 0;
	height: 100px;
}

div#comment_div2 {
	width: 100%;
	height: 100%;
	border: 1px solid #999;
	border-top: 1px solid #ccc;
	margin: 0;
	padding: 5px;
	text-align: right;
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
}

table#t2 tbody td {
	border-bottom: 1px solid #ccc;
	padding: 5px;
	padding-top: 12px;
}

table#t2 tfoot td ul.pagination-v4{
	width: 400px;
	margin: auto;
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
	</div>

	<section class="section element-animate">
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div>
						<table id="t1">
							<caption>게시물 보기</caption>
							<colgroup>
								<col width="120px" />
								<col width="*" />
								<col width="120px" />
								<col width="140px" />
								<col width="120px" />
								<col width="80px" />
							</colgroup>
							<thead>
								<tr>
									<td colspan="6" style="text-align: right;"><c:if
											test="${vo.uvo.u_idx eq sessionScope.userInfo.u_idx }">
											<input type="button" class="btn btn-primary" value="수정"
												style="font-size: 15px; cursor: pointer;"
												onclick="javascript: location.href='updateBoard.inc?b_idx=${vo.b_idx}&b_category=${b_category }&nowPage=${nowPage }&active=${active}'" />
											<input type="button" class="btn btn-danger" value="삭제"
												style="font-size: 15px; cursor: pointer;"
												onclick="delPost('${vo.b_idx}', '${nowPage }', '${b_category }', '${active }')" />
										</c:if> <input type="button" class="btn btn-primary" value="목록"
										style="font-size: 15px; cursor: pointer;"
										onclick="javascript: location.href='list.inc?nowPage=${nowPage}&b_category=${b_category }&active=${active}'" />
									</td>
								</tr>
							</thead>
							<tbody>
								<c:if test="${vo ne null }">
									<tr>
										<th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
										<td><c:if
												test="${vo.secret_content eq 1 && b_category eq 'adv'}">
			          					${vo.subject } <i class="fa fa-lock fa-lg"
													style="color: rgba(38, 81, 168, 0.8); padding-top: 10px;"></i>
											</c:if> <c:if
												test="${vo.secret_content ne 1 || b_category ne 'adv'}">
			          					${vo.subject }
			          				</c:if></td>
										<th>작성자</th>
										<td colspan="4" style="text-align: center;">${vo.uvo.nickname }</td>
									</tr>
									<tr>
										<th>파일 이름</th>
										<c:if test="${vo.file_name ne null }">
											<td><a style="color: blue; font-family: sans-serif;" href="FileDownload?f_name=${vo.file_name }&dir=upload">${vo.file_name }</a></td>
										</c:if>
										<c:if test="${vo.file_name eq null }">
											<td></td>
										</c:if>
										<th>날&nbsp;&nbsp;&nbsp;&nbsp;짜</th>
										<td>${fn:substring(vo.write_date, 0, 10) }</td>
										<th>조회수</th>
										<td style="text-align: center;">${vo.hit }</td>
									</tr>
									<tr>
										<th colspan="6">내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
									</tr>
									<tr>
										<td colspan="6"><div id="b_content">${vo.b_content }</div></td>
									</tr>
								</c:if>
								<c:if test="${vo eq null }">
									<tr>
										<td colspan="6" style="height: 300px;">내용이 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>

						<div class="col-md-12">
							<div id="comment_div">
								<c:if test="${userInfo ne null }">
									<div id="comment_div1">
										<textarea id="comment" placeholder="여기서 댓글 작성하세요!!"></textarea>
									</div>
									<div id="comment_div2">
										<input type="button" class="btn btn-primary" value="댓글등록"
											id="comment_btn"
											style="padding: 5px; border-radius: 5px; cursor: pointer;" />
									</div>
								</c:if>
								<c:if test="${userInfo eq null }">
									<div id="comment_div1">
										<textarea id="comment" placeholder="댓글은 로그인 후 작성 가능합니다."
											readonly="readonly"
											style="background-color: #dedede; cursor: pointer;"
											onclick="javascript: location.href='login.inc?active=${active}'"></textarea>
									</div>
									<div id="comment_div2">
										<input type="button" class="btn btn-primary" value="댓글등록"
											id="comment_btn"
											style="padding: 5px; border-radius: 5px; cursor: pointer;"
											disabled="disabled" />
									</div>
								</c:if>
							</div>
							<table id="t2">
								<caption>댓글 테이블</caption>
								<colgroup>
									<col width="160px" />
									<col width="*" />
									<col width="120px" />
									<col width="120px" />
								</colgroup>
								<tbody id="t2_tbody">
									<tr>
										<td colspan="4" style="padding-top: 20px; font-weight: bold;">댓글
											${c_length }</td>
									</tr>
									<c:if test="${fn:length(vo.c_list) > 0}">
										<c:forEach var="cvo" items="${vo.c_list }" varStatus="st">
											<tr>
												<td>${cvo.uvo.nickname }</td>
												<td>${cvo.c_content }</td>
												<td>${fn:substring(cvo.write_date, 0, 10) }</td>
												<td><c:if
														test="${cvo.u_idx eq sessionScope.userInfo.u_idx }">
														<input type="button" value="수정"
															onclick="updateComment('${st.index+1}', '${fn:length(vo.c_list)+1}', '${cvo.c_idx }', '1')"
															style="cursor: pointer;" />
														<input type="button" value="삭제"
															onclick="delComment('${cvo.c_idx }', '1')"
															style="cursor: pointer;" />
													</c:if></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="4">
											<c:if test="${c_length > 10 }">
												${pageCode }
											</c:if>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="footer.jsp" />

	<jsp:include page="scroll.jsp" />

	<!-- loader! -->
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
	<script
		src="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelement-and-player.min.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.countdown.min.js"></script>
	<script src="resources/js/main.js"></script>


	<script>
    
    
	    document.addEventListener('DOMContentLoaded', function() {
            var mediaElements = document.querySelectorAll('video, audio'), total = mediaElements.length;

            for (var i = 0; i < total; i++) {
                new MediaElementPlayer(mediaElements[i], {
                    pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',
                    shimScriptAccess: 'always',
                    success: function () {
                        var target = document.body.querySelectorAll('.player'), targetTotal = target.length;
                        for (var j = 0; j < targetTotal; j++) {
                            target[j].style.visibility = 'visible';
                        }
              }
            });
            }
        });
	    
	    $(function(){
	    	$("#comment_btn").click(function(){
	    		var comment = $("#comment").val();
	    		var c_url = "comment.inc";
	    		var param = "c_content="+encodeURIComponent(comment)+"&b_idx="+encodeURIComponent("${vo.b_idx}")+"&u_idx="+encodeURIComponent("${sessionScope.userInfo.u_idx}");
	    		
	    		if(comment.trim().length < 1){
	    			alert("댓글 내용을 입력하세요!");
	    			$("#comment").focus();
	    			return;
	    		}
	    		
	    		ajax_m(c_url, param);
	    	});
	    });
	    
	    function updateComment(cnt, len, c_idx, nowPage) {
			var second_td = document.getElementById("t2_tbody").children[cnt].children[1];
			var third_td = document.getElementById("t2_tbody").children[cnt].children[3];
			var second_tdContent = second_td.innerHTML;
			
			for(var i=1; i<len; i++){
				document.getElementById("t2_tbody").children[i].children[3].innerHTML = "";
			}
			
			second_td.innerHTML = "<textarea id='revision"+cnt+"' style='width: 100%; height: 60px; resize: none;'>"+second_tdContent+"</textarea>";
			document.getElementById("revision"+cnt).select();
			third_td.innerHTML = "<input type='button' value='저장' onclick='c_save(\""+cnt+"\", \""+c_idx+"\", \""+nowPage+"\")'/>&nbsp;<input type='button' value='취소' onclick='c_cancel(\""+nowPage+"\")'/>";
		}
	    
	    function delComment(c_idx, nowPage) {
			var c_url = "delComment.inc";
			var param = "c_idx="+encodeURIComponent(c_idx)+"&b_idx="+encodeURIComponent("${vo.b_idx}")+"&nowPage="+encodeURIComponent(nowPage);
			
			var chk = confirm("삭제 하시겠습니까?");
			
			if(chk){
				ajax_m(c_url, param);
			}
		}
	    
	    function c_save(cnt, c_idx, nowPage) {
			var ta = $("#revision"+cnt).val();
			var c_url = "updateComment.inc";
			var param = "c_content="+encodeURIComponent(ta)+"&b_idx="+encodeURIComponent("${vo.b_idx}")+"&c_idx="+encodeURIComponent(c_idx)+"&nowPage="+encodeURIComponent(nowPage);
			
			if(ta.trim().length < 1){
    			alert("댓글 내용을 입력하세요!");
    			$("#revision"+cnt).focus();
    			return;
    		}
			
			ajax_m(c_url, param);
		}
	    
	    function c_cancel(nowPage) {
			var c_url = "viewComment.inc";
			var param = "b_idx="+encodeURIComponent("${vo.b_idx}")+"&nowPage="+encodeURIComponent(nowPage);
			
			ajax_m(c_url, param);
		}
	    
	    function ajax_m(c_url, param) {
	    	$.ajax({
    			url: c_url,
    			type: "post",
    			data: param,
    			dataType: "json"
    		}).done(function(data){
    			
    			if(data.c_ar != null){
		   			// console.log(data.c_ar);
		   			var str = "<tr><td colspan='4' style='padding-top: 20px; font-weight: bold;'>댓글 "+data.c_length+"</td></tr>";
		   			
		   			for(var i=0; i<data.c_ar.length; i++){
		   				str += "<tr>";
		   				str += "<td>"+data.c_ar[i].uvo.nickname+"</td>";
		     				str += "<td>"+data.c_ar[i].c_content+"</td>";
		     				str += "<td>"+data.c_ar[i].write_date.substring(0, 10)+"</td>";
		     				
		     				if(data.c_ar[i].uvo.u_idx == "${sessionScope.userInfo.u_idx}"){
		         				str += "<td>";
		          			str += "<input type='button' value='수정' style='cursor: pointer;' onclick='updateComment(\""+(i+1)+"\", \""+(data.c_ar.length+1)+"\", \""+data.c_ar[i].c_idx+"\", \""+data.nowPage+"\")'/>&nbsp;";
		          			str += "<input type='button' value='삭제' style='cursor: pointer;' onclick='delComment(\""+data.c_ar[i].c_idx+"\", \""+data.nowPage+"\")'/>";
		         				str += "</td>";
		     				}else{
		     					str += "<td>";
		     					str += "</td>";
		     				}
		     				
		     				str += "</tr>";
		   			}
		   			
		   			$("#t2 tbody").html(str);
		   			$("#t2 tfoot tr td").html(data.pageCode);
		   			$("#comment_div1").html('<textarea id="comment" placeholder="여기서 댓글 작성하세요!!"></textarea>');
    			}else{
    				var str = "<tr><td colspan='4' style='padding-top: 20px; font-weight: bold;'>댓글&nbsp;0</td></tr>";
    				$("#t2 tbody").html(str);
    				$("#t2 tfoot tr td").html("");
    			}
    		}).fail(function(err){
    			console.log(err);
    		});
		}
	    
	    function delPost(b_idx, nowPage, b_category, active) {
	    	
	    	var chk = confirm("정말 삭제 하시겠습니까?");
	    	var param = "b_idx="+encodeURIComponent(b_idx);
	    	
	    	if(chk){
				$.ajax({
					url: "delBoard.inc",
					type: "post",
					data: param,
					dataType: "json"
				}).done(function(data){
					if(data.chk){
						location.href = "list.inc?nowPage="+nowPage+"&b_category="+b_category+"&active="+active;
					}else{
						alert("삭제를 실패하였습니다!");
					}
				}).fail(function(err){
					console.log(err);
				});
	    	}
		}
	    
	    function page(nowPage, b_idx) {
			var c_url = "viewComment.inc";
			var param = "nowPage="+encodeURIComponent(nowPage)+"&b_idx="+encodeURIComponent(b_idx);
			
			ajax_m(c_url, param);
		}
    </script>
</body>
</html>