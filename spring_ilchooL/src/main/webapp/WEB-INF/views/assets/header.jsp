<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/menu.css">
</head>
<header>
	<div id="header" class="container">
		<div class="hamburger" id="hamburger">
			<span class="line"></span>
			<span class="line"></span>
			<span class="line"></span>
		</div>
		<div id="menuNav" class="overlay">
			<div class="overlay-content">
				<a href="${pageContext.request.contextPath}">Home</a>
				<a href="${pageContext.request.contextPath}/contents/contents_transport.do">Transport</a>
				<a href="${pageContext.request.contextPath}/contents/contents_news.do">News</a>
				<a href="${pageContext.request.contextPath}/contents/contents_finance.do">Finance</a>
				<a href="${pageContext.request.contextPath}/mypage/mypage.do" class="MyPage">MyPage</a>
				<a href="${pageContext.request.contextPath}/login/Login.do" class="login">Login</a>
			</div>
		</div>
		<div id="logo">
			<a href="${pageContext.request.contextPath}"> <img alt="logo"
				src="${pageContext.request.contextPath}/assets/img/Logo(line).png"
				style="height: 30px;">
			</a>
		</div>
	</div>


	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".hamburger").click(function() {
				$(this).toggleClass("is-active");
				$("#menuNav").toggleClass("is-active");
				$("body").toggleClass("is-active");
			});
			
			$(".login").click(function() {
				$(".MyPage").toggleClass("is-active");
				$(this).html("Logout");
				$(this).toggleClass("logout");
			});
		});
	</script>
</header>