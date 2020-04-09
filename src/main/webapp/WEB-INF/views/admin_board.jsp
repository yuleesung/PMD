<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 관리페이지</title>
<link rel="stylesheet" href="resources/css/text.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css">
<style type="text/css">
table {
	width: 90%;
	margin: auto;
}

table th {
	height: 50px;
	background-color: #92cfbf;
}

table td {
	padding-left: 5px;
}

.hide {
	display: none;
}

.show {
	display: table-row;
	height: 80px;
	font-size: 16px;
	background-color: #FFF;
}

.title td {
	cursor: pointer;
	height: 40px;
	font-size: 16px;
	background-color: #FFC;
}

.button1 {
	background-color: #008CBA;
	border: 0;
	width: 100px;
	height: 50px;
	color: white;
	font-size: 16px;
	font-weight: bold;
	margin: 5px;
	float: right;
}

.button2 {
	background-color: #f44336;
	border: 0;
	width: 100px;
	height: 50px;
	color: white;
	font-size: 16px;
	font-weight: bold;
	margin: 5px;
	float: right;
}

.button3 {
	background-color: #4CAF50;
	border: 0;
	width: 100px;
	height: 50px;
	color: white;
	font-size: 16px;
	font-weight: bold;
	margin: 5px;
	float: right;
}

.radio {
	width: 18px;
	height: 18px;
}

.sel_label {
	font-size: 20px;
	font-weight: bold;
	margin: 10px;
}
</style>
</head>

<body>
	<h1>관리자용 게시글 관리페이지</h1>
	<br/>
	<label class="sel_label"> <input type="radio" id="ad_free"
		class="radio"
		onclick="location.href='adv_bbsList.inc?b_category=free'" value="free"
		<c:if test="${b_category eq 'free'}">checked</c:if>>자유게시판
	</label>
	<label class="sel_label"> <input type="radio" id="ad_qna"
		class="radio" onclick="location.href='adv_bbsList.inc?b_category=qa'"
		value="qa" <c:if test="${b_category eq 'qa'}">checked</c:if>>QnA게시판
	</label>
	<label class="sel_label"> <input type="radio" id="ad_adv"
		class="radio" onclick="location.href='adv_bbsList.inc?b_category=adv'"
		value="adv" <c:if test="${b_category eq 'adv'}">checked</c:if>>광고게시판
	</label>
	<hr />

	<table cellspacing="0" border="1" class="recruit">
		<thead>
			<tr>
				<th><h3>${board_name }게시판(총${rowTotal }개)</h3></th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${fn:length(list) > 0 }">
				<c:forEach var="vo" items="${list }">
					<tr class="title">
						<td><b>${vo.uvo.nickname }</b>님의 글 || 제목(댓글): <b>${vo.subject }
								(${fn:length(vo.c_list) })</b></td>
					</tr>
					<tr class="hide">
						<td><c:if test="${vo.status eq 0 }">
								<input type="button" value="글 삭제" class="button2"
									onclick="boardStatus('${vo.b_idx}','1','${vo.b_category }' )" />
							</c:if> <c:if test="${vo.status eq 1 }">
								<input type="button" value="글 복구" class="button3"
									onclick="boardStatus('${vo.b_idx}','0','${vo.b_category }')" />
							</c:if> <input type="button" value="글 이동" class="button1"
							onclick="location.href='viewBoard.inc?b_idx=${vo.b_idx }&b_category=${b_category}'" /><br />
							<br />
							<div id="b_content">${vo.b_content }</div></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td>
						<h3 style="color: red;">등록 된 게시물이 없습니다</h3>
					</td>
				</tr>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td>
					<div class="pagination-wrap">${pageCode }</div>
				</td>
			</tr>
		</tfoot>
	</table>

	<!-- 스크립트 영역 -->
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(function() {
			var article = (".recruit .show");
			$(".recruit .title  td").click(function() {
				var myArticle = $(this).parents().next("tr");
				if ($(myArticle).hasClass('hide')) {
					$(article).removeClass('show').addClass('hide');
					$(myArticle).removeClass('hide').addClass('show');
				} else {
					$(myArticle).addClass('hide').removeClass('show');
				}
			});
		});

		function boardStatus(b_idx, status, b_category) {
			console.log(b_category);
			var str = "";
			if (status == 0)
				str = "복구하시겠습니까?";
			else
				str = "삭제하시겠습니까?";

			var con = confirm(str);

			if (con) {
				location.href = "delOrRestoreBoard.inc?b_idx=" + b_idx
						+ "&status=" + status + "&b_category=" + b_category;
			}
		}
	</script>
</body>
</html>