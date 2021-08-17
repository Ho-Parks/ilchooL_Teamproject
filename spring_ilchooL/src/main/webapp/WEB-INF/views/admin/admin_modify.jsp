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

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
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

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
							<h2 class="page-header">회원 정보 수정</h2>
				<form class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath}/admin/edit_ok.do">
					<input type="hidden" name="id" value="${output.id}">
					<!-- 입력양식 -->
					<div class="form-group">
						<label for="name" class="col-md-2">#</label>
						<div class="col-md-8">
							<hr />
						</div>
					</div>
					<!--//입력양식-->

					<!-- 입력양식 -->
					<div class="form-group">
						<label for="name" class="col-md-2">아이디</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="user_id" name="user_id" value="${output.user_id}"
								placeholder="이름을 입력하세요"> <span class="error_next_box"></span>
							<hr />
						</div>
					</div>
					<!--//입력양식-->

					<!-- 입력양식 -->
					<div class="form-group">
						<label for="new_id" class="col-md-2">이름</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="user_name" name="user_name" value="${output.user_name}"
								placeholder="아이디를 입력하세요"> <span class="error_next_box"></span>
							<hr />
						</div>
					</div>
					<!--//입력양식-->

					<!-- 입력양식 -->
					<div class="form-group">
						<label for="nickname" class="col-md-2">이메일</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="email" name="email" value="${output.email}"
								placeholder="닉네임을 입력하세요"> <span class="error_next_box"></span>
							<hr />
						</div>
					</div>
					<!--//입력양식-->

					<!-- 입력양식 -->
					<div class="form-group">
						<label for="content" class="col-md-2">번호</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="phone" name="phone" value="${output.phone}" placeholder="(Optional)">
							<hr />
						</div>
					</div>
					<!--//입력양식-->


					<!-- 입력양식 -->
					<div class="form-group">
						<label for="content" class="col-md-2">Account #</label>
						<div class="col-md-8"></div>
					</div>
					<br>
					<div class="form-group">
						<label for="content" class="col-md-2">날짜</label>
						<div class="col-md-8">
							<button type="button" class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-calendar"></span>
							</button>
						</div>
					</div>

					<!--//입력양식-->


					<!--체크박스-->
					<div class="form-group">
						<label for="content" class="col-md-2">활성화</label>
						<div class="col-md-8">
							<input id="checkbox" type="checkbox"
								class="btn btn-default btn-lg">
						</div>
					</div>

					<!--//체크박스-->
					<div class="form-group">
						<div class="col-md-10">
							<a href="${pageContext.request.contextPath}/admin/admin_list.do"
								class="btn btn-default btn-sm pull-right">취소</a>
								<button type="submit">수정</button>
						</div>
					</div>
				</form>

			</div>



		</div>
	</div>



</body>

<!-- Javascript -->
<script src="../assets/js/admin_modify.js"></script>
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/jquery-scrollbar.js">
	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		//Jquery Pages Scroll Progressbar default setting
		$("#progress-bar").onscroll();
		//Jquery Pages Scroll Progressbar addition setting
		//Progressbar color, Progressbar thickness, Progressbar postion
		//Progressbar position: fixed, absolute, relative
		//$("#progress-bar").onscroll({backgroundColor: 'red', height: '5px', position: 'fixed'});
	});
</script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<!-- <script>
	$(function() {

		$("#btn1").click(function() {
			// 확인, 취소버튼에 따른 후속 처리 구현
			swal({
				title : '확인', // 제목
				text : "정말 선택하신 항목을 변경하시겠습니까?", // 내용
				type : 'warning', // 종류
				confirmButtonText : 'Yes', // 확인버튼 표시 문구
				showCancelButton : true, // 취소버튼 표시 여부
				cancelButtonText : 'No', // 취소버튼 표시 문구
			}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
				if (result.value) { // 확인 버튼이 눌러진 경우
					swal('변경', '성공적으로 변경되었습니다.', 'success');
				} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
					swal('취소', '변경이 취소되었습니다.', 'error');
				}
			});
		});

	});
</script> -->
</body>

</html>