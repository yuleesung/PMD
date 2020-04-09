<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<div id="memberSetting" style="width: 898px; margin: 0;">
		<h2> 관리자 - 회원관리</h2>
		<table>
			<caption style="text-indent: -9999px;">관리자페이지 - 회원관리</caption>
			<colgroup>
				<col width="63px;" />
				<col width="63px;" />
				<col width="115px;" />
				<col width="140px;" />
				<col width="115px;" />
				<col width="95px;" />
				<col width="99px;" />
				<col width="85px;" />
				<col width="120px;" />
			</colgroup>
			<thead>
				<tr style="text-align: center;">
					<th>아이디 </th>
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
				<c:forEach var="vo" items="${ar }" >
					<tr>
						<td>${vo.u_id }</td>
						<td>${vo.u_name }</td>
						<td>${vo.u_phone }</td>
						<td>${vo.email }</td>
						<td>${vo.sns_id }</td>
						<td>${vo.sns_type }</td>
						<td>${fn:substring(vo.reg_date, 0, 10) }</td>
						<td id="stat">
						<c:choose>
							<c:when test="${vo.status == 0 }">활동중</c:when>
							<c:when test="${vo.status == 1 }">탈퇴</c:when>
							<c:when test="${vo.status == 2 }"> 활동정지</c:when>
						</c:choose>
						</td>	
						<td>
							<button type="button" onclick="lock('${vo.u_idx}', '${vo.status }')">정지</button>
							<button type="button" onclick="unlock('${vo.u_idx}', '${vo.status } }')">해제</button>
						</td>
					</tr>
				</c:forEach>	
			</tbody>
		</table>
	</div>


	<script src="resources/js/jquery-3.4.1.min.js"></script> 
	<script>
	
	function lock(u_idx, status){
		if(confirm('정지 시키겠습니까?')) { //yes 
			status = 2;
			
			// 인자로 보낼 u_idx, status 
			var param = "u_idx="+encodeURIComponent(u_idx)+"&status="+encodeURIComponent(status);
			
			
			$.ajax({
				url: "memLock.inc",
				type: "post",
				data: param,
				dataType: "json"
				
			}).done(function(data){
				if(data.res){
					document.getElementById("stat").innerHTML="활동정지";
				}else
					alert("정지 시키지 못했습니다.");
				
				
			}).fail(function(err){
				console.log(err);
			});
		} else { //no 
			
		}
	}
	function unlock(u_idx, status){
		if(confirm('정지해지 하시겠습니까?')) { //yes 
			status = 0;
		
			// 인자로 보낼 u_idx, status 
			var param = "u_idx="+encodeURIComponent(u_idx)+"&status="+encodeURIComponent(status);
			
			
			$.ajax({
				url: "memLock.inc",
				type: "post",
				data: param,
				dataType: "json"
				
			}).done(function(data){
				if(data.res){
					document.getElementById("stat").innerHTML="활동중";
				}else
					alert("정지 시키지 못했습니다.");
				
				
			}).fail(function(err){
				console.log(err);
			});
		} else { //no 
			
		}
	}
	
	
	</script>
	

	

</body>
</html>