<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.title span{
	font-size: 14px;
	font-weight: bold;
}
</style>
</head>
<body>
<div style="width: 890px; margin: 0; height: 100%; margin-left: 10px;">
	<h1>관리자용 게시글 관리페이지</h1>
	<br/>
	<span>&nbsp;카테고리를 선택해주세요.</span>
	<br/>
	<input type="radio" id="ad_free"
		class="radio" value="free" name="category" checked="checked"><span class="sandwich">자유</span>&nbsp;&nbsp;&nbsp;
	<input type="radio" id="ad_qna"
		class="radio" value="qa" name="category"><span class="sandwich">QnA</span>&nbsp;&nbsp;&nbsp;
	<input type="radio" id="ad_adv"
		class="radio" value="adv" name="category"><span class="sandwich">광고문의</span>&nbsp;&nbsp;&nbsp;
	<div style="display: inline-flex; float: right; margin-right: 10%;">
		<select id="search_sel" name="search_sel" style="height: 25px; ">
			<option value="all">전체</option>
			<option value="1">제목</option>
			<option value="2">이름</option>
			<option value="3">내용</option>
		</select>
		<input type="text" id="search_txt" name="search_txt"/>
		<input type="button" value="검색" id="search_btn"/>
	</div>
	<hr/>

	<table class="recruit" id="adv_bbs">
		<colgroup>
			<col width="50px"/>
			<col width="*"/>
			<col width="210px">
		</colgroup>
		<thead>
			<tr>
				<th colspan="3"><h3>${board_name } 게시판(총 ${rowTotal }개)</h3></th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${fn:length(list) > 0 }">
				<c:forEach var="vo" items="${list }" varStatus="st">
					<tr class="title">
						<td>
							${rowTotal - ((nowPage-1)*blockList+st.index) }
						</td>
						<td>
							<b>${vo.uvo.nickname }</b>님의 글 <b>||</b> 제목(댓글): <b>${vo.subject } (${fn:length(vo.c_list) })</b>
						</td>
						<td style="text-align: right;">
							<c:if test="${vo.status eq 0 }">
								<span></span>
								<input type="button" value="글 삭제" onclick="boardStatus('${vo.b_idx}', '1', '${vo.b_category }', '${nowPage }')" />
							</c:if> <c:if test="${vo.status eq 1 }">
								<span style="color: red;">!삭제된 글!</span>
								<input type="button" value="글 복구" onclick="boardStatus('${vo.b_idx}', '0', '${vo.b_category }', '${nowPage }')" />
							</c:if> 
							<input type="button" value="글 이동" onclick="location.href='viewBoard.inc?b_idx=${vo.b_idx }&b_category=${b_category}'" />
						</td>
					</tr>
					<tr class="hide">
						<td colspan="3">
							<div id="b_content">${vo.b_content }</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan="3">
						<h3 style="color: red;">등록 된 게시물이 없습니다</h3>
					</td>
				</tr>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3">
					<div class="pagination-wrap">${pageCode }</div>
				</td>
			</tr>
		</tfoot>
	</table>
