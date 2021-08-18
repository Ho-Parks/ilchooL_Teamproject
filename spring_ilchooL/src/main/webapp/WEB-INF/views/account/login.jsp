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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/login.css">

</head>

<body>
	<div class="wrapper">
		<c:import url="../assets/header.jsp" />
		<div class="container">
			<div class="inner_login">
						<div id="login_w">로그인</div>
				<form id="login-form" class="form" method="post" action="${pageContext.request.contextPath}/rest/account/login">
						<div class="form-group">
							<label for="loginId" class="control">아이디</label> 
							<input type="text" id="user_id" class="form-control" name="user_id" placeholder="ID">
						</div>
						<div class="form-group">
							<label for="loginPw" class="control">비밀번호</label> 
							<input type="password" id="user_pw" class="form-control" name="user_pw" placeholder="Password">
						</div>
					
					<div class="form-group">
						<button type="submit" class="btn_login" id="btn_login">로그인</button>
					</div>
				<!-- <div class="form-group">
					<button type="button" class="btn_new"
						onclick="location.href='../account/login_new_terms.do'">회원가입</button>
				</div> -->
					<div class="form-group">
	                    <a href="${pageContext.request.contextPath}/account/join_terms" class="btn_new">회원가입</a>
	                </div>
				</form>
				<div class="login_append">
					<div class="log_chk">
						<!-- 체크시 checked 추가 -->
						<input type="checkbox" id="keepLogin" class="chk_radio"
							name="keepLogin"> <label for="keepLogin" class="lab_g">
							<span class="img_top ico_check"></span> <span class="txt_lab">로그인
								상태 유지</span>
						</label>
					</div>
					<span class="txt_find"> <a
						href="${pageContext.request.contextPath}/account/id_pw_search.do"
						class="link_find">아이디 / 비밀번호 찾기</a>
					</span>
				</div>

			</div>
		</div>
	</div>

	<c:import url="../assets/footer.jsp" />
	<script src="${pageContext.request.contextPath}/assets/js/login.js?ver=<%=System.currentTimeMillis()%>"></script>
	
</body>

</html>