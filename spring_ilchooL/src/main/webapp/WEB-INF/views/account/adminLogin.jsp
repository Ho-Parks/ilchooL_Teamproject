<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>

<head>
<c:import url="../assets/head.jsp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login.css">

</head>

<body>
	<div class="wrapper">
		<c:import url="../assets/header.jsp" />
		<div class="container">
			<div class="inner_login">
						<div id="login_w">로그인</div>
				<form id="login_form" class="form" name="login_form" method="post" action="${pageContext.request.contextPath}/admin/admin_dashboard.do">
						<div class="form-group">
							<label for="loginId" class="control">아이디</label> 
							<input type="text" id="user_id" class="form-control" name="user_id" placeholder="ID">
						</div>
						<div class="form-group">
							<label for="loginPw" class="control">비밀번호</label> 
							<input type="password" id="user_pw" class="form-control" name="user_pw" placeholder="Password">
						</div>
						<div>
							<input type="hidden" name="login" value="Y">
						</div>
					
					<div class="form-group">
						<button type="submit" class="btn_login" id="btn_login">로그인</button>
					</div>
				</form>
				<div class="login_append">
					<div class="log_chk">
						<!-- 체크시 checked 추가 -->
						<input type="checkbox" id="keepLogin" name="remember" value="1" class="chk_radio"
							name="keepLogin"> <label for="keepLogin" class="lab_g">
							<span class="img_top ico_check"></span> <span class="txt_lab">아이디 기억하기</span>
						</label>
					</div>
					
				</div>
			</div>
		</div>
	</div>

	<c:import url="../assets/footer.jsp" />
	<script src="${pageContext.request.contextPath}/assets/js/login_cookie.js?ver=<%=System.currentTimeMillis()%>"></script>
	
</body>

</html>