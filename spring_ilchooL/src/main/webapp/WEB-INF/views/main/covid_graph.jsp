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
						${list[0].s_dt }
					</li>
					<li id="today_title">오늘 확진자수<br/>
						<span>${list[0].sn_hj }명</span>
					</li>
					<li class="col-md-3">확진자<br/>
						<span class="shj main_count">${list[0].s_hj }</span>
						<br/>
						<span class="shj_box d_box">
						<c:choose>
							<c:when test="${list[0].sn_hj - list[1].sn_hj > 0 }">
								${list[0].sn_hj - list[1].sn_hj }&nbsp;<i class="glyphicon glyphicon-arrow-up" id="up"></i>
							</c:when>
							<c:when test="${list[0].sn_hj - list[1].sn_hj < 0 }">
								${list[1].sn_hj - list[0].sn_hj }&nbsp;<i class="glyphicon glyphicon-arrow-down" id="down"></i>
							</c:when>
							<c:otherwise>
								0
							</c:otherwise>
						</c:choose>
						</span>
					</li>
					<li class="col-md-3">사망자<br/>
						<span class="main_count">${list[0].s_death }</span>
						<br/>
						<span class="sdeath_box d_box">
						<c:choose>
							<c:when test="${list[0].s_death - list[1].s_death > 0 }">
								${list[0].s_death - list[1].s_death }&nbsp;<i class="glyphicon glyphicon-arrow-up" id="up"></i>
							</c:when>
							<c:when test="${list[0].s_death - list[1].s_death < 0 }">
								Math.abs(${list[1].s_death - list[2].s_death })&nbsp;<i class="glyphicon glyphicon-arrow-down" id="down"></i>
							</c:when>
							<c:otherwise>
								0
							</c:otherwise>
						</c:choose>
						</span>
					</li>
					<li class="col-md-3">완치자<br/>
						<span class="srecover main_count">${list[0].s_recover }</span>
						<br/>
						<span class="srecover_box d_box">
						<c:choose>
							<c:when test="${list[0].s_recover - list[1].s_recover > 0 }">
								${list[0].s_recover - list[1].s_recover }&nbsp;<i class="glyphicon glyphicon-arrow-up" id="up"></i>
							</c:when>
							<c:when test="${list[0].s_recover - list[1].s_recover < 0 }">
								Math.abs(${list[1].s_recover - list[2].s_recover })&nbsp;<i class="glyphicon glyphicon-arrow-down" id="down"></i>
							</c:when>
							<c:otherwise>
								0
							</c:otherwise>
						</c:choose>
						</span>
					</li>
					<li class="col-md-3">치료자<br/>
						<span class="scare main_count">${list[0].s_care }</span>
						<br/>
						<span class="scare_box d_box">
						<c:choose>
							<c:when test="${list[0].s_care - list[1].s_care > 0 }">
								${list[0].s_care - list[1].s_care }&nbsp;<i class="glyphicon glyphicon-arrow-up" id="up"></i>
							</c:when>
							<c:when test="${list[0].s_care - list[1].s_care < 0 }">
								Math.abs(${list[1].s_care - list[2].s_care })&nbsp;<i class="glyphicon glyphicon-arrow-down" id="down"></i>
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