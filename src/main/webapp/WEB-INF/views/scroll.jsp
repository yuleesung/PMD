<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
#tothetop {
	position: fixed;
	right: 8%;
	bottom: 5%;
	width: 65px;
	height: 65px;
	cursor: pointer;
	display: none;
}

</style>
</head>
<body>

<a id="tothetop">
	<!-- <img style="all: unset; width: 100%; height: 100%;" src= "resources/images/tothetop.png"
	onmouseup="this.src='resources/images/tothetopOn.png'" title="맨위로" id="scroll_img"/> -->
	 <img style="all: unset; width: 100%; height: 100%;" src= "resources/images/tothetop.png"
	onmouseup="this.src='resources/images/tothetopOn.png'" title="맨위로" id="scroll_img"/>
</a>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$(window).scroll(function() {
		if ( $( this ).scrollTop() > 400 ) {
			$("#tothetop").fadeIn();
		} else {
			$("#tothetop").fadeOut();
			$('#scroll_img').attr("src", "resources/images/tothetop.png");
		}
		
    });

	
	$("#tothetop").click( function() {
		$('html, body').animate( { scrollTop : 0 }, 1000 );
		
		return false;
	});
});

</script>
</body>
</html>