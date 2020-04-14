<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/jquery-ui.css"/>
</head>
<body>
	<div style="width: 898px;">
		<header>
			<h1>광고 넣기</h1>
			<hr/>
		</header>
		<form action="advInsert.inc" method="post" enctype="multipart/form-data" name="frm">
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
					</td>
					<th>광고주</th>
					<td>
						<input type="text" name="co_name" id="co_name"/>
					</td>
				</tr>
				<tr>
					<th>링크 경로</th>
					<td colspan="3">
						<input type="text" id="adv_link"/>
						<span id="warning"></span>
						<input type="hidden" name="adv_link"/>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" id="co_phone1"/>-
						<input type="text" id="co_phone2"/>-
						<input type="text" id="co_phone3"/>
						<input type="hidden" name="co_phone" id="co_phone"/>
					</td>
					<th>이메일</th>
					<td>
						<input type="text" id="co_email1"/>@
						<input type="text" id="co_email2"/>
						<input type="hidden" name="co_email" id="co_email"/>
					</td>
				</tr>
				<tr>
					<th>광고순번</th>
					<td colspan="3">
						<input type="radio" name="adv_group" value="1"/><span>1번 광고</span>&nbsp;&nbsp;
						<input type="radio" name="adv_group" value="2"/><span>2번 광고</span>&nbsp;&nbsp;
						<input type="radio" name="adv_group" value="3"/><span>3번 광고</span>&nbsp;&nbsp;
						<input type="radio" name="adv_group" value="4"/><span>4번 광고</span>&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<th>시작일</th>
					<td>
						<input type="date" name="start_date" id="start_date"/>
					</td>
					<th>종료일</th>
					<td>
						<input type="date" name="end_date" id="end_date"/>
					</td>
				</tr>
				<tr>
					<th>메모할 사항</th>
					<td colspan="3">
						<input type="text" name="etc" id="etc"/>
					</td>
				</tr>
				<tfoot>
					<tr>
						<td colspan="4">
							<input type="button" id="save_btn" value="저장"/>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script>
		$(function(){
			
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
				var adv_group = $("input[name='adv_group']:checked").val();
				var start_date = $("#start_date").val();
				ajax_check(adv_group, start_date, "시작일");
			});
			
			$("#end_date").change(function(){
				var adv_group = $("input[name='adv_group']:checked").val();
				var end_date = $("#end_date").val();
				ajax_check(adv_group, end_date, "종료일");
			});
			
			$("#save_btn").click(function(){
				var upload = $("#upload").val();
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
				
				if(upload.length < 1){
					alert("파일을 첨부하세요!");
					return;
				}
				
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
				
				document.frm.submit();
				
			});
		});
		
		function ajax_check(adv_group, inputDate, str) {
			var param = "adv_group="+encodeURIComponent(adv_group)+"&inputDate="+encodeURIComponent(inputDate);
			
			$.ajax({
				url: "checkDate.inc",
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
		
	</script>
</body>
</html>