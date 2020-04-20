<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div id="advList" style="width: 890px; margin: 0; height: 80%;"> 
	<h1><i class="fas fa-folder"></i>&nbsp;관리자용 광고목록 페이지</h1>
	<br/>
	<span>&nbsp;<i class="fas fa-check-circle"></i>&nbsp;Group을 선택해주세요.</span>
	<br/>
	<input type="radio"
		class="radio" value="1" name="adv_group" id="adv_group1"><span class="sandwich">1번 광고</span>&nbsp;&nbsp;&nbsp;
	<input type="radio"
		class="radio" value="2" name="adv_group" id="adv_group2"><span class="sandwich">2번 광고</span>&nbsp;&nbsp;&nbsp;
	<input type="radio"
		class="radio" value="3" name="adv_group" id="adv_group3"><span class="sandwich">3번 광고</span>&nbsp;&nbsp;&nbsp;
	<input type="radio"
		class="radio" value="4" name="adv_group" id="adv_group4"><span class="sandwich">4번 광고</span>&nbsp;&nbsp;&nbsp;
	
	<div style="display: inline-flex; float: right; margin-right: 10%;">
		<select id="search_sel" name="search_sel" style="height: 25px;">
			<option value="0">전체</option>
			<option value="1">회사명</option>
			<option value="2">이메일</option>
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
				<th colspan="3"><h3>${board_name } 페이지(총 ${rowTotal }개)</h3></th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${fn:length(list) > 0 }">
				<c:forEach var="vo" items="${list }" varStatus="st">
				<c:set var="reg" value="${vo.reg_date }"/>
				<c:set var="start" value="${vo.start_date }"/>
				<c:set var="end" value="${vo.end_date }"/>
				
					<tr class="adv_title">
						<td>
							${rowTotal - ((nowPage-1)*blockList+st.index) }
						</td>
						<td>
							<b>${vo.co_name }</b>님 정보<b> || </b>${vo.co_phone }<b> || </b>${vo.co_email }<br/>
							<b>등록기간: </b>${fn:substring(start,0,10) } ~ ${fn:substring(end,0,10) }<b> || </b>${vo.etc }
						</td>
						<td style="text-align: right;">
							<c:if test="${vo.status eq 0 }">
								<input type="button" value="수정" onclick="advEdit('${vo.a_idx}', '${nowPage }')"/>						
								<input type="button" value="올리기" onclick="advStatus('${vo.a_idx}', '1', '${vo.adv_group }', '${nowPage }')" />&nbsp;
							</c:if> <c:if test="${vo.status eq 1 }">
								<span style="color: red;"><i class="fas fa-arrow-alt-circle-up"></i>업로드 중</span>
								<input type="button" value="수정" onclick="advEdit('${vo.a_idx}', '${nowPage }')"/>	
								<input type="button" value="내리기" onclick="advStatus('${vo.a_idx}', '0', '${vo.adv_group }', '${nowPage }')" />&nbsp;
							</c:if>
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

<input type="hidden" id="adv_group" value="${adv_group }"/>

