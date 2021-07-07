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

		$.post("${pageContext.request.contextPath}/asssts/api/login_ok", {
			user_id: uid.val(),
			user_pw: upw.val()

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