package project.spring.ilchooL.service;

import project.spring.ilchooL.model.forecastWeather;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

public interface forecastWeatherService {
	public static final String BASE_URL ="http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";

	//인증키 - StBzGzV%2BbfGoWn%2F3PAB08w9ZZmJSz0lOX3%2BE8MlTapZsJqETWwd71dB8syBPznAhytzUVYMLSjXVxm5i5CADMA%3D%3D
	//x좌표:61, y좌표:126 - 강남구 (로그인 전 기본위치)
	
	
			@GET("?serviceKey=StBzGzV%2BbfGoWn%2F3PAB08w9ZZmJSz0lOX3%2BE8MlTapZsJqETWwd71dB8syBPznAhytzUVYMLSjXVxm5i5CADMA%3D%3D&pageNo=1&numOfRows=100&dataType=JSON&base_time=2300&nx=61")
			Call<forecastWeather> getforecastWeather(@Query("base_date") String prev_date, @Query("fcstDate") String current_date, @Query("fcstTime") String current_time);
			
			// base_date: 예보시각 - (전날 23시)
			// fcstDate: 현재시각
}

