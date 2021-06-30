<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<c:import url="assets/head.jsp" />
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css" />
</head>
<body>
	<div id="covid_box" class="container">
		<div id="covid_title">
			<h1>COVID-19 Statistics</h1>
		</div>
		<div id="covid_count" class="well">
			<div class="row">
				<ul>
					<li style="text-align: left; padding-left: 30px;">
						${S_DT}
					</li>
					
				</ul>
			</div>
		</div>
		<div id="covid_graph" class="jumbotron">
			<h3>그래프영역</h3>
		</div>
	</div>
</body>
</html>