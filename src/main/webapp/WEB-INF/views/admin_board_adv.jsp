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
<div style="width: 890px; margin: 0; height: 100%; margin-left: 10px;">
	<h1>관리자용 광고목록 페이지</h1>
	<br/>
	<span>&nbsp;Group을 선택해주세요.</span>
	<br/>
	<input type="radio"
		class="radio" value="1" name="adv_group"><span class="sandwich">Group #1</span>&nbsp;&nbsp;&nbsp;
	<input type="radio"
		class="radio" value="2" name="adv_group"><span class="sandwich">Group #2</span>&nbsp;&nbsp;&nbsp;
	<input type="radio"
		class="radio" value="3" name="adv_group"><span class="sandwich">Group #3</span>&nbsp;&nbsp;&nbsp;
	<input type="radio"
		class="radio" value="4" name="adv_group"><span class="sandwich">Group #4</span>&nbsp;&nbsp;&nbsp;
	<hr/>

	<table class="recruit" id="adv_bbs">
		<colgroup>
			<col width="50px"/>
			<col width="*"/>
			<col width="210px">
		</colgroup>
		<thead>
			<tr>
				<th colspan="3"><h3>${board_name } 리스트(총 ${rowTotal }개)</h3></th>
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
								<input type="button" value="올리기" onclick="advStatus('${vo.a_idx}', '1', '${vo.adv_group }', '${nowPage }')" />&nbsp;
							</c:if> <c:if test="${vo.status eq 1 }">
								<span style="color: red;">!업로드 중!</span>		
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
<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('input[name="adv_group"]').change(function(){
				var val = $('input[name="adv_group"]:checked').val();
				//console.log(val);
				admin_groupList(val);
			});
		});
	
		
		function admin_groupList(group){
			var param = "adv_group="+group;			
			ajax_a("admin_groupList.inc", param);
		}
		
	
		function page(nowPage, group){
			var param = "nowPage="+encodeURIComponent(nowPage)+"&adv_group="+encodeURIComponent(group);
			ajax_a("admin_groupList.inc", param);	
		}
		
		
		function advStatus(a_idx, status, adv_group, nowPage) {

			var str = "";
			if (status == 0)
				str = "업로드하시겠습니까?";
			else
				str = "광고 내리는 걸 고급적으로 표현하지 못 함 TT";

			var con = confirm(str);

			if (con) {
				var param = "a_idx="+encodeURIComponent(a_idx)+"&status="+encodeURIComponent(status)+"&adv_group="+encodeURIComponent(adv_group)+"&nowPage="+encodeURIComponent(nowPage);
				ajax_a("delOrRestoreAdv.inc", param);
			}
		}
		
		function ajax_a(url, param){
			$.ajax({
				url: url,
				type: "post",
				data: param,
				dataType: "json"
			}).done(function(data){
				var str_h = "<th colspan='3'><h3>"+data.board_name+" 리스트(총 "+data.rowTotal+"개)</h3></th>";
				
				if(data.ar != null) {
					var str = "";

					for(var i=0; i<data.ar.length; i++){
						str += "<tr class='adv_title'>";
						str += "<td>";
						str += (data.rowTotal-((data.nowPage-1)*data.blockList+i));
						str += "</td>";
						str += "<td>";
						str += "<b>"+data.ar[i].co_name+"</b>님 정보<b> || </b>"+data.ar[i].co_phone+"<b> || </b>"+data.ar[i].co_email+"<br/>";
						str += "<b>등록기간: </b>"+data.ar[i].start_date.substring(0,10)+" ~ "+data.ar[i].end_date.substring(0,10)+"<b> || </b>"+data.ar[i].etc;
						str += "</td>";
						str += "<td style='text-align: right;'>";
						if(data.ar[i].status == 0){						
							str += "<input type='button' value='올리기' onclick='advStatus(\""+data.ar[i].a_idx+"\", \"1\", \""+data.ar[i].adv_group+"\", \""+data.nowPage+"\")'/>&nbsp;";
						} else if(data.ar[i].status == 1){
							str += "<span style='color: red;'>!업로드 중!&nbsp;<span>";
							str += "<input type='button' value='내리기' onclick='advStatus(\""+data.ar[i].a_idx+"\", \"0\", \""+data.ar[i].adv_group+"\", \""+data.nowPage+"\")'/>&nbsp;";
						}
						str += "</td>";
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