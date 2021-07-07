package project.spring.ilchooL.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.spring.ilchooL.helper.RetrofitHelper;
import project.spring.ilchooL.helper.WebHelper;
import project.spring.ilchooL.model.Covid19Item;
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
		// Retrofit 객체 선언 부분
		Retrofit retrofit_phpCovid = retrofitHelper.getRetrofit(PhpCovidService.BASE_URL);
		// 이부분에 수인님 코드 추가
		
		// Service 인터페이스 선언부분
		PhpCovidService phpCovidService = retrofit_phpCovid.create(PhpCovidService.class);
		// 이부분에 수인님 코드 추가

		// Call 객체를 service 인터페이스를 할당하여 선언
		Call<Covid19Item> call_phpCovid = phpCovidService.getCovidCount();
		// 이부분에 수인님 코드 추가
		
		// pojo 클래스 선언
		Covid19Item cI = null;
		// 이부분에 수인님 코드 추가

		try {
			// 데이터 받는 부분
			cI = call_phpCovid.execute().body();
			// 이부분에 수인님 코드 추가
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 사용할 변수, 배열 선언
		String datetime = null;
		String[] active = null;
		String[] confirmed = null;
		String[] confirmed_acc = null;
		String[] date = null;
		String[] death = null;
		String[] death_acc = null;
		String[] released = null;
		String[] released_acc = null;
		
		// null 값인지 검사후 getter를 사용해 데이터를 가져온다.
		if (cI != null) {
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
		
		String con_item = null;
		String date_item = null;
		
		for(int i = 0; i < 7; i++) {
			con_item = confirmed[confirmed.length - i - 1];
			date_item = date[date.length - i - 1].substring(4);
			date_item = Integer.parseInt(date_item.substring(0, 2)) + "월 " + Integer.parseInt(date_item.substring(2)) + "일";
			model.addAttribute("date_" + i, date_item);
			model.addAttribute("confirmed_" + i, con_item);
			System.out.println(date_item);
		}
		
		// model에 받아온 데이터 주입
		model.addAttribute("datetime", datetime);
		model.addAttribute("active", active[active.length - 1]);
		model.addAttribute("y_active", active[active.length - 2]);
		model.addAttribute("confirmed_acc", confirmed_acc[confirmed_acc.length - 1]);
		model.addAttribute("date", date[date.length - 1]);
		model.addAttribute("death", death[death.length - 1]);
		model.addAttribute("death_acc", death_acc[death_acc.length - 1]);
		model.addAttribute("released", released[released.length - 1]);
		model.addAttribute("released_acc", released_acc[released_acc.length - 1]);
		// 이부분에 수인님 코드 추가

		// View 처리
		return "main/main";
	}

	/** 교통 페이지 이동 컨트롤러 */
	@RequestMapping(value = "/contents/contents_transport.do", method = RequestMethod.GET)
	public String transport(Model model) {
		return "contents/contents_transport";
	}

	

}