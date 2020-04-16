<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#tothetop {
	position: fixed;
	right: 10%;
	bottom: 5%;
	width: 60px;
	height: 60px;
	cursor: pointer;
}

</style>
</head>
<body>

<a id="tothetop">
	<img style="all: unset; width: 100%; height: 100%;" src="resources/images/tothetop.png" 
	onmousedown="this.src='resources/images/tothetopOn.png'" 
	onmouseup="this.src='resources/images/tothetop.png'" title="맨위로"/>
</a>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#tothetop").click( function() {
		$('html, body').animate( { scrollTop : 0 }, 400 );
		
		return false;
	});
});

</script>
</body>
</html>