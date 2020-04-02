<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.col-md-6 label {
	font-weight: 600;
}

p {
	font-weight: 600;
	color: #0062cc;
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

.order-content {
	padding: 20px;
	min-height: 460px;
	width: 800px;
}
</style>
</head>
<body>
	<div class="col-md-9 order-content">
		<h2 class="heading">
			<strong>Info </strong> Page <span></span>
		</h2>
		<br />
		<div class="tab-pane fade show active" id="home" role="tabpanel"
			aria-labelledby="home-tab">
			<c:choose>
			<c:when test="${userInfo.u_id ne null}">
				<div class="row">
					<div class="col-md-6">
						<label>User Id</label>
					</div>
					<div class="col-md-6">
						<p>${userInfo.u_id }</p>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<div class="col-md-6">
						<label>SNS id</label>
					</div>
					<div class="col-md-6">
						<p>${userInfo.sns_type } 연동</p>
					</div>
				</div>
			</c:otherwise>
			</c:choose>
			<c:if test="${userInfo.u_name ne null}">
			<div class="row">
				<div class="col-md-6">
					<label>Name</label>
				</div>
				<div class="col-md-6">
					<p>${userInfo.u_name }</p>
				</div>
			</div>
			</c:if>
			<div class="row">
				<div class="col-md-6">
					<label>Nick Name</label>
				</div>
				<div class="col-md-6">
					<p>${userInfo.nickname }</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<label>Email</label>
				</div>
				<div class="col-md-6">
					<c:choose>
					<c:when test="${userInfo.email ne null}">
						<p>${userInfo.email }</p>
					</c:when>
					<c:otherwise>
						<p> - </p>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<label>Phone</label>
				</div>
				<div class="col-md-6">
				<c:choose>
					<c:when test="${userInfo.u_phone ne null}">
						<p>${userInfo.u_phone }</p>
					</c:when>
					<c:otherwise>
						<p> - </p>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<label>Reg Date</label>
				</div>
				<div class="col-md-6">
					<p>${userInfo.reg_date }</p>
				</div>
			</div>			
		</div>
	</div>
</body>
</html>