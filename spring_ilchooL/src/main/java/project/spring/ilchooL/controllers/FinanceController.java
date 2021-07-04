package project.spring.ilchooL.controllers;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FinanceController {
	@RequestMapping(value = "/contents/contents_finance.do", method = RequestMethod.GET)
	public String Finance(Model model) throws IOException {
		
		String url = "https://finance.naver.com/main/main.nhn";
		Document doc = Jsoup.connect(url).get();

		/** 해외 증시 */
		// 숫자 (앞: 순위), (뒤: 1종목명, 2현재가, 3전일대비)
		Elements elestock11 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(1) th:nth-child(1)");
		Elements elestock12 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(1) td:nth-child(2)");
		Elements elestock13 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(1) td:nth-child(3)");
		
		Elements elestock21 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(2) th:nth-child(1)");
		Elements elestock22 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(2) td:nth-child(2)");
		Elements elestock23 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(2) td:nth-child(3)");

		Elements elestock31 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(3) th:nth-child(1)");
		Elements elestock32 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(3) td:nth-child(2)");
		Elements elestock33 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(3) td:nth-child(3)");

		Elements elestock41 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(4) th:nth-child(1)");
		Elements elestock42 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(4) td:nth-child(2)");
		Elements elestock43 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(4) td:nth-child(3)");

		Elements elestock51 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(5) th:nth-child(1)");
		Elements elestock52 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(5) td:nth-child(2)");
		Elements elestock53 = doc.select("div.aside_stock table.tbl_home tbody tr:nth-child(5) td:nth-child(3)");

		String strstock11 = elestock11.text();
		String strstock12 = elestock12.text();
		String strstock13 = elestock13.text().substring(2);
		String stockud1 = elestock13.text().substring(0,2);

		String strstock21 = elestock21.text();
		String strstock22 = elestock22.text();
		String strstock23 = elestock23.text().substring(2);
		String stockud2 = elestock23.text().substring(0,2);

		String strstock31 = elestock31.text();
		String strstock32 = elestock32.text();
		String strstock33 = elestock33.text().substring(2);
		String stockud3 = elestock33.text().substring(0,2);

		String strstock41 = elestock41.text();
		String strstock42 = elestock42.text();
		String strstock43 = elestock43.text().substring(2);
		String stockud4 = elestock43.text().substring(0,2);

		String strstock51 = elestock51.text();
		String strstock52 = elestock52.text();
		String strstock53 = elestock53.text().substring(2);
		String stockud5 = elestock53.text().substring(0,2);


		/** 인기 검색 종목 (인기 종목) */
		// 숫자 (앞: 순위), (뒤: 뒤: 1종목명, 2현재가, 3전일대비)
		Elements elepopular11 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(1) th:nth-child(1)");
		Elements elepopular12 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(1) td:nth-child(2)");
		Elements elepopular13 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(1) td:nth-child(3)");
		Elements elepopularup1 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(1).up");
		Elements elepopulardown1 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(1).down");

		Elements elepopular21 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(2) th:nth-child(1)");
		Elements elepopular22 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(2) td:nth-child(2)");
		Elements elepopular23 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(2) td:nth-child(3)");
		Elements elepopularup2 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(2).up");
		Elements elepopulardown2 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(2).down");

		Elements elepopular31 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(3) th:nth-child(1)");
		Elements elepopular32 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(3) td:nth-child(2)");
		Elements elepopular33 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(3) td:nth-child(3)");
		Elements elepopularup3 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(3).up");
		Elements elepopulardown3 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(3).down");

		Elements elepopular41 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(4) th:nth-child(1)");
		Elements elepopular42 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(4) td:nth-child(2)");
		Elements elepopular43 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(4) td:nth-child(3)");
		Elements elepopularup4 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(4).up");
		Elements elepopulardown4 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(4).down");

		Elements elepopular51 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(5) th:nth-child(1)");
		Elements elepopular52 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(5) td:nth-child(2)");
		Elements elepopular53 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(5) td:nth-child(3)");
		Elements elepopularup5 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(5).up");
		Elements elepopulardown5 = doc.select("div.aside_popular table.tbl_home tbody tr:nth-child(5).down");

		String strpopular11 = elepopular11.text();
		String strpopular12 = elepopular12.text();
		String strpopular13 = elepopular13.text();
		String popularup1 = elepopularup1.text();
		String populardown1 = elepopulardown1.text();

		String strpopular21 = elepopular21.text();
		String strpopular22 = elepopular22.text();
		String strpopular23 = elepopular23.text();
		String popularup2 = elepopularup2.text();
		String populardown2 = elepopulardown2.text();

		String strpopular31 = elepopular31.text();
		String strpopular32 = elepopular32.text();
		String strpopular33 = elepopular33.text();
		String popularup3 = elepopularup3.text();
		String populardown3 = elepopulardown3.text();

		String strpopular41 = elepopular41.text();
		String strpopular42 = elepopular42.text();
		String strpopular43 = elepopular43.text();
		String popularup4 = elepopularup4.text();
		String populardown4 = elepopulardown4.text();

		String strpopular51 = elepopular51.text();
		String strpopular52 = elepopular52.text();
		String strpopular53 = elepopular53.text();
		String popularup5 = elepopularup5.text();
		String populardown5 = elepopulardown5.text();


		/** TOP 종목 (거래 상위) */
		// 숫자 (앞: 순위), (뒤: 1종목명, 2현재가, 3전일대비, 4등락률)
		Elements eletop11 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(1) th:nth-child(1)");
		Elements eletop12 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(1) td:nth-child(2)");
		Elements eletop13 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(1) td:nth-child(3)");
		Elements eletop14 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(1) td:nth-child(4)");

		Elements eletop21 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(2) th:nth-child(1)");
		Elements eletop22 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(2) td:nth-child(2)");
		Elements eletop23 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(2) td:nth-child(3)");
		Elements eletop24 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(2) td:nth-child(4)");

		Elements eletop31 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(3) th:nth-child(1)");
		Elements eletop32 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(3) td:nth-child(2)");
		Elements eletop33 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(3) td:nth-child(3)");
		Elements eletop34 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(3) td:nth-child(4)");

		Elements eletop41 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(4) th:nth-child(1)");
		Elements eletop42 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(4) td:nth-child(2)");
		Elements eletop43 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(4) td:nth-child(3)");
		Elements eletop44 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(4) td:nth-child(4)");

		Elements eletop51 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(5) th:nth-child(1)");
		Elements eletop52 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(5) td:nth-child(2)");
		Elements eletop53 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(5) td:nth-child(3)");
		Elements eletop54 = doc.select("table.tbl_home tbody#_topItems1 tr:nth-child(5) td:nth-child(4)");

		String strtop11 = eletop11.text();
		String strtop12 = eletop12.text();
		String strtop13 = eletop13.text().substring(2);
		String strtop14 = eletop14.text();
		String topud1 = eletop13.text().substring(0,2);

		String strtop21 = eletop21.text();
		String strtop22 = eletop22.text();
		String strtop23 = eletop23.text().substring(2);
		String strtop24 = eletop24.text();
		String topud2 = eletop23.text().substring(0,2);

		String strtop31 = eletop31.text();
		String strtop32 = eletop32.text();
		String strtop33 = eletop33.text().substring(2);
		String strtop34 = eletop34.text();
		String topud3 = eletop33.text().substring(0,2);

		String strtop41 = eletop41.text();
		String strtop42 = eletop42.text();
		String strtop43 = eletop43.text().substring(2);
		String strtop44 = eletop44.text();
		String topud4 = eletop43.text().substring(0,2);

		String strtop51 = eletop51.text();
		String strtop52 = eletop52.text();
		String strtop53 = eletop53.text().substring(2);
		String strtop54 = eletop54.text();
		String topud5 = eletop53.text().substring(0,2);


		
		/** View 처리 */
		// 해외증시
		model.addAttribute("strstock11", strstock11);
		model.addAttribute("strstock12", strstock12);
		model.addAttribute("strstock13", strstock13);
		model.addAttribute("strstock21", strstock21);
		model.addAttribute("strstock22", strstock22);
		model.addAttribute("strstock23", strstock23);
		model.addAttribute("strstock31", strstock31);
		model.addAttribute("strstock32", strstock32);
		model.addAttribute("strstock33", strstock33);
		model.addAttribute("strstock41", strstock41);
		model.addAttribute("strstock42", strstock42);
		model.addAttribute("strstock43", strstock43);
		model.addAttribute("strstock51", strstock51);
		model.addAttribute("strstock52", strstock52);
		model.addAttribute("strstock53", strstock53);
		model.addAttribute("stockud1", stockud1);
		model.addAttribute("stockud2", stockud2);
		model.addAttribute("stockud3", stockud3);
		model.addAttribute("stockud4", stockud4);
		model.addAttribute("stockud5", stockud5);
		
		// 인기종목
		model.addAttribute("strpopular11", strpopular11);
		model.addAttribute("strpopular12", strpopular12);
		model.addAttribute("strpopular13", strpopular13);
		model.addAttribute("strpopular21", strpopular21);
		model.addAttribute("strpopular22", strpopular22);
		model.addAttribute("strpopular23", strpopular23);
		model.addAttribute("strpopular31", strpopular31);
		model.addAttribute("strpopular32", strpopular32);
		model.addAttribute("strpopular33", strpopular33);
		model.addAttribute("strpopular41", strpopular41);
		model.addAttribute("strpopular42", strpopular42);
		model.addAttribute("strpopular43", strpopular43);
		model.addAttribute("strpopular51", strpopular51);
		model.addAttribute("strpopular52", strpopular52);
		model.addAttribute("strpopular53", strpopular53);
		model.addAttribute("popularup1", popularup1);
		model.addAttribute("popularup2", popularup2);
		model.addAttribute("popularup3", popularup3);
		model.addAttribute("popularup4", popularup4);
		model.addAttribute("popularup5", popularup5);
		model.addAttribute("populardown1", populardown1);
		model.addAttribute("populardown2", populardown2);
		model.addAttribute("populardown3", populardown3);
		model.addAttribute("populardown4", populardown4);
		model.addAttribute("populardown5", populardown5);
		
		// 거래상위
		model.addAttribute("strtop11", strtop11);
		model.addAttribute("strtop12", strtop12);
		model.addAttribute("strtop13", strtop13);
		model.addAttribute("strtop14", strtop14);
		model.addAttribute("strtop21", strtop21);
		model.addAttribute("strtop22", strtop22);
		model.addAttribute("strtop23", strtop23);
		model.addAttribute("strtop24", strtop24);
		model.addAttribute("strtop31", strtop31);
		model.addAttribute("strtop32", strtop32);
		model.addAttribute("strtop33", strtop33);
		model.addAttribute("strtop34", strtop34);
		model.addAttribute("strtop41", strtop41);
		model.addAttribute("strtop42", strtop42);
		model.addAttribute("strtop43", strtop43);
		model.addAttribute("strtop44", strtop44);
		model.addAttribute("strtop51", strtop51);
		model.addAttribute("strtop52", strtop52);
		model.addAttribute("strtop53", strtop53);
		model.addAttribute("strtop54", strtop54);
		model.addAttribute("topud1", topud1);
		model.addAttribute("topud2", topud2);
		model.addAttribute("topud3", topud3);
		model.addAttribute("topud4", topud4);
		model.addAttribute("topud5", topud5);
		
		return "contents/contents_finance";

	}

}
