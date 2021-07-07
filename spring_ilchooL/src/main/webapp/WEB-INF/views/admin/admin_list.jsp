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
				<h2 class="page-header">회원 리스트</h2>

				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">#</th>
								<th class="text-center">이름</th>
								<th class="text-center">아이디</th>
								<th class="text-center">닉네임</th>
								<th class="text-center">메모</th>
								<th class="text-center">회원번호</th>
								<th class="text-center">가입일</th>
								<th class="text-center">활동</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">박보연</td>
								<td class="text-center">BO3893</td>
								<td class="text-center">보여니</td>
								<td class="text-center"></td>
								<td class="text-center">adfkln12390</td>
								<td class="text-center">2021-03-23</td>
								<td class="text-center"><a href="admin_modify.jsp"
									class="btn btn-primary btn-sm">수정</a> <a data-toggle="modal"
									href="#delete_user" class="btn btn-danger btn-sm">삭제</a> <a
									href="admin_log.jsp" class="btn btn-success btn-sm">로그</a></td>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<td class="text-center">2</td>
								<td class="text-center">박인호</td>
								<td class="text-center">IBUSINHO</td>
								<td class="text-center">이노</td>
								<td class="text-center">부반장</td>
								<td class="text-center">adakdfnadl0</td>
								<td class="text-center">2021-03-23</td>
								<td class="text-center"><a href="admin_modify.jsp"
									class="btn btn-primary btn-sm">수정</a> <a data-toggle="modal"
									href="#delete_user" class="btn btn-danger btn-sm">삭제</a> <a
									href="admin_log.jsp" class="btn btn-success btn-sm">로그</a></td>
							</tr>
						</tbody>
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
	<div class="modal fade" id="delete_user">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">회원 정보 삭제</h4>
				</div>
				<div class="modal-body">
					<p>회원 정보를 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
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
</body>

</html>