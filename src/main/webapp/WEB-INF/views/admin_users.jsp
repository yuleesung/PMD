<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<style>
	tbody tr:hover{
		background-color: rgba(106,153,203, 0.2);
	}
</style>
<head>
<meta charset="UTF-8">
</head>
<body>

	<div id="memberSetting" style="width: 898px; margin: 0;">
		<h2> 관리자 - 회원관리</h2>
		<form action="">
		<fieldset>
			<legend>회원 검색</legend>
			<div title="회원검색">
			<label><input type="radio" value="all" name="choice" checked="checked"/>전체</label>
			<label><input type="radio" value="normal" name="choice" />일반회원</label>
			<label><input type="radio" value="social" name="choice" />소셜회원</label>
			&nbsp;&nbsp;&nbsp;
			<label>상태:</label>
			<input type="checkbox" value="total" name="chk" id="total" />전체
			<input type="checkbox" value="active" name="chk" />활동중
			<input type="checkbox" value="stop" name="chk" />활동정지
			<input type="checkbox" value="leave" name="chk"  />탈퇴
			<br/>
			<label for="u_id">아이디:</label> <input type="text" name="u_id" id="u_id"/>
			<label for="nickname">닉네임: </label> <input type="text" name="nickname" id="nickname" />
			<label for="u_name">이름: </label> <input type="text" name="u_name" id="u_name" /><br/>
			<label for="email">이메일: </label> <input type="text" name="email" id="email" />
			<label for="sns_id">소셜 아이디: </label> <input type="text" name="sns_id" id="sns_id" />
			<label for="reg_date">가입일: </label> <input type="date" name="reg_date" id="reg_date" title="가입일" /><br/>
			
			<input type="button" value="검색" id="userSrch" />
			</div>
		</fieldset>
		</form>
		
		<pre> 총 ${rowTotal } 명</pre>
		<hr/>
		<table id="users_t">
			<caption style="text-indent: -9999px;">관리자페이지 - 회원관리</caption>
			<colgroup>
				<col width="50px;">
				<col width="60px;" />
				<col width="60px;" />
				<col width="60px;" />
				<col width="115px;" />
				<col width="*" />
				<col width="90px;" />
				<col width="90px;" />
				<col width="99px;" />
				<col width="80px;" />
				<col width="120px;" />
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
					<tr onclick="userComm('${vo.u_idx}', '${nowPage }')">
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
		        	<td colspan="10">
		          		<div class="pagination-wrap">${pageCode }</div>
		          	</td>
		        </tr>
		    </tfoot>
		</table>
	</div>
	
	<form action="">
		<c:forEach var="c_list" items="${ar[6].c_list }" varStatus="st">
			<p>${st.index } <c:out value="${c_list.c_content }"/></p>
		</c:forEach>
	</form>
	
	
	
	


	<script src="resources/js/jquery-3.4.1.min.js"></script> 
	<script>
	
	function lock(u_idx, status, nowPage){
		if(confirm('정지 시키겠습니까?')) { //yes 
			status = 2;
			
			// 인자로 보낼 u_idx, status 
			var param = "u_idx="+encodeURIComponent(u_idx)+"&status="+encodeURIComponent(status)+
						"&nowPage="+encodeURIComponent(nowPage);
			
			ajax_a(param);
			
		} else { //no 
			
		}
	}
	function unlock(u_idx, status, nowPage){
		if(confirm('정지해지 하시겠습니까?')) { //yes 
			status = 0;
		
			// 인자로 보낼 u_idx, status 
			var param = "u_idx="+encodeURIComponent(u_idx)+"&status="+encodeURIComponent(status)+
						"&nowPage="+encodeURIComponent(nowPage);
			
			ajax_a(param);
			
		} else { //no 
			
		}
	}
	
	function page(nowPage){
		var param = "nowPage="+encodeURIComponent(nowPage);
		
		ajax_a(param);
	}
	
	function ajax_a(param){
		$.ajax({
			url: "memLock.inc",
			type: "post",
			data: param,
			dataType: "json"
			
		}).done(function(data){
			if(data.ar.length > 0){
				var str = "";
				for(var i=0; i<data.ar.length; i++){
					str += "<tr>";
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
				
				$("#users_t tbody").html(str);
				$(".pagination-wrap").html(data.pageCode);
			}
			
			
		}).fail(function(err){
			console.log(err);
		});
	}
	
	function userComm(u_idx, nowPage){
		
		var param = "u_idx="+encodeURIComponent(u_idx)+"&nowPage="+encodeURIComponent(nowPage);
		$.ajax({
			url: "admin_userComm.inc",
			type: "post",
			data: param,
			dataType: "json"
			
		}).done(function(data){
			
			//location.href = "admin_userComm_frm.inc";
		}).fail(function(err){
			console.log(err);
		});			
			
	}
	
	
	$(function(){
		
		
		$(document).ready(function(){
			$("input[type=checkbox]").each(function(){
				$(this).prop('checked', true);
			});
		});
		
		// 상태: '전체' 선택 했을 경우
		$("#total").click(function(){
			if($("#total").prop("checked")){
				$("input[name=chk]").prop("checked", true);
			}else{
				$("input[name=chk]").prop("checked", false);
			}
		});
		
		if($("input[type=checkbox]") && !$("checkboox[value='total']")){
			$("#total").prop("checked", false);
		}
		
		
		// 회원검색 클릭했을 때,
		$("#userSrch").on("click", function(){
			var u_id = $("#u_id").val().trim();
			var nickname = $("#nickname").val().trim();
			var u_name = $("#u_name").val().trim();
			var email = $("#email").val().trim();
			var sns_id = $("#sns_id").val().trim();
			var reg_date = $("#reg_date").val().trim();
		});
		
		
	});
		
	</script>
	

	

</body>
</html>