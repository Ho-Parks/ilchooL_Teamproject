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
</style>
</head>

<body>

	<%@include file="admin_header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="admin_dashboard.jsp"><span
							class="glyphicon glyphicon-th"></span> 대시보드</a></li>
					<li class="active"><a href="admin_list.jsp"><span
							class="glyphicon glyphicon-user"></span> 사용자</a></li>
				</ul>
			</div>
			<!-- contents -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
							<h2 class="page-header">BO3893의 로그</h2>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">#</th>
								<th class="text-center">시간</th>
								<th class="text-center">섹션</th>
								<th class="text-center">페이지</th>
								<th class="text-center">타입</th>
								<th class="text-center">로그</th>
							</tr>
						</thead>
					</table>
					<nav>
						<ul class="pager">
							<li><a href="#"><span>&laquo;</span></a></li>
							<li class="active"><a href="#">1</a></li>

							<li><a href="#"><span>&raquo;</span></a></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- contents -->
		</div>
	</div>
	<!-- <footer>
        <div class="container-fluid">
            <div class="col-md-12 text-right">
                <p>&copy;2021 <span class="text-primary">ilchool.</span> All Rights Reserved.</p>
            </div>
        </div>
    </footer> -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
	</script>
</body>

</html>