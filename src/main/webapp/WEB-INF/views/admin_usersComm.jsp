<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="memberSetting" style="width: 898px; margin: 0;">
	<form action="#" name="myForm" method="post">
		<table id="comm_t" style="width: 100%;">
			<caption>회원관리 > 댓글</caption>
			<colgroup>
				<col width="20px;" />
				<col width="60px;" />
				<col width="*" />
				<col width="100px;" />
				<col width="80px;" />
				<col width="120px;" />
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" value="전체 선택" onclick="this.value=check(this.form.list)"></th>
					<th>작성자</th>
					<th>내용</th>
					<th>등록일</th>
					<th>상태</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					
				</tr>
			</tbody>
		</table>
	</form>	
	</div>
	
	
	<script>
	var checkFlag = 'false'; // false면 전체선택, true이면 전체해제

	function check(field) {
	    if(checkFlag == 'false') {
	        for(i = 0; i < field.length; i++) {
	            field[i].checked = true; // 모든 체크박스를 체크한다.
	        }
	        checkFlag = "true";
	        return "전체 해제"; // 버튼객체의 value속성으로 반환(this.value.list로 넘겨져왔기 때문에)
	    } else {
	        for(i = 0; i < field.length; i++) {
	            field[i].checked = false; // 모든 체크박스를 해제한다.
	        }
	        checkFlag = "false";
	        return "전체 선택"; // 버튼객체의 vaule속성으로 반환
	    }
	}	
	</script>

</body>
</html>