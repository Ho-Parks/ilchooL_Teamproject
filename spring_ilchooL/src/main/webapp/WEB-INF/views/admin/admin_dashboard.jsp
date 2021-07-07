<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,
  maximum-scale=1.0,user-scalable=no">
<title>Admin</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../assets/css/admin_header.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
</style>
</head>

<body>

	<%@include file="admin_header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="admin_dashboard.jsp"><span
							class="glyphicon glyphicon-th"></span> 대시보드</a></li>
					<li><a href="admin_list.jsp"><span
							class="glyphicon glyphicon-user"></span> 사용자</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h2 class="page-header">대시보드</h2>
				<div class="row placeholders">
					<div class="col-xs-6 col-md-4 placeholder">
						<h3 style="display: block; text-align: center;">DAU</h3>
						<img src="../assets/img/graph_3.png" style="width: 100%"
							class="img-responsive" alt="graph">
					</div>
					<div class="col-xs-6 col-md-4 placeholder">
						<h3 style="display: block; text-align: center;">WAU</h3>
						<img src="../assets/img/graph_2.png" style="width: 100%"
							class="img-responsive" alt="graph">
					</div>
					<div class="col-xs-6 col-md-4 placeholder">
						<h3 style="display: block; text-align: center;">MAU</h3>
						<img src="../assets/img/graph_1.png" style="width: 100%"
							class="img-responsive" alt="graph">
					</div>

				</div>
				<div class="row placeholders">
					<div class="col-xs-6 col-md-6 placeholder">
						<h3 style="display: block; text-align: center;">사용자 수 추이</h3>
						<img src="../assets/img/graph_4.png" style="width: 100%"
							class="img-responsive" alt="graph">
					</div>
					<div class="col-xs-6 col-md-6 placeholder">
						<h3 style="display: block; text-align: center;">OS/디바이스별</h3>
						<img src="../assets/img/graph_5.png" style="width: 100%"
							class="img-responsive" alt="graph">
					</div>

				</div>
				<h3 class="sub-header" style="margin-top: 50px; text-align: center;">페이지별/켐페인별</h3>
				<img src="../assets/img/graph_6.png" style="width: 100%"
					class="img-responsive" alt="graph">
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>컬럼1</th>
								<th>컬럼2</th>
								<th>컬럼3</th>
								<th>컬럼4</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>101</td>
								<td>101</td>
								<td>101</td>
								<td>101</td>
								<td>101</td>
							</tr>
							<tr>
								<td>101</td>
								<td>101</td>
								<td>101</td>
								<td>101</td>
								<td>101</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>

</html>