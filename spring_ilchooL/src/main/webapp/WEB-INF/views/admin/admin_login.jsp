<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-clearmin.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/roboto.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <title>Admin login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="../assets/plugins/ajax/ajax_helper.js"></script>
    <style type="text/css">
    </style>
</head>

<body>
    <div class="text-center" style="padding:30px 0 30px 0;background:#eee; border-bottom:1px solid #eee">
        <img src="../assets/img/Logo(black).png" style="max-width: 100; height: 45px">
    </div>
    <div class="col-sm-6 col-md-4 col-lg-3" style="margin:40px auto; float:none; ">
        <form id="login-form" method="post" action="index.html">
            <div class="col-xs-12">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                        <input type="text" id="user_id" name="username" class="form-control" placeholder="Username">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></i></div>
                        <input type="password" id="user_pw" name="password" class="form-control" placeholder="Password">
                    </div>
                </div>
            </div>
            <div class="col-xs-6">
                <div class="checkbox"><label><input type="checkbox"> Remember me</label></div>
            </div>
            <div class="col-xs-6">
                <button type="submit" class="btn btn-block btn-primary" onclick="location.href='../admin/admin_dashboard.jsp'">Sign in</button>
            </div>
        </form>
    </div>
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
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>

</html>