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

/**
 *	메인 페이지 컨트롤러 
 */
@Controller
public class MainController {
	@Autowired WebHelper webHelper;
	@Autowired RetrofitHelper retrofitHelper;
	
	/**
	 * 날씨, 미세먼지, 코로나19, 그래프 영역은 메인컨트롤러에서 구현하면 될것같아요! 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
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
		
		return "main/main";
	}
	
	/** 교통 페이지 이동 컨트롤러 */
	@RequestMapping(value = "/contents/contents_transport.do", method = RequestMethod.GET)
	public String transport(Model model) {
		return "contents/contents_transport";
	}
}
