<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.form_main {
	width: 100%;
}

.form_main h4 {
	font-family: roboto;
	font-size: 20px;
	font-weight: 300;
	margin-bottom: 15px;
	margin-top: 20px;
	text-transform: uppercase;
}

.heading {
	border-bottom: 1px solid #A9A59F;
	padding-bottom: 9px;
	position: relative;
}

.heading span {
	background: #6D6C6A none repeat scroll 0 0;
	bottom: -2px;
	height: 3px;
	left: 0;
	position: absolute;
	width: 75px;
}

.form {
	border-radius: 7px;
	padding: 6px;
}

.txt[type="text"] {
	border: 1px solid #ccc;
	margin: 5px 0;
	padding: 4px 0 4px 5px;
	border-radius: 5px;
	width: 80%;
}

.txt[type="password"] {
	border: 1px solid #ccc;
	margin: 5px 0;
	padding: 4px 0 4px 5px;
	border-radius: 5px;
	width: 80%;
}

.txt2:hover {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	color: #949390;
	transition: all 0.5s ease 0s;
}
.order-content {
  padding: 20px;
  min-height: 460px;
  width: 800px;
}

</style>
</head>
<body>
	<div class="col-md-9 order-content">
		<div class="form_main">
			<h2 class="heading">
				<strong>Personal </strong> Contact <span></span>
			</h2><br/>
			<div class="form">
				<form action="" method="" id="contactFrm" name="contactFrm">
					<input type="text" required="" placeholder="Name" value=""
						name="name" class="txt"><br/> <input type="text" required=""
						placeholder="Email" value="" name="email" class="txt"><br/> <input
						type="password" required="" placeholder="Change Pwd" value=""
						name="password" class="txt"><br/><br/><br/>
					<button type="button" class="btn btn-default">Update</button>
				</form>
			</div>
		</div>

	</div>
</body>
</html>