<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var val = ""; // Group 값
			var adv_group = $("#adv_group").val();
			
			switch (adv_group) { // DB에 저장된 그룹과 같은 라디오 버튼을 선택하게 하는 기능
			case '1':
				$("#adv_group1").prop("checked", "checked");
				break;
			case '2':
				$("#adv_group2").prop("checked", "checked");
				break;
			case '3':
				$("#adv_group3").prop("checked", "checked");
				break;
			case '4':
				$("#adv_group4").prop("checked", "checked");
				break;
			}
			
			$('input[name="adv_group"]').change(function(){
				// 라디오버튼 선택하면 진입
				val = $('input[name="adv_group"]:checked').val();

				admin_groupList(val);
			});
			
			$("#search_btn").click(function(){
				var group_val = "1"; // 그룹 초기값
				
				if(val != "")
					group_val = val;
				
				var sel = $("#search_sel").val(); // 셀렉트!
				var txt = $("#search_txt").val(); // 텍스트!
		
				var url = "searchAdv.inc";
				var param = "searchTypeForAdv="+encodeURIComponent(sel)+"&searchValueForAdv="+encodeURIComponent(txt)
								+"&adv_group="+encodeURIComponent(group_val);
				
				ajax_a(url, param);
			});
		});
		
		
		function admin_groupList(group){
			// 해당 그룹의 목록을 뿌려줌
			var param = "adv_group="+group;			
			ajax_a("admin_groupList.inc", param);
		}
		
	
		function page(nowPage, group){
			// 페이징
			var param = "nowPage="+encodeURIComponent(nowPage)+"&adv_group="+encodeURIComponent(group);
			ajax_a("admin_groupList.inc", param);	
		}
		

		function searchPage(nowPage, group, searchTypeForAdv, searchValueForAdv){
			// 검색결과 페이징
			var param = "nowPage="+encodeURIComponent(nowPage)+"&adv_group="+encodeURIComponent(group)
			+"&searchTypeForAdv="+encodeURIComponent(searchTypeForAdv)+"&searchValueForAdv="+encodeURIComponent(searchValueForAdv);
			
			ajax_a("searchAdv.inc", param);	
		}
		
		
		function advStatus(a_idx, status, adv_group, nowPage) {
			// 업로드 버튼
			var str = "";
			if (status == 0)
				str = "광고를 내리시겠습니까?";
			else
				str = "광고를 올리시겠습니까?";

			var con = confirm(str);

			if (con) {
				var param = "a_idx="+encodeURIComponent(a_idx)+"&status="+encodeURIComponent(status)+"&adv_group="+encodeURIComponent(adv_group)+"&nowPage="+encodeURIComponent(nowPage);
				ajax_a("delOrRestoreAdv.inc", param);
			}
		}
		
		
		function advEdit(a_idx, nowPage){
			// 수정 버튼
			
			location.href = "advUpdate.inc?a_idx="+encodeURIComponent(a_idx)+"&nowPage="+encodeURIComponent(nowPage);
		}
		
		
		function ajax_a(url, param){
			$.ajax({
				url: url,
				type: "post",
				data: param,
				dataType: "json"
			}).done(function(data){
				var str_h = "<th colspan='3'><h3>"+data.board_name+" 페이지(총 "+data.rowTotal+"개)</h3></th>";
				
				if(data.ar != null) {
					var str = "";

					for(var i=0; i<data.ar.length; i++){
						var etc = "";
						
						if(data.ar[i].etc == null) // Memo의 내용이 없으면 공백을 표현
							etc = "";
						else
							etc = data.ar[i].etc;
						
						str += "<tr class='adv_title'>";
						str += "<td>";
						str += (data.rowTotal-((data.nowPage-1)*data.blockList+i));
						str += "</td>";
						str += "<td>";
						str += "<b>"+data.ar[i].co_name+"</b>님 정보<b> || </b>"+data.ar[i].co_phone+"<b> || </b>"+data.ar[i].co_email+"<br/>";
						str += "<b>등록기간: </b>"+data.ar[i].start_date.substring(0,10)+" ~ "+data.ar[i].end_date.substring(0,10)+"<b> || </b>"+etc;
						str += "</td>";
						str += "<td style='text-align: right;'>";
						if(data.ar[i].status == 0){							
							str += "<input type='button' value='수정' onclick='advEdit(\""+data.ar[i].a_idx+"\", \""+data.nowPage+"\")'/>&nbsp;";
							str += "<input type='button' value='올리기' onclick='advStatus(\""+data.ar[i].a_idx+"\", \"1\", \""+data.ar[i].adv_group+"\", \""+data.nowPage+"\")'/>&nbsp;";
						} else if(data.ar[i].status == 1){
							str += "<span style='color: red;'><i class='fas fa-arrow-alt-circle-up'></i>업로드 중<span>&nbsp;";
							str += "<input type='button' value='수정' onclick='advEdit(\""+data.ar[i].a_idx+"\", \""+data.nowPage+"\")'/>&nbsp;";
							str += "<input type='button' value='내리기' onclick='advStatus(\""+data.ar[i].a_idx+"\", \"0\", \""+data.ar[i].adv_group+"\", \""+data.nowPage+"\")'/>&nbsp;";
						}
						str += "</td>";
						str += "</tr>";
					}
					
					$(".recruit thead tr").html(str_h);
					$(".recruit tbody").html(str);
					$(".pagination-wrap").html(data.pageCode);	
					
					if(data.adv_group != null && data.img != null){
						var con = confirm("메인에서 확인하시겠습니까?");
						
						if(con){
							location.href = "main.inc";
						}
					}
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