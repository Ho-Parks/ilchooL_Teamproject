package project.spring.ilchooL.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.spring.ilchooL.helper.RetrofitHelper;
import project.spring.ilchooL.helper.WebHelper;
import project.spring.ilchooL.model.covidCount;
import project.spring.ilchooL.model.covidCount.TbCorona19CountStatus.Row;
import project.spring.ilchooL.service.ApiCovidService;
import retrofit2.Call;
import retrofit2.Retrofit;

@Controller
public class CovidController {
	@Autowired WebHelper webHelper;
	@Autowired RetrofitHelper retrofitHelper;
	
	@RequestMapping(value = "/main/covid_graph.do", method = RequestMethod.GET)
	public String covidData(Model model) {
		
		Retrofit retrofit = retrofitHelper.getRetrofit(ApiCovidService.BASE_URL);
		
		ApiCovidService apiCovidService = retrofit.create(ApiCovidService.class);
		
		Call<covidCount> call = apiCovidService.getCovidCount();
		covidCount cCount = null;
		
		try {
			cCount = call.execute().body();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<Row> list = null;
		
		if (cCount != null) {
			list = cCount.getTbCorona19CountStatus().getRow();
		}
		
		model.addAttribute("list", list);
		
		return "main/covid_graph";
	}	// end covidData()
}
