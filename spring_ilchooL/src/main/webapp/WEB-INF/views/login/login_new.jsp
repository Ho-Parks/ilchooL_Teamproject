<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html>

<head>
<c:import url="../assets/head.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/login_new.css">
</head>

<body>
	<div id="header">
		<c:import url="../assets/header.jsp" />
	</div>
	<!-- wrapper -->
	<div id="wrapper">

		<!-- content-->
		<div id="inner_join">
			<div id="new_box">회원가입</div>
			<form class="form-horizontal" name="join_form" id="join_form" action="Login.jsp" method="post">
			<!-- ID -->
				<div>
					<div class="join">
						<label for="id">아이디</label>
					</div>
					<span class="box new_id"> 
						<input type="text" id="new_id" class="new" name="new_id" maxlength="20">
							<!-- <span
								class="input-group-btn">
								<button class="btn btn-primary" type="button" id="id_uniq_check">중복검사</button>
							</span> -->
					</span> 
					<span class="error_next_box"></span>
				</div>
				
				<!-- PW1 -->
				<div>
					<div class="join">
						<label for="pswd">비밀번호</label>
					</div>
					<span class="box new_pass"> 
						<input type="password"id="new_pw" class="new" maxlength="20" name="new_pw"> 
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

				<!-- NAME -->
				<div>
					<div class="join">
						<label for="name">이름</label>
					</div>
					<span class="box int_name"> 
						<input type="text" id="new_name" class="new" maxlength="20" name="new_name">
					</span> 
					<span class="error_next_box"></span>
				</div>

				<!-- BIRTH -->
				<div>
					<div class="join">
						<label for="yy">생년월일</label>
					</div>

					<div id="bir_wrap">
						<!-- BIRTH_YY -->
						<div id="bir_yy">
							<span class="box"> 
								<input type="text" id="yy" class="new" maxlength="4" placeholder="년(4자)">
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
							<span class="box"> 
								<input type="text" id="dd" class="new" maxlength="2" placeholder="일">
							</span>
						</div>

					</div>
					<span class="error_next_box"></span>
				</div>

				<!-- GENDER -->
				<div>
					<div class="join">
						<label for="gender">성별</label>
					</div>
					<span class="box gender_code"> 
						<select id="new_gender" class="sel">
							<option>성별</option>
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
					</span> 
					<span class="error_next_box">필수 정보입니다.</span>
				</div>

				<!-- EMAIL -->
				<div>
					<div class="join">
						<label for="email">이메일 주소</label>
					</div>
					<span class="box int_email"> 
					<input type="email" id="new_email" class="new" maxlength="100" placeholder="선택입력" name="new_email">
					</span> 
					<span class="error_next_box"></span>
				</div>

				<!-- MOBILE -->
				<div>
					<div class="join">
						<label for="phoneNo">연락처</label>
					</div>
					<span class="box int_mobile"> 
						<input type="tel" id="new_mobile" class="new" maxlength="16" placeholder="전화번호 입력" name="new_mobile">
					</span> 
					<span class="error_next_box"></span>
				</div>

				<!-- ADDRESS -->
				<div>
					<div class="join">
						<label for="address">거주 지역</label>
					</div>

					<div class="address1">
						<span class="box1 new_post "> 
							<input type="text" id="new_postcode" class="new_1" placeholder="우편번호" readonly>
						</span> 
						<span class="click"> 
							<input type="button" id="address_btn" onclick="new_execDaumPostcode()" value="우편번호 찾기">
						</span>
					</div>

					<span class="box2 new_address "> 
						<input type="text" id="new_address" class="new" placeholder="주소" readonly>
					</span> 
					<span class="box3 new_detailAddress "> 
						<input type="text" id="new_detailAddress" class="new" placeholder="상세주소">
					</span> 
					<span class="box4 new_extraAddress "> 
						<input type="text" id="new_extraAddress" class="new" placeholder="참고항목" readonly>
					</span>


					<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
					<div id="layer" style="display: none; position: absolute; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1" onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div>
				</div>

				<!-- 프로필 사진 -->
				<div class="join">
					<label for='profile_img' class="">프로필사진</label>
					<div class="">
						<input type="file" name="profile_img" id="profile_img" />
					</div>
				</div>

				<!-- JOIN BTN-->
				<div class="btn_area">
					<button type="submit" id="btnJoin">
						<span>가입하기</span>
					</button>
				</div>
			</form>
		</div>
		<!-- content-->
	</div>
	<!-- wrapper -->

	<div id="footer">
		<c:import url="../assets/footer.jsp" />
	</div>

	<script src="${pageContext.request.contextPath}/assets/js/login_new.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/login_new2.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/address_1.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/address.js"></script>
	<!-- validate 플러그인 참조 -->
	<script src="${pageContext.request.contextPath}/assets/plugins/validate/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/validate/additional-methods.min.js"></script>
	
	<!-- 
	$("#join_form").bind('submit', function() {
				check();
				console.log("gg");
				
				return false; 
			});
	-->
	<script type="text/javascript">
		$("#btnJoin").click(function(e) {
			e.preventDefault();
			console.log("11");
			check();

		});
	</script>
</body>

</html>