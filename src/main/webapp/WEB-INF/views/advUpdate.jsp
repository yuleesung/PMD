<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/jquery-ui.css"/>
</head>
<body>
	<div id="advInsert" style="width: 898px;">
		<header>
			<h1><i class="fas fa-folder"></i>&nbsp;광고 수정</h1>
			<hr/>
		</header>
		<form action="doAdvUpdate.inc" method="post" enctype="multipart/form-data" name="frm">
			<input type="hidden" name="nowPage" value="${nowPage }"/>
			<input type="hidden" name="a_idx" value="${vo.a_idx }"/>
			<table>
				<colgroup>
					<col width="150px"/>
					<col width="*"/>
					<col width="150px"/>
					<col width="300px"/>
				</colgroup>
				<tr>
					<th>파일 업로드</th>
					<td>
						<input type="file" name="upload" id="upload"/>
						<c:if test="${vo.file_name ne null }">
							<span>(${vo.file_name })</span>
						</c:if>
					</td>
					<th>광고주</th>
					<td>
						<input type="text" name="co_name" id="co_name" value="${vo.co_name }"/>
					</td>
				</tr>
				<tr>
					<th>링크 경로</th>
					<td colspan="3">
						<input type="text" id="adv_link" value="${fn:substring(vo.adv_link, 7, fn:length(vo.adv_link)) }"/>
						<span id="warning"></span>
						<input type="hidden" name="adv_link"/>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<c:if test="${fn:length(vo.co_phone) gt 12 }">
							<input type="text" id="co_phone1" value="${fn:substring(vo.co_phone, 0, 3) }"/>-
							<input type="text" id="co_phone2" value="${fn:substring(vo.co_phone, 4, 8) }"/>-
							<input type="text" id="co_phone3" value="${fn:substring(vo.co_phone, 9, 13) }"/>
							<input type="hidden" name="co_phone" id="co_phone"/>
						</c:if>
						<c:if test="${fn:length(vo.co_phone) lt 12 }">
							<input type="text" id="co_phone1" value="${fn:substring(vo.co_phone, 0, 3) }"/>-
							<input type="text" id="co_phone2" value="${fn:substring(vo.co_phone, 4, 7) }"/>-
							<input type="text" id="co_phone3" value="${fn:substring(vo.co_phone, 8, 11) }"/>
							<input type="hidden" name="co_phone" id="co_phone"/>
						</c:if>
					</td>
					<th>이메일</th>
					<td>
						<input type="text" id="co_email1" value="${fn:substring(vo.co_email, 0, fn:indexOf(vo.co_email, '@')) }"/>@
						<input type="text" id="co_email2" value="${fn:substring(vo.co_email, (fn:indexOf(vo.co_email, '@'))+1, fn:length(vo.co_email)) }"/>
						<input type="hidden" name="co_email" id="co_email"/>
					</td>
				</tr>
				<tr>
					<th>광고순번</th>
					<td colspan="3">
						<input type="radio" name="adv_group" id="adv_group1" value="1"/><span>1번 광고</span>&nbsp;&nbsp;
						<input type="radio" name="adv_group" id="adv_group2" value="2"/><span>2번 광고</span>&nbsp;&nbsp;
						<input type="radio" name="adv_group" id="adv_group3" value="3"/><span>3번 광고</span>&nbsp;&nbsp;
						<input type="radio" name="adv_group" id="adv_group4" value="4"/><span>4번 광고</span>&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<th>시작일</th>
					<td>
						<input type="date" name="start_date" id="start_date" value="${fn:substring(vo.start_date, 0, 4)}-${fn:substring(vo.start_date, 5, 7)}-${fn:substring(vo.start_date, 8, 10)}"/>
					</td>
					<th>종료일</th>
					<td>
						<input type="date" name="end_date" id="end_date" value="${fn:substring(vo.end_date, 0, 4)}-${fn:substring(vo.end_date, 5, 7)}-${fn:substring(vo.end_date, 8, 10)}"/>
					</td>
				</tr>
				<tr>
					<th>메모할 사항</th>
					<td colspan="3">
						<c:if test="${vo.etc eq null }">
							<input type="text" name="etc" id="etc"/>
						</c:if>
						<c:if test="${vo.etc ne null }">
							<input type="text" name="etc" id="etc" value="${vo.etc }"/>
						</c:if>
					</td>
				</tr>
				<tfoot>
					<tr>
						<td colspan="4">
							<input type="button" id="save_btn" value="수정"/> 
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	<input type="hidden" id="adv_group" value="${vo.adv_group }">
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script>
		$(function(){
			
			var adv_groupH = $("#adv_group").val();
			
			switch (adv_groupH) { // DB에 저장된 그룹과 같은 라디오 버튼을 선택하게 하는 기능
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
			
			$("#adv_link").keyup(function(){
				var adv_link = $("#adv_link").val();
				if(!adv_link.startsWith("www.")){
					$("#warning").text("www.을 반드시 입력하세요!");
					return;
				}else{
					$("#warning").text("");
				}
			});
			
			$("#start_date").click(function(){
				var adv_group = $("input[name='adv_group']:checked").val();
				if(adv_group == undefined){
					alert("광고순번을 선택하세요!");
					return;
				}				
			});
			
			$("#end_date").click(function(){
				var adv_group = $("input[name='adv_group']:checked").val();
				if(adv_group == undefined){
					alert("광고순번을 선택하세요!");
					return;
				}
			});
			
			$("#start_date").change(function(){
				var a_idx = $("#a_idx").val();
				var adv_group = $("input[name='adv_group']:checked").val();
				var start_date = $("#start_date").val();
				ajax_check(adv_group, start_date, "시작일", a_idx);
			});
			
			$("#end_date").change(function(){
				var a_idx = $("#a_idx").val();
				var adv_group = $("input[name='adv_group']:checked").val();
				var end_date = $("#end_date").val();
				ajax_check(adv_group, end_date, "종료일", a_idx);
			});
			
			$("input[name='adv_group']").change(function(){
				var adv_group = $("input[name='adv_group']:checked").val();
				var start_date = $("#start_date").val();
				var end_date = $("#end_date").val();
				var a_idx = $("#a_idx").val();
				ajax_bothCheck(adv_group, start_date, end_date, a_idx);
			});
			
			$("#save_btn").click(function(){
				var co_name = $("#co_name").val();
				var adv_link = $("#adv_link").val();
				var co_phone1 = $("#co_phone1").val();
				var co_phone2 = $("#co_phone2").val();
				var co_phone3 = $("#co_phone3").val();
				var co_email1 = $("#co_email1").val();
				var co_email2 = $("#co_email2").val();
				var start_date = $("#start_date").val();
				var end_date = $("#end_date").val();
				var etc = $("#etc").val();
				var adv_group = $("input[name='adv_group']:checked").val();
				
				if(co_name.trim().length < 1){
					alert("광고주를 한 자 이상 입력하세요!");
					$("#co_name").focus();
					return;
				}
				
				if(adv_link.trim().length < 1){
					alert("링크 경로를 한 자 이상 입력하세요!");
					$("#adv_link").focus();
					return;
				}
				
				if(!adv_link.trim().startsWith("www.")){
					alert("반드시 www.로 시작해야합니다!");
					$("#adv_link").focus();
					return;
				}
				
				if(co_phone1.trim().length < 1){
					alert("연락처를 한 자 이상 입력하세요!");
					$("#co_phone1").focus();
					return;
				}
				
				if(co_phone2.trim().length < 1){
					alert("연락처를 한 자 이상 입력하세요!");
					$("#co_phone2").focus();
					return;
				}
				
				if(co_phone3.trim().length < 1){
					alert("연락처를 한 자 이상 입력하세요!");
					$("#co_phone3").focus();
					return;
				}
				
				if(co_email1.trim().length < 1){
					alert("이메일을 한 자 이상 입력하세요!");
					$("#co_email1").focus();
					return;
				}
				
				if(co_email2.trim().length < 1){
					alert("이메일을 한 자 이상 입력하세요!");
					$("#co_email2").focus();
					return;
				}
				
				if(start_date.trim().length < 9){
					alert("날짜를 한 자 이상 입력하세요!");
					$("#start_date").focus();
					return;
				}
				
				if(end_date.trim().length < 9){
					alert("날짜를 한 자 이상 입력하세요!");
					$("#end_date").focus();
					return;
				}
				
				var s_date = start_date.split("-");
				var s_date_t = new Date();
				s_date_t.setFullYear(s_date[0], Number(s_date[1])-1, s_date[2]);
				
				var e_date = end_date.split("-");
				var e_date_t = new Date();
				e_date_t.setFullYear(e_date[0], Number(e_date[1])-1, e_date[2]);
				
				if(!(s_date_t.getTime() < e_date_t.getTime())){
					alert("종료일이 시작일보다 빠릅니다.");
					$("#end_date").focus();
					return;
				}
				
				if(adv_group == undefined){
					alert("광고순번을 선택하세요!");
					return;
				}
				
				$("input[name='adv_link']").val("http://"+adv_link);
				$("#co_phone").val(co_phone1+"-"+co_phone2+"-"+co_phone3);
				$("#co_email").val(co_email1+"@"+co_email2);
				
				
				var con = confirm("수정하시겠습니까?");
				
				if(con){
					document.frm.submit();
				}
				
			});
		});
		
		function ajax_check(adv_group, inputDate, str, a_idx) {
			var param = "adv_group="+encodeURIComponent(adv_group)+"&inputDate="+encodeURIComponent(inputDate)+"&a_idx="+encodeURIComponent(a_idx);
			
			$.ajax({
				url: "checkDateForUpdate.inc",
				type: "post",
				data: param,
				dataType: "json"
			}).done(function(data){
				if(data.chk){
					if(str == "시작일"){
						alert("DB에 등록된 기간과 중복됩니다!");
						$("#start_date").focus();
					}else if(str == "종료일"){
						alert("DB에 등록된 기간과 중복됩니다!");
						$("#end_date").focus();
					}
				}
			}).fail(function(err){
				console.log(err);
			});
		}
		
		function ajax_bothCheck(adv_group, start_date, end_date, a_idx) {
			var param = "adv_group="+encodeURIComponent(adv_group)+"&start_date="+encodeURIComponent(start_date)+"&end_date="+encodeURIComponent(end_date)+"&a_idx="+encodeURIComponent(a_idx);
			
			$.ajax({
				url: "checkBothDateForUpdate.inc",
				type: "post",
				data: param,
				dataType: "json"
			}).done(function(data){
				if(data.start_chk){
					alert("시작일이 DB에 등록된 기간과 중복됩니다!");
					$("#start_date").focus();
				} else if(data.end_chk){
					alert("종료일이 DB에 등록된 기간과 중복됩니다!");
					$("#end_date").focus();
				} else if(data.start_chk && data.end_chk){
					alert("시작일과 종료일 모두 DB에 등록된 기간과 중복됩니다!");
				}
			}).fail(function(err){
				console.log(err);
			});
		}
		
	</script>
</body>
</html>