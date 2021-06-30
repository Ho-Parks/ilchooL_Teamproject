package project.spring.ilchooL.service;

import project.spring.ilchooL.model.covidCount;
import retrofit2.Call;
import retrofit2.http.GET;

public interface ApiCovidService {
	public static final String BASE_URL = "http://openapi.seoul.go.kr";
	
	@GET(":8088/726b637945766b6638354250656f4a/json/TbCorona19CountStatus/1/2/")
	Call<covidCount> getCovidCount();
}
