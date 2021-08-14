<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.css" />
</head>
<body>
	<div id="forecast_box" class="container">
		<div id="forecast_title" style="text-align: center;">
			<h1>FORECAST</h1>
		</div>
		<div class="nonbox" style="height: 50px;"></div>
		<div id="forecast_graph" class="forecast row">

			<div class="forecast_chart_container col-md-4 col-xs-4">
				<canvas id="pm10Chart"></canvas>
			</div>
			<div class="forecast_chart_container col-md-4 col-xs-4">
				<canvas id="pm25Chart"></canvas>
			</div>
			<div class="forecast_chart_container col-md-4 col-xs-4">
				<canvas id="ptyChart"></canvas>
			</div>
		</div>
		<div class="nonbox" style="height: 100px;"></div>
		<div id="forecast_graph2" class="forecast row">
			<div class="forecast_chart_container col-md-6 col-xs-12">
				<canvas id="tmxChart"></canvas>
			</div>
			<div class="forecast_chart_container col-md-6 col-xs-12">
				<canvas id="tmnChart"></canvas>
			</div>
		</div>
		<div class="nonbox" style="height: 100px;"></div>
	</div>

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
	<script>
		let ptydata = [${sunny}, ${rainy}, ${sleet}, ${snow}, ${shower}]
		// 우선 컨텍스트를 가져옵니다. 
		var tmx = document.getElementById("tmxChart").getContext('2d');
		var tmn = document.getElementById("tmnChart").getContext('2d');
		var pm10 = document.getElementById("pm10Chart").getContext('2d');
		var pm25 = document.getElementById("pm25Chart").getContext('2d');
		var pty = document.getElementById("ptyChart").getContext('2d');

		//미세먼지, 초미세먼지, 강수확률 그래프
		
			var pm25Chart = new Chart(pm25, {
			type : 'doughnut',
			data : {
				//labels : [ "Red", "Blue", "Yellnutow", "Green", "Purple","Orange" ],
				datasets : [ {
					label : '초미세먼지',
					data : [ 10, 2, 3, 4, 2, 3 ],
					borderColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],

					hoveroffset : 10
				} ]
			},

		});
		
		//최고기온, 최저기온 그래프
		var tmxChart = new Chart(tmx,
				{
					type : 'line',
					data : {
						labels : ${day_chart},
						datasets : [{
							label : '최고기온',
							data : ${tmx_chart},
							fill : false,
							borderColor : 'rgba(255, 56, 96, 0.5)',
							tension : 0.1
						}]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : false,
									max:40,
									min:15
								}
							} ]
						}
					}
				});
		
		var tmnChart = new Chart(tmn,
				{
					type : 'line',
					data : {
						labels : ${day_chart},
						datasets : [ {
							label : '최저기온',
							data : ${tmn_chart},
							fill : false,
							borderColor : 'rgba(50, 115, 220, 0.5)',
							tension : 0.1
						}]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : false,
									max:40,
									min:15
								}
							} ]
						}
					}
				});
	</script>
</body>
</html>