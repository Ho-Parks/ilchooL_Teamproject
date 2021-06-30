<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html>

<head>
<c:import url="assets/head.jsp" />
<link rel="stylesheet" type="text/css" href="../assets/css/login.css">

</head>

<body>
	<div class="wrapper">
		<c:import url="assets/header.jsp" />
		<div class="container">
			<div class="inner_login">
				<form id="login-form">
					<div class="box_login">
						<div id="login_w">로그인</div>
						<div class="form-group">
							<label for="loginId" class="form-control">아이디</label> <input
								type="text" id="user_id" name="user_id" placeholder="ID">
						</div>
						<div class="form-group">
							<label for="loginPw" class="form-control">비밀번호</label> <input
								type="password" id="user_pw" name="user_pw"
								placeholder="Password">
						</div>
					</div>
					<button type="submit" class="btn_login" id="btn_login">로그인</button>
				</form>
				<button type="submit"
						class="btn_new" onclick="location.href='../login/login_new_terms.jsp'">회원가입</button>
				<div class="login_append">
					<div class="log_chk">
						<!-- 체크시 checked 추가 -->
						<input type="checkbox" id="keepLogin" class="chk_radio"
							name="keepLogin"> <label for="keepLogin" class="lab_g">
							<span class="img_top ico_check"></span> <span class="txt_lab">로그인
								상태 유지</span>
						</label>
					</div>
					<span class="txt_find"> <a href="../login/id_pw_search.jsp" class="link_find">아이디 / 비밀번호 찾기</a>
					</span>
				</div>

			</div>
		</div>
	</div>

	<c:import url="assets/footer.jsp" />


	<!-- 사용자 정의 스크립트 -->
	<script type="text/javascript">
		$(function() {

			/** Ajax에 의해서 로드 되는 폼에 대한 submit 이벤트 */
			// <body>안에 처음부터 존재하는 요소가 아닌, Ajax에 의해서 동적으로
			// 로드 되는 요소이므로 on함수를 통한 이벤트 정의가 요구된다.
			$(document).on('submit', '#login-form', function(e) {
				// 페이지 이동이 방지된다.
				// -> form 내부의 스크립트를 완성한 후, 제거
				e.preventDefault();

				var uid = $(this).find("#user_id");
				var upw = $(this).find("#user_pw");

				$.post('../asssts/api/login_ok.do', {
					user_id : uid.val(),
					user_pw : upw.val()

				}, function(json) {
					// 결과값이 로그인 실패를 의미할 경우
					if (json.result == "FAIL") {
						alert("로그인에 실패했습니다. 아이디와 비밀번호를 확인하세요.");
						uid.val("");
						upw.val("");
						uid.focus();
						return false;
					}

					alert("안녕하세요. " + uid.val() + "님");

				});
			});
		});
		
	</script>

</body>

</html>