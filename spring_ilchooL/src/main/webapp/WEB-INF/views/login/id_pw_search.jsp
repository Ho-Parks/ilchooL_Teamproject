<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../assets/css/login_new.css">
<c:import url="assets/head.jsp" />
<style type="text/css">

	* { margin: 0; padding: 0; }
	html, body { height: 100%; }

	.main { padding: 20px 0; min-height: 100%; margin: 0 auto -200px; width: 460px !important; }
	
	/* 메뉴바 색상 변경 */
	.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover { background-color: #428bca !important; }

	/* 내용 div 정렬 */
	.input_label label { margin: 0 10px; }

	/* content 영역 스타일 */
	.content_area { font-size: 20px; }
	.content_area a { color: #428bca; }

	/* footer 처리 */
	.footer, .push { height: 200px; }
</style>
</head>
<body>
	<!-- header 파일 -->
	<div class="header">
		<c:import url="assets/header.jsp" />
	</div>
	
	<!-- Modal -->
	<div id="Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="ModalLabel">회원 정보 확인</h4>
				</div>
				<div class="modal-body" style="text-align: center">
					<h4>회원정보가 확인되었습니다.</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-success" data-dismiss="modal" id="success_search">확인</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container main">
		<hr/>
		<!-- 메뉴바 영역 (tab) -->
		<nav class="navbar" role="navigation">
			<ul class="nav nav-pills nav-justified">
				<li class="active"><a href="#id_search" data-toggle="tab">아이디</a></li>
				<li><a href="#pw_search" data-toggle="tab">비밀번호</a></li>
			</ul>
		</nav>

		<!-- 메뉴바 컨텐츠 영역 -->
		<div class="tab-content">
			<!-- 아이디 찾기 -->
			<div class="tab-pane fade in active" id="id_search">
				<div class="id_pw_box">
					<div class="content_box">
						<form class="form-horizontal" name="id_pw_form" id="id_pw_form" action="" method="post">
							<div style="padding-top: 40px;">
								<h2>아이디 찾기</h2>
								<hr/>
							</div>
							<div>
								<div class="join">
									<label for="name">이름</label>
								</div>
								<span class="box new_id">
									<input type="text" name="user_name" class="new" placeholder="한글로 입력해주세요!" maxlength="20" />
								</span>
								<span class="error_next_box"></span>
							</div>
							<div>
								<div class="join">
									<label for="yy">생년월일</label>
								</div>
								<div id="bir_wrap">
									<!-- BIRTH_YY -->
									<div id="bir_yy">
										<span class="box"> <input type="text" id="yy" class="new"
											maxlength="4" placeholder="년(4자)">
										</span>
									</div>
			
									<!-- BIRTH_MM -->
									<div id="bir_mm">
										<span class="box"> <select id="mm" class="sel">
												<option>월</option>
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
										</select>
										</span>
									</div>
			
									<!-- BIRTH_DD -->
									<div id="bir_dd">
										<span class="box"> <input type="text" id="dd" class="new"
											maxlength="2" placeholder="일">
										</span>
									</div>
								</div>
								<span class="error_next_box"></span>
							</div>
				
							<div class="btn_area">
								<button type="submit" id="btnJoin">
									<span>검색하기</span>
								</button>
							</div>
						</form>
						<div class="content_area col-md-12" id="result"></div>
					</div>
				</div>
			</div>
			
			<!-- 비밀번호 초기화 -->
			<div class="tab-pane fade" id="pw_search">
				<div class="id_pw_box">
					<div class="content_box">
						<form class="form-horizontal" name="id_pw_form" id="id_pw_form" action="" method="post">
							<div style="padding-top: 40px;">
								<h2>회원 인증</h2>
								<hr/>
							</div>
							<div>
								<div class="join">
									<label for="name">이름</label>
								</div>
								<span class="box new_id">
									<input type="text" name="user_name" class="new" placeholder="한글로 입력해주세요!" maxlength="20" />
								</span>
								<span class="error_next_box"></span>
							</div>
							<div>
								<div class="join">
									<label for="name">아이디</label>
								</div>
								<span class="box new_id">
									<input type="text" name="user_name" class="new" maxlength="20" />
								</span>
								<span class="error_next_box"></span>
							</div>
							<div class="btn_area">
								<button type="submit" id="btnJoin">
									<span>검색하기</span>
								</button>
							</div>
							<div style="padding-top: 40px;">
								<h2>비밀번호 초기화</h2>
								<hr/>
							</div>
							<div>
								<div class="join">
									<label for="pswd">비밀번호</label>
								</div>
								<span class="box new_pass">
									<input type="password" id="new_pw" class="new" maxlength="20" name="new_pw">
									<span id="alertTxt">사용불가</span>
									<img src="../assets/img/login_new_pass.png" id="new_pw_img1" class="new_pw_img">
								</span>
								<span class="error_next_box"></span>
							</div>
	
							<!-- PW2 -->
							<div>
								<div class="join">
									<label for="pswd_re">비밀번호 재확인</label>
								</div>
								<span class="box new_pass_check">
									<input type="password" id="new_pw_re" class="new" maxlength="20" name="new_pw_re">
									<img src="../assets/img/login_new_check_disable.png" id="new_pw_re_img1" class="new_pw_img">
								</span>
								<span class="error_next_box"></span>
							</div>
							<div class="btn_area">
								<button type="submit" id="btnJoin">
									<span>변경하기</span>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="push"></div>
	</div>
	
	<div class="footer">
		<c:import url="assets/footer.jsp" />
	</div>
	
	<script type="text/javascript">
		$(function() {
			$("#id_re_btn").click(function() {
				var name = $("input[name=user_name]").val();
				$("#result").html("<h3>" + name + " 님의 아이디는 *** 입니다.</h3>");
			});
			
			$("#success_search").click(function() {
				$("#reset_pw").removeAttr("disabled");
				$("#re_reset_pw").removeAttr("disabled");
			});
			
		});
	</script>
</body>
</html>