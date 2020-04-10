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
		<table id="users_t">
			<caption style="text-indent: -9999px;">관리자페이지 - 회원관리</caption>
			<colgroup>
				<col width="50px;">
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
					<th>NO</th>
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
				<c:forEach var="vo" items="${ar }" varStatus="st" >
					<tr>
						<td>${rowTotal - ((nowPage-1)*blockList+st.index) }</td>
						<td>${vo.u_id }</td>
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
	
	
	</script>
	

	

</body>
</html>