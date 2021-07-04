package project.spring.ilchooL.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.spring.ilchooL.helper.RetrofitHelper;
import project.spring.ilchooL.helper.WebHelper;
import project.spring.ilchooL.model.Covid19Item;
import project.spring.ilchooL.model.covidCount;
import project.spring.ilchooL.model.covidCount.TbCorona19CountStatus.Row;
import project.spring.ilchooL.service.ApiCovidService;
import project.spring.ilchooL.service.PhpCovidService;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * 메인 페이지 컨트롤러
 */
@Controller
public class MainController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RetrofitHelper retrofitHelper;

	/**
	 * 날씨, 미세먼지, 코로나19, 그래프 영역은 메인컨트롤러에서 구현하면 될것같아요!
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		Retrofit retrofit_apiCovid = retrofitHelper.getRetrofit(ApiCovidService.BASE_URL);
		Retrofit retrofit_phpCovid = retrofitHelper.getRetrofit(PhpCovidService.BASE_URL);

		ApiCovidService apiCovidService = retrofit_apiCovid.create(ApiCovidService.class);
		PhpCovidService phpCovidService = retrofit_phpCovid.create(PhpCovidService.class);

		Call<covidCount> call_apiCovid = apiCovidService.getCovidCount();
		Call<Covid19Item> call_phpCovid = phpCovidService.getCovidCount();
		covidCount cCount = null;
		Covid19Item cI = null;

		try {
			cCount = call_apiCovid.execute().body();
			cI = call_phpCovid.execute().body();
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<Row> list = null;

		if (cCount != null) {
			list = cCount.getTbCorona19CountStatus().getRow();
		}

		model.addAttribute("list", list);

		String datetime = null;
		String[] active = null;
		String[] confirmed = null;
		String[] confirmed_acc = null;
		String[] date = null;
		String[] death = null;
		String[] death_acc = null;
		String[] released = null;
		String[] released_acc = null;
		if (cCount != null) {
			datetime = cI.getDatetime();
			active = cI.getData_covid().getSeoul().getActive();
			confirmed = cI.getData_covid().getSeoul().getConfirmed();
			confirmed_acc = cI.getData_covid().getSeoul().getConfirmed_acc();
			date = cI.getData_covid().getSeoul().getDate();
			death = cI.getData_covid().getSeoul().getDeath();
			death_acc = cI.getData_covid().getSeoul().getDeath_acc();
			released = cI.getData_covid().getSeoul().getReleased();
			released_acc = cI.getData_covid().getSeoul().getReleased_acc();
		}

		model.addAttribute("datetime", datetime);
		model.addAttribute("active", active[active.length - 1]);
		model.addAttribute("confirmed", confirmed[confirmed.length - 1]);
		model.addAttribute("confirmed_acc", confirmed_acc[confirmed_acc.length - 1]);
		model.addAttribute("date", date[date.length - 1]);
		model.addAttribute("death", death[death.length - 1]);
		model.addAttribute("death_acc", death_acc[death_acc.length - 1]);
		model.addAttribute("released", released[released.length - 1]);
		model.addAttribute("released_acc", released_acc[released_acc.length - 1]);

		return "main/main";
	}

	/** 교통 페이지 이동 컨트롤러 */
	@RequestMapping(value = "/contents/contents_transport.do", method = RequestMethod.GET)
	public String transport(Model model) {
		return "contents/contents_transport";
	}

	/** 로그인 페이지 이동 컨트롤러 */
	@RequestMapping(value = "/login/Login.do", method = RequestMethod.GET)
	public String login(Model model) {
		return "login/Login";
	}

}