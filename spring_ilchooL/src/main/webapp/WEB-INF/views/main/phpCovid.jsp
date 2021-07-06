<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../assets/head.jsp" />
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/covid_graph.css" />
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
						<fmt:parseDate value="${date }" var="parseDate" pattern="yyyymmdd" />
						<fmt:formatDate value="${parseDate }" pattern="yyyy-mm-dd" />
					</li>
					<li id="today_title">오늘 확진자수<br/>
						<span>${confirmed}명</span>
					</li>
					<li class="col-md-3">누적 확진자<br/>
						<span class="shj main_count">${confirmed_acc}</span>
						<br/>
						<span class="shj_box d_box">
						<c:choose>
							<c:when test="${confirmed > 0 }">
								${confirmed }&nbsp;<i class="glyphicon glyphicon-arrow-up" id="up"></i>
							</c:when>
							<c:otherwise>
								0
							</c:otherwise>
						</c:choose>
						</span>
					</li>
					<li class="col-md-3">누적 격리해제<br/>
						<span class="scare main_count">${released_acc}</span>
						<br/>
						<span class="scare_box d_box">
						<c:choose>
							<c:when test="${released > 0 }">
								${released}&nbsp;<i class="glyphicon glyphicon-arrow-up" id="up"></i>
							</c:when>
							<c:otherwise>
								0
							</c:otherwise>
						</c:choose>
						</span>
					</li>				
					<li class="col-md-3">격리중<br/>
						<span class="srecover main_count">${active}</span>
						<br/>
						<span class="srecover_box d_box">
						<c:choose>
							<c:when test="${active - y_active > 0 }">
								${active - y_active }&nbsp;<i class="glyphicon glyphicon-arrow-up" id="up"></i>
							</c:when>
							<c:when test="${active - y_active < 0 }">
								${y_active - active }&nbsp;<i class="glyphicon glyphicon-arrow-down" id="down"></i>
							</c:when>
							<c:otherwise>
								0
							</c:otherwise>
						</c:choose>
						</span>
					</li>
					<li class="col-md-3">누적 사망자<br/>
						<span class="main_count">${death_acc}</span>
						<br/>
						<span class="sdeath_box d_box">
						<c:choose>
							<c:when test="${death > 0 }">
								${death}&nbsp;<i class="glyphicon glyphicon-arrow-up" id="up"></i>
							</c:when>
							<c:otherwise>
								0
							</c:otherwise>
						</c:choose>
						</span>
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