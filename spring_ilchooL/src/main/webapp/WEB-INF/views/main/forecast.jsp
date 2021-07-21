<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/forecast.css" />
</head>
<body>

	<!-- 헤더 영역 끝 -->
	<div class="carousel">
		<!-- 캐러셀 영역 구성 -->
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel" data-interval="3000">

			<div class="carousel-inner" id="carouselImg">

				<!-- 캐러셀 항목 (1): 날씨 -->

				<div class="item active">

					<!-- 캐러셀 배경 : 날씨 -->
					<!-- '0~5': 맑음, '6~8':흐림, '9~10': 구름많음 -->

					<c:choose>
						<c:when test="${sky} <= 5">
							<img src="${pageContext.request.contextPath}/assets/img/c01.gif" />
						</c:when>

						<c:when test="${sky} >=9">
							<img src="${pageContext.request.contextPath}/assets/img/c05.gif" />
						</c:when>

						<c:otherwise>
							<img src="${pageContext.request.contextPath}/assets/img/c02.gif" />
						</c:otherwise>
					</c:choose>

					<!-- 캐러셀 내용 : 날씨 -->
					<div class="carousel-caption">
						<div class="container" id="weather_region">
							<div class="row forecast_region">
								<div class="col-md-12 text-center">
									<p>서울시 강남구
									<p>
								</div>
							</div>
							<div></div>
							<div class="row row_forecast">
								<div class="col-sm-4 col-md-4 text-center" id="weatherImg">

									<!-- 날씨아이콘 '0~5': 맑음, '6~8':흐림, '9~10': 구름많음 -->

									<c:choose>
										<c:when test="${sky} <= 5">
											<img src="${pageContext.request.contextPath}/assets/img/icon_weather_Sunny.png" />
										</c:when>

										<c:when test="${sky} >=9">
											<img src="${pageContext.request.contextPath}/assets/img/icon_weather_Night_Rain.png" />
										</c:when>

										<c:otherwise>
											<img src="${pageContext.request.contextPath}/assets/img/icon_weather_Night_Rain.png" />
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-sm-5 col-md-4 text-center" id="weatherBox">
									<p>${tmp}<span>&deg;&#67;</span>
									<p>
								</div>

								<div class="col-sm-3 col-md-4 text-center" id="weatherValue">
									<p>
										<span class="glyphicon glyphicon-arrow-up" aria-hidden="true"
											style="color: #F70D1A; margin: 5px 0 0 0; vertical-align: top;"></span>
										${tmp}&deg;&#67;
									</p>
									<p>
										<span class="glyphicon glyphicon-arrow-down"
											aria-hidden="true"
											style="color: #00AAEE; margin: 0 0 5px 5px; vertical-align: bottom;"></span>
										${tmp}&deg;&#67;
									</p>
								</div>

							</div>
							<div class="col-sm-12" id="weather_comment">
								
									<c:choose>
										<c:when test="${tmp} <= -15">
											<p>반도가 위험해</p>
										</c:when>
										
										<c:when test="${tmp}> -15 && ${tmp} <= -10">
											<p>이불밖은 위험해</p>
										</c:when>
										
										<c:when test="${tmp}> -10 && ${tmp} <= -5">
											<p>대장급 패딩 + 히트택</p>
										</c:when>
										
										<c:when test="${tmp}> -5 && ${tmp} <= 0">
											<p>사람이 나갈 수 없는 날씨<br />(대장급 패딩 출격허가)</p>
										</c:when>
										
										<c:when test="${tmp}> 0 && ${tmp} <= 10">
											<p>초겨울에서 겨울날씨<br />(패딩, 겨울코트 출격허가)</p>
										</c:when>
										
										<c:when test="${tmp}> 10 && ${tmp} <= 15">
											<p>완연한 봄&amp;가을 날씨<br />(트렌치코트, 가죽자켓, 울자켓 출격허가)</p>
										</c:when>
										
										<c:when test="${tmp}> 15 && ${tmp} <= 20">
											<p>애매한 봄&amp;가을 날씨<br />(긴팔티, 맨투맨, 니트 출격허가)</p>
										</c:when>
										
										<c:when test="${tmp}> 20 && ${tmp} <=25">
											<p>살짝 더운 초여름 날씨<br />(긴팔티, 반팔티 혼용기간)</p>
										</c:when>
										
										<c:when test="${tmp}> 25 && ${tmp} <= 30">
											<p>여름 날씨<br />(반팔, 반바지 출격허가)</p>
										</c:when>
										
										<c:when test="${tmp}> 30 && ${tmp} <= 35">
											<p>사람이 나갈 수 있는 날씨</p>
										</c:when>
										
										<c:when test="${tmp}> 35 && ${tmp} <= 40">
											<p>이게 바로 헬반도</p>
										</c:when>

										<c:otherwise>
											<p>이민</p>
										</c:otherwise>
									</c:choose>
									
							</div>
						</div>
					</div>
				</div>

				<!-- 캐러셀 항목 (2): 미세먼지 -->
	
			</div>
			<!-- 좌우 이동 버튼 -->
			<a class="left carousel-control" href="#carousel-example-generic"
				data-slide="prev"> <span class="icon-prev"></span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				data-slide="next"> <span class="icon-next"></span>
			</a>
		</div>
	</div>

	<!-- // 캐러셀 영역 끝 -->


</body>
</html>