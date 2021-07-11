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
import project.spring.ilchooL.model.CovidItem;
import project.spring.ilchooL.service.CovidService;

/**
 * 메인 페이지 컨트롤러
 */
@Controller
public class MainController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RetrofitHelper retrofitHelper;
	@Autowired CovidService covidService;

	/**
	 * 날씨, 미세먼지, 코로나19, 그래프 영역은 메인컨트롤러에서 구현하면 될것같아요!
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		// Retrofit 객체 선언 부분
		// 이부분에 수인님 코드 추가
		
		// Service 인터페이스 선언부분
		// 이부분에 수인님 코드 추가

		// Call 객체를 service 인터페이스를 할당하여 선언
		// 이부분에 수인님 코드 추가
		
		// pojo 클래스 선언
		List<CovidItem> covid_output = null;
		Covid19Item cI = new Covid19Item();
		// 이부분에 수인님 코드 추가

		try {
			// 데이터 받는 부분
			covid_output = covidService.getCovidList();
			
			for (CovidItem item : covid_output) {
				System.out.println(item.toString());
			}
			// 이부분에 수인님 코드 추가
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int con_item = 0;
		String date_item = null;
		int death_item = 0;
		int released_item = 0;
		int active_item = 0;
		
		
		for(int i = 0; i < covid_output.size(); i++) {
			con_item = covid_output.get(i).getConfirmed();
			date_item = covid_output.get(i).getDate().substring(4);
			date_item = Integer.parseInt(date_item.substring(0, 2)) + "월 " + Integer.parseInt(date_item.substring(2)) + "일";
			death_item = covid_output.get(i).getDeath();
			released_item = covid_output.get(i).getReleased();
			active_item = covid_output.get(i).getActive();
			
			model.addAttribute("date_" + i, date_item);
			model.addAttribute("confirmed_" + i, con_item);
			model.addAttribute("death_" + i, death_item);
			model.addAttribute("released_" + i, released_item);
			model.addAttribute("active_" + i, active_item);
		}
		
		String datetime = null;
		datetime = cI.getDatetime();
		
		model.addAttribute("datetime", datetime);
		model.addAttribute("confirmed_acc", covid_output.get(0).getConfirmed_acc());
		model.addAttribute("date", covid_output.get(0).getDate());
		model.addAttribute("death_acc", covid_output.get(0).getDeath_acc());
		model.addAttribute("released_acc", covid_output.get(0).getReleased_acc());
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