</div>
	<!-- 스크립트 영역 -->
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(function() {
		
			var article = (".recruit .show");
			var val = "";
			
			$('input[name="category"]').change(function(){
				val = $('input[name="category"]:checked').val();
				admin_board(val);
			});
			
			 $(document).on("click", ".recruit .title  td:nth-child(2)", function(event){
					var myArticle = $(this).parents().next("tr");
					if ($(myArticle).hasClass('hide')) {
						$(article).removeClass('show').addClass('hide');
						$(myArticle).removeClass('hide').addClass('show');
					} else {
						$(myArticle).addClass('hide').removeClass('show');
					}
			 });
			 
			 
			 $("#search_btn").click(function(){
				 // 검색 버튼 클릭 시 
					var group_val = "free"; // 그룹 초기값
					
					if(val != "")
						group_val = val;
					
					var sel = $("#search_sel").val(); // 셀렉트
					var txt = $("#search_txt").val(); // 텍스트
			
					if(sel == "all") // 전체검색
						admin_board(group_val);
					else{ // 조건부검색
						var url = "searchBulletinCountForAdmin.inc";
						var param = "searchTypeForAdmin="+encodeURIComponent(sel)+"&searchValueForAdmin="+encodeURIComponent(txt)
									+"&b_category="+encodeURIComponent(group_val);
						ajax_a(url, param);
					}
				});
		});
		
		

		function boardStatus(b_idx, status, b_category, nowPage) { 
			// 글 삭제 or 복구
			var str = "";
			if (status == 0)
				str = "복구하시겠습니까?";
			else
				str = "삭제하시겠습니까?";

			var con = confirm(str);

			if (con) {
				var param = "b_idx="+encodeURIComponent(b_idx)+"&status="+encodeURIComponent(status)+"&b_category="+encodeURIComponent(b_category)+"&nowPage="+encodeURIComponent(nowPage);
				ajax_a("delOrRestoreBoard.inc", param);
			}
		}
		
		function admin_board(category){
			// 그룹 별 리스트
			var param = "b_category="+encodeURIComponent(category);
			ajax_a("admin_board.inc", param);
		}
		
		function page(nowPage, category){
			// 페이징
			var param = "nowPage="+encodeURIComponent(nowPage)+"&b_category="+encodeURIComponent(category);
			ajax_a("admin_board.inc", param);
		}
		
		function searchPage(nowPage, category, searchTypeForAdmin, searchValueForAdmin){
			// 검색 페이징
			var param = "nowPage="+encodeURIComponent(nowPage)+"&b_category="+encodeURIComponent(category)
						+"&searchTypeForAdmin="+encodeURIComponent(searchTypeForAdmin)+"&searchValueForAdmin="+searchValueForAdmin;
			ajax_a("searchBulletinCountForAdmin.inc", param);
		}
		
		
		function ajax_a(url, param){
			$.ajax({
				url: url,
				type: "post",
				data: param,
				dataType: "json"
			}).done(function(data){
				var str_h = "<th colspan='3'><h3>"+data.board_name+" 게시판(총 "+data.rowTotal+"개)</h3></th>";
				
				if(data.ar != null){
					var str = "";
					
					for(var i=0; i<data.ar.length; i++){
						str += "<tr class='title'>";
						str += "<td>"+(data.rowTotal-((data.nowPage-1)*data.blockList+i))+"</td>";
						str += "<td><b>"+data.ar[i].uvo.nickname+"</b>님의 글 <b>||</b> 제목(댓글): <b>"+data.ar[i].subject;
						str += "&nbsp;("+data.ar[i].c_list.length+")</b></td>";
						str += "<td style='text-align: right;'>";
						if(data.ar[i].status == '0'){
							str += "<input type='button' value='글 삭제'";
							str += "onclick='boardStatus(\""+data.ar[i].b_idx+"\", \"1\", \""+data.ar[i].b_category+"\", \""+data.nowPage+"\")'/>";						
						} else if(data.ar[i].status == '1'){							
							str += "<span style='color: red;'>!삭제된 글!&nbsp;</span>";
							str += "<input type='button' value='글 복구'";
							str += "onclick='boardStatus(\""+data.ar[i].b_idx+"\", \"0\", \""+data.ar[i].b_category+"\", \""+data.nowPage+"\")'/>";
						}
						str += "&nbsp;<input type='button' value='글 이동'";
						str += "onclick='location.href=\"viewBoard.inc?b_idx="+data.ar[i].b_idx+"&b_category="+data.ar[i].b_category+"\"'/>";
						str += "</td>";
						str += "</tr>";
						str += "<tr class='hide'>";
						str += "<td colspan='3'>";
						
						str += "<br/>";
						str += "<div id='b_content'>"+data.ar[i].b_content+"</div></td>";
						str += "</tr>";
					}
					
					$(".recruit thead tr").html(str_h);
					$(".recruit tbody").html(str);
					$(".pagination-wrap").html(data.pageCode);
				} else{
					
					var str = "";

					str += "<tr>";
					str += "<td colspan='3'>";
					str += "<h3 style='color: red;'>등록 된 게시물이 없습니다<h3>";
					str += "</td>";
					str += "</tr>";
					
					$(".recruit thead tr").html(str_h);
					$(".recruit tbody").html(str);
				}
			}).fail(function(err){
				console.log(err);
			});
		}
	</script>
</body>
</html>