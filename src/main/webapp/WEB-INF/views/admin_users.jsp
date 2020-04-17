<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui.min.css" />
<style>
	#users_t tbody tr:hover{
		background-color: rgba(106,153,203, 0.2);
	}
	
	#CommPopup{
		display: none;
	}
</style>
</head>
<body>

	<div id="memberSetting" style="width: 898px; margin: 0;">
		<h1><i class="fas fa-folder"></i>&nbsp;관리자 - 회원관리</h1>
		<table id="srch_t">
			<caption style="text-indent: -9999px;">회원 검색</caption>
			<tbody>
				<tr>
					<th>가입유형 :</th>
					<td colspan="2"><label><input type="radio" value="all" name="choice" checked="checked"/>전체</label>
						<label><input type="radio" value="normal" name="choice" />일반회원</label>
						<label><input type="radio" value="social" name="choice" />소셜회원</label>
					</td>
					<th>상태 :</th>
					<td colspan="3">
						<input type="checkbox" value="total" name="chk" id="total" />전체
						<input type="checkbox" value="active" name="chk" id="active" />활동중
						<input type="checkbox" value="stop" name="chk" id="stop" />활동정지
						<input type="checkbox" value="leave" name="chk" id="leave"/>탈퇴
					</td>
				</tr>
				<tr>
					<th><label for="u_id">아이디:</label> </th> 
					<td colspan="2"><input type="text" name="u_id" id="u_id"/> </td>
					<th><label for="sns_id">소셜 아이디: </label> </th>
					<td colspan="2"><input type="text" name="sns_id" id="sns_id" /></td>
				</tr>
				<tr>
					<th><label for="u_name">이름: </label></th> 
					<td colspan="2"><input type="text" name="u_name" id="u_name" /></td>
					<th><label for="nickname">닉네임: </label></th> 
					<td colspan="2"><input type="text" name="nickname" id="nickname" /></td>
				</tr>
				<tr>
					<th><label for="email">이메일: </label></th>
					<td colspan="2"><input type="text" name="email" id="email" /></td>
					<th><label for="reg_date">가입일: </label> </th>
					<td colspan="2"><input type="date" name="reg_date" id="reg_date" title="가입일" /></td>
				</tr>
				<tr>
					<td colspan="5" style="text-align: center;">
						<input type="button" value="검색" id="userSrch" style="border-radius: 5px; font-size: 20px; font-weight: bold; padding: 10px; border: 1px solid rgba(0, 0, 0, 0.5); cursor: pointer;"/>
					</td>
				</tr>
			</tbody>
		</table>
		
		
		
		
		<pre> 총 ${rowTotal } 명</pre>
		<hr/>
		<table id="users_t"> 
			<caption style="text-indent: -9999px;">관리자페이지 - 회원관리</caption>
			<colgroup>
				<col width="50px">
				<col width="70px"/>
				<col width="70px"/>
				<col width="70px"/>
				<col width="70px"/>
				<col width="*"/>
				<col width="70px"/>
				<col width="70px"/>
				<col width="70px"/>
				<col width="70px"/>
				<col width="100px"/>
			</colgroup>
			<thead>
				<tr style="text-align: center;">
					<th>NO.</th>
					<th>아이디 </th>
					<th>닉네임</th>
					<th>이름 </th>
					<th>연락처 </th>
					<th>이메일 </th> 
					<th>소셜 아이디</th> 
					<th>연동 사이트 </th>
					<th>가입일 </th>
					<th>상태 </th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${ar }" varStatus="st" >
					<tr onclick="userComm('${vo.u_idx}', '${vo.nickname }')" style="cursor: pointer;">
						<td>${rowTotal - ((nowPage-1)*blockList+st.index) }</td>
						<td>${vo.u_id}</td>
						<td>${vo.nickname }</td>
						<td>${vo.u_name }</td>
						<td>${vo.u_phone }</td>
						<td>${vo.email }</td>
						<td>${vo.sns_id }</td>
						<td>${vo.sns_type }</td>
						<td>${fn:substring(vo.reg_date, 0, 10) }</td>
						<td>
						<c:choose>
							<c:when test="${vo.status eq 0 }">활동중</c:when>
							<c:when test="${vo.status eq 1 }">탈퇴</c:when>
							<c:when test="${vo.status eq 2 }"> 활동정지</c:when>
						</c:choose>
						</td>	
						<td>
							<button type="button" onclick="lock('${vo.u_idx}', '${vo.status }', '${nowPage }')">정지</button>
							<button type="button" onclick="unlock('${vo.u_idx}', '${vo.status }', '${nowPage }')">해제</button>
						</td>
					</tr>
					
				</c:forEach>	
			</tbody>
			<tfoot>
		    	<tr>
		        	<td colspan="11">
		          		<div class="pagination-wrap">${pageCode }</div>
		          	</td>
		        </tr>
		    </tfoot>
		</table>
	</div>
	

	
	<div id="CommPopup">
			<form action="#" name="myForm" method="post">
				<table id="comm_t" style="width: 100%;">
					<caption>회원님의 댓글</caption>
					<colgroup>
						<col width="50px;" />
						<col width="*" />
						<col width="120px;" />
						<col width="80px;" />
						<col width="120px;" />
					</colgroup>
					<thead>
						<tr>
							<th></th>
							<th>내용</th>
							<th>등록일</th>
							<th>상태</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">
								<div class="pagination-wrap"></div>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>	
	
	
	
	


	<script src="resources/js/jquery-3.4.1.min.js"></script> 
	<script src="resources/js/jquery-ui.min.js"></script>
	<script>
	
	function lock(u_idx, status, nowPage){
		if(confirm('정지 시키겠습니까?')) { //yes 
			status = 2;
			
			// 인자로 보낼 u_idx, status 
			var param = "u_idx="+encodeURIComponent(u_idx)+"&status="+encodeURIComponent(status)+
						"&nowPage="+encodeURIComponent(nowPage);
			
			ajax_a(param, "memLock.inc");
			
		} else { //no 
			
		}
	}
	function unlock(u_idx, status, nowPage){
		if(confirm('정지해지 하시겠습니까?')) { //yes 
			status = 0;
		
			// 인자로 보낼 u_idx, status 
			var param = "u_idx="+encodeURIComponent(u_idx)+"&status="+encodeURIComponent(status)+
						"&nowPage="+encodeURIComponent(nowPage);
			
			ajax_a(param, "memLock.inc");
			
		} else { //no 
			
		}
	}
	
	function page(nowPage){
		var param = "nowPage="+encodeURIComponent(nowPage);
		
		ajax_a(param, "memLock.inc");
	}
	
	function ajax_a(param, url){
		$.ajax({
			url: url,
			type: "post",
			data: param,
			dataType: "json"
			
		}).done(function(data){
			
			console.log(data.ar);
			if(data.ar != null){
				var str = "";
				var set = '<c:set value="${vo.u_id }" var="u_id" />';
				for(var i=0; i<data.ar.length; i++){
					str += set;
					str += "<tr onclick='userComm(\""+data.ar[i].u_idx+"\")' style='cursor: pointer;'>";
					str += "<td>"+(data.rowTotal - ((data.nowPage-1)*data.blockList+i))+"</td>";
					str += "<td>"+data.ar[i].u_id+"</td>";
					str += "<td>"+data.ar[i].nickname+"</td>";
					str += "<td>"+data.ar[i].u_name+"</td>";
					str += "<td>"+data.ar[i].u_phone+"</td>";
					str += "<td>"+data.ar[i].email+"</td>";
					if(data.ar[i].sns_id == null){
						str += "<td></td>";
					}else
						str += "<td>"+data.ar[i].sns_id+"</td>";
					
					if(data.ar[i].sns_type == null){
						str += "<td></td>";
					}else{
						str += "<td>"+data.ar[i].sns_type+"</td>";
					}
					str += "<td>"+data.ar[i].reg_date.substring(0, 10)+"</td>";
					str += "<td>";
					if(data.ar[i].status == '0'){
						str += "활동중";
					}else if(data.ar[i].status == '1'){
						str += "탈퇴";
					}else if(data.ar[i].status == '2'){
						str += "활동정지";
					}
					str += "</td>";	
					str += "<td>";	
					str += "<button type='button' onclick='lock(\""+data.ar[i].u_idx+"\", \""+data.ar[i].status+"\", \""+data.nowPage+"\")'>정지</button>";
					str += "&nbsp;<button type='button' onclick='unlock(\""+data.ar[i].u_idx+"\", \""+data.ar[i].status+"\", \""+data.nowPage+"\")'>해제</button>";
					str += "</td>";
				str += "</tr>";
				
				} //for문 끝;
				$("#memberSetting pre").text(" 총 "+data.rowTotal+" 명");
				$("#users_t tbody").html(str);
				$(".pagination-wrap").html(data.pageCode);
			}else {
				var str = "<tr><td colspan='11' style='text-align: center;'>검색 결과가 없습니다.</td></tr>";
				$("#memberSetting pre").text(" 총 0 명");
				$("#users_t tbody").html(str);
				$(".pagination-wrap").html("");
			}
			
			
		}).fail(function(err){
			console.log(err);
		});
	}
	
	// 회원별 댓글 모음
	function userComm(u_idx, nickname){
		
		$("#CommPopup").dialog({
			title : "회원 관리 > 댓글",
			width : 750,
			height: 500,
			position: ["center"],
			modal : true
		});
		
		var param = "u_idx="+encodeURIComponent(u_idx)+"&nickname="+encodeURIComponent(nickname);
		ajax_b(param, "admin_userComm.inc");
	}
		
	$(function(){
		
		$("#CommPopup").hide(); // dialog창 숨기기
		
		
		// 처음 페이지 로드될때 상태가 모두 체크되도록
		$("input[type=checkbox]").each(function(){
			$(this).prop('checked', true);
		});
	
		// 상태: '전체' 선택 했을 경우
		$("#total").click(function(){
			if($("#total").prop("checked")){
				$("input[name=chk]").prop("checked", true);
			}else{
				$("input[name=chk]").prop("checked", false);
			}
		});
		
		$("#active").change(function(){
			
			if(!($("#active").prop("checked"))){
				$("#total").prop("checked", false);
			}
			chk();
		});
		
		$("#stop").change(function(){
			
			if(!($("#stop").prop("checked"))){
				$("#total").prop("checked", false);
			}
			chk();
		});
		
		$("#leave").change(function(){
			
			if(!($("#leave").prop("checked"))){
				$("#total").prop("checked", false);
			}
			chk();
		});
		
		
		
		
		
		// 회원검색 클릭했을 때,
		$("#userSrch").on("click", function(){
			var u_id = $("#u_id").val().trim();
			var nickname = $("#nickname").val().trim();
			var u_name = $("#u_name").val().trim();
			var email = $("#email").val().trim();
			var sns_id = $("#sns_id").val().trim();
			var reg_date = $("#reg_date").val().trim();
			var radio = $("input[name='choice']:checked").val();
			var check = $('input:checkbox[name="chk"]:checked');
			var check_ar = [];
			
			for(var i=0; i<check.length; i++){
				check_ar[i] = check[i].value;
			}
			
			var param = "choice="+encodeURIComponent(radio);
			
			if(u_id.length > 0){
				param += "&u_id="+encodeURIComponent(u_id);
			}
			if(nickname.length > 0){
				param += "&nickname="+encodeURIComponent(nickname);
			}
			if(u_name.length > 0){
				param += "&u_name="+encodeURIComponent(u_name);
			}
			if(email.length > 0){
				param += "&email="+encodeURIComponent(email);
			}
			if(sns_id.length > 0){
				param += "&sns_id="+encodeURIComponent(sns_id);
			}
			if(reg_date.length > 0){
				param += "&reg_date="+encodeURIComponent(reg_date);
			}
			var active = "";
			var stop = "";
			var leave = "";
			
			
			if(check.length > 3){
				param += "&total=true";
			}else{
				for(var i=0; i<check_ar.length; i++){

					if(check_ar[i] == 'active'){
						active = check_ar[i];
					}
					if(check_ar[i] == 'stop'){
						stop = check_ar[i];
					}
					if(check_ar[i] == 'leave'){
						leave = check_ar[i];
					}
				}
				
				if(active == 'active' && stop == 'stop'){
					param += "&active="+encodeURIComponent(active)+"&stop="+encodeURIComponent(stop);
				}else if(active == 'active' && leave == 'leave'){
					param += "&active="+encodeURIComponent(active)+"&leave="+encodeURIComponent(leave);
				}else if(stop == 'stop' && leave == 'leave'){
					param += "&stop="+encodeURIComponent(stop)+"&leave="+encodeURIComponent(leave);
				}else if(active == 'active'){
					param += "&active="+encodeURIComponent(active);
				}else if(stop == 'stop'){
					param += "&stop="+encodeURIComponent(stop);
				}else if(leave == 'leave'){
					param += "&leave="+encodeURIComponent(leave);
				}
			}
			
			if(check.length < 1){
				alert("상태값을 반드시 1개 이상 선택하세요!!");
				return;
			}
			
			ajax_a(param, "memSearch.inc");
			
		});
		
		
	});
	
	function chk(){

		var chk1 = $("#active").prop("checked");
		var chk2 = $("#stop").prop("checked");
		var chk3 = $("#leave").prop("checked");
		
		if(chk1==true && chk2==true&& chk3==true){
			$("#total").prop("checked", true);
		}
	}
	
	function ajax_b(param, url){
		$.ajax({
			url: url,
			type: "post",
			data: param,
			dataType: "json"
		}).done(function(data){
			
			if(data.ar != null){
				
				var str ="";
				for(var i=0; i<data.ar.length; i++){
					str += "<tr>";
					str += "<td>"+(data.rowTotal - ((data.nowPage-1)*data.blockList+i))+"</td>";
					str += "<td>"+data.ar[i].c_content+"</td>";
					str += "<td>"+data.ar[i].write_date.substring(0, 10)+"</td>";
					str += "<td>";
					switch (data.ar[i].status) {
						case '0':
							str += "게시";
							break;
						case '1':
							str += "삭제";
							break;
					}
				str += "</td>";	
				str += "<td>";
				str += "<input type='button' onclick='del(\""+data.ar[i].c_idx+"\", \""+data.nowPage+"\", \""+data.nickname+"\", \""+data.ar[i].u_idx+"\")' value='삭제'/>";
				str += "<input type='button' onclick='restore(\""+data.ar[i].c_idx+"\", \""+data.nowPage+"\", \""+data.nickname+"\", \""+data.ar[i].u_idx+"\")' value='복구' />";
				str += "</td>";
				str += "</tr>";
				}
				$('#CommPopup #comm_t caption').text(data.nickname+"회원님의 댓글("+data.count+")");
				$("#CommPopup #comm_t tbody").html(str);
				
				if(data.count >10){
					$("#CommPopup #comm_t tfoot td .pagination-wrap").html(data.pageCode);
				}
			}else{
				var str ="";
				str += "<tr>";
					str += "<td colspan='4' style='text-align: center;'>등록된 댓글이 없습니다.";
					str += "</td>";	
				str += "</tr>";
				$('#CommPopup #comm_t caption').text(data.nickname+"회원님의 댓글");
				
				$("#CommPopup #comm_t tbody").html(str);
			}
			
		}).fail(function(err){
			console.log(err);
		});
	}
	
	function del(c_idx, nowPage, nickname, u_idx){
		var param = "nowPage="+encodeURIComponent(nowPage)+"&c_idx="+encodeURIComponent(c_idx)+"&nickname="+encodeURIComponent(nickname)+"&u_idx="+encodeURIComponent(u_idx)+"&check=del";
		
		var con = confirm("삭제하시겠습니까?");
		if(con)
			ajax_b(param, "admin_statusComm.inc");
	}
	
	function restore(c_idx, nowPage, nickname, u_idx){
		var param = "nowPage="+encodeURIComponent(nowPage)+"&c_idx="+encodeURIComponent(c_idx)+"&nickname="+encodeURIComponent(nickname)+"&u_idx="+encodeURIComponent(u_idx)+"&check=restore";
		
		var con = confirm("복구하시겠습니까?");
		if(con)
			ajax_b(param, "admin_statusComm.inc");
	}
	
	
	function pageComm(nowPage, u_idx, nickname){
		
		var param = "nowPage="+encodeURIComponent(nowPage)+"&u_idx="+encodeURIComponent(u_idx)+"bnickname="+encodeURIComponent(nickname);
		
		ajax_b(param, "admin_userComm.inc");
	}
	</script>
	

	

</body>
</html>