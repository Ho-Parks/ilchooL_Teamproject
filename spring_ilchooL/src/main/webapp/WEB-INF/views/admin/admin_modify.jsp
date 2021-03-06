<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>admin</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/ico/favicon.png" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath }/assets/ico/apple-touch-icon-144-precomposed.png" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../assets/css/admin_header.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="../assets/plugins/sweetalert/sweetalert2.min.css" />

<style type="text/css">
* {
	font-family: NanumGothic;
}

body {
	padding-top: 50px;
}

.navbar-fixed-top {
	border: 0;
}

.sidebar {
	display: none;
}

@media ( min-width : 768px) {
	.sidebar {
		position: fixed;
		top: 51px;
		bottom: 0;
		left: 0;
		z-index: 1000;
		display: block;
		padding: 20px;
		overflow-x: hidden;
		overflow-y: auto;
		background-color: #f5f5f5;
		border-right: 1px solid #eee;
	}
}

.nav-sidebar {
	margin-right: -21px;
	margin-bottom: 20px;
	margin-left: -20px;
}

.nav-sidebar>li>a {
	padding-right: 20px;
	padding-left: 20px;
}

.nav-sidebar>.active>a, .nav-sidebar>.active>a:hover, .nav-sidebar>.active>a:focus
	{
	color: #fff;
	background-color: #428bca;
}

.main {
	padding: 20px;
}

@media ( min-width : 768px) {
	.main {
		padding-right: 40px;
		padding-left: 40px;
	}
}

.main .page-header {
	margin-top: 0;
}

.main {
	color: #333;
}

.placeholder {
	padding: 30px;
	text-align: left;
}

#btn {
	text-align: center;
}

.modify{
	height: 40px;
    border: solid 2px #333333;
    border-radius: 5px;
    padding: 10px 14px 10px 14px;
}
</style>

</head>

<body>
	<%@include file="admin_header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="${pageContext.request.contextPath}/admin/admin_dashboard.do"><span
							class="glyphicon glyphicon-th"></span> ????????????</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/admin/admin_list.do"><span
							class="glyphicon glyphicon-user"></span> ?????????</a></li>
				</ul>
			</div>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
							<h2 class="page-header">?????? ?????? ??????</h2>
				<form class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath}/admin/edit_ok.do">
					<input type="hidden" name="id" value="${output.id}">
					<!-- ???????????? -->
					<div class="form-group">
						<label for="id" class="col-md-2">#</label>
						<div class="col-md-8">
							<hr />
						</div>
					</div>
					<!--//????????????-->

					<!-- ???????????? -->
					<div class="form-group">
						<label for="user_id" class="col-md-2">?????????</label>
						<div class="col-md-8">
							<input type="text" class="form-control modify" id="user_id" name="user_id" value="${output.user_id}"
								placeholder="???????????? ???????????????"> <span class="error_next_box"></span>
							<hr />
						</div>
					</div>
					<!--//????????????-->

					<!-- ???????????? -->
					<div class="form-group">
						<label for="user_name" class="col-md-2">??????</label>
						<div class="col-md-8">
							<input type="text" class="form-control modify" id="user_name" name="user_name" value="${output.user_name}"
								placeholder="????????? ???????????????"> <span class="error_next_box"></span>
							<hr />
						</div>
					</div>
					<!--//????????????-->

					<!-- ???????????? -->
					<div class="form-group">
						<label for="email" class="col-md-2">?????????</label>
						<div class="col-md-8">
							<input type="text" class="form-control modify" id="email" name="email" value="${output.email}"
								placeholder="???????????? ???????????????"> <span class="error_next_box"></span>
							<hr />
						</div>
					</div>
					<!--//????????????-->

					<!-- ???????????? -->
					<div class="form-group">
						<label for="phone" class="col-md-2">????????????</label>
						<div class="col-md-8">
							<input type="text" class="form-control modify" id="phone" name="phone" value="${output.phone}" placeholder="??????????????? ???????????????">
							<hr />
						</div>
					</div>
					<!--//????????????-->
					
					<!-- ???????????? -->
					<div class="form-group">
						<label for="birthday" class="col-md-2">??????</label>
						<div class="col-md-8">
							<input type="text" class="form-control modify" id="birthday" name="birthday" value="${output.birthday}"
								placeholder="XXXX-XX-XX"> <span class="error_next_box"></span>
							<hr />
						</div>
					</div>
					<!--//????????????-->

					<!-- ???????????? -->
					<div class="form-group">
						<label for="gender" class="col-md-2">??????</label>
						<div class="col-md-8"> 
							<input type="text" class="form-control modify" id="gender" name="gender" value="${output.gender}"
								placeholder="M / F"> <span class="error_next_box"></span>
							<hr />
						</div>
					</div>
					<!--//????????????-->

					<!--????????????-->
					<div class="form-group">
						<label for="content" class="col-md-2">?????? ?????????</label>
						<div class="col-md-8">
							<input id="checkbox" type="checkbox"
								class="btn btn-default outline btn-lg">
						</div>
					</div>
					<!--//????????????-->
					
					<div class="form-group">
						<div id="btn" class="col-md-10">
						<button type="submit" class="btn btn-primary outline">??????</button>
						<a href="${pageContext.request.contextPath}/admin/admin_list.do"><button type="submit" class="btn btn-danger outline">??????</button></a>
						</div>
					</div>
				</form>

			</div>



		</div>
	</div>



</body>


	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>

</html>