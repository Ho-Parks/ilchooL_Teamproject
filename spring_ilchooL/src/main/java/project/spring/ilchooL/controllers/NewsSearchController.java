package project.spring.ilchooL.controllers;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import retrofit2.Call;
import retrofit2.Retrofit;
import project.spring.ilchooL.helper.RetrofitHelper;
import project.spring.ilchooL.helper.WebHelper;
import project.spring.ilchooL.model.NewsSearch;
import project.spring.ilchooL.model.NewsSearch.items;
import project.spring.ilchooL.service.NewsSearchService;

@Controller
public class NewsSearchController {
   @Autowired
   WebHelper webHelper;

   @Autowired
   RetrofitHelper retrofitHelper;

   @RequestMapping(value = "/contents/contents_news.do", method = RequestMethod.GET)
   public String NaverNewsSearch(Model model) throws IOException {

      /** API 연동 객체 생성 */
      // Retrofit 객체 생성
      Retrofit retrofit = retrofitHelper.getRetrofit(NewsSearchService.BASE_URL);

      // Service 객체 생성. 구현체는 Retrofit이 자동 생성
      NewsSearchService newsSearchService = retrofit.create(NewsSearchService.class);

      /** 네이버 뉴스 검색 API 요청 */
      // 뉴스 검색 키워드
      String keyword = "신규 확진 500명대";

      // 네이버 뉴스 검색 API를 통해 검색 결과 받아오기
      Call<NewsSearch> call = newsSearchService.getNewsSearch(keyword, 100);
      NewsSearch newsSearch = null;
      
      try {
         newsSearch = call.execute().body();
      } catch (Exception e) {
         e.printStackTrace();
      }

      // 변수명이 길어서 참조변수를 만듬
      List<items> list = null;

      // 검색 결과가 있다면 list만 추출
      if (newsSearch != null) {
         list = newsSearch.getItems();
      }

      /** View 처리 */
      model.addAttribute("keyword", keyword);
      model.addAttribute("list", list);
      
	  /** 뉴스 원문 크롤링 시작 */
      items item1 = list.get(1);
      items item2 = list.get(2);
      items item3 = list.get(3);
      items item4 = list.get(4);
      items item5 = list.get(5);
      items item6 = list.get(6);
      items item7 = list.get(7);
      items item8 = list.get(8);
      items item9 = list.get(9);
      
	  // 뉴스 박스 클릭시 모달 창에서 뉴스 제목
	  String connUrl1 = item1.getLink();
	  Document doc1 = Jsoup.connect(connUrl1).get();
	  Elements ele1 = doc1.select("h3#articleTitle");
	  String str1 = ele1.text();
	  model.addAttribute("str1",str1);
	
	  String connUrl2 = item2.getLink();
	  Document doc2 = Jsoup.connect(connUrl2).get();
	  Elements ele2 = doc2.select("h3#articleTitle");
	  String str2 = ele2.text();
	  model.addAttribute("str2",str2);
	
	  String connUrl3 = item3.getLink();
	  Document doc3 = Jsoup.connect(connUrl3).get();
	  Elements ele3 = doc3.select("h3#articleTitle");
	  String str3 = ele3.text();
	  model.addAttribute("str3",str3);
	
	  String connUrl4 = item4.getLink();
	  Document doc4 = Jsoup.connect(connUrl4).get();
	  Elements ele4 = doc4.select("h3#articleTitle");
	  String str4 = ele4.text();
	  model.addAttribute("str4",str4);
	
	  String connUrl5 = item5.getLink();
	  Document doc5 = Jsoup.connect(connUrl5).get();
	  Elements ele5 = doc5.select("h3#articleTitle");
	  String str5 = ele5.text();
	  model.addAttribute("str5",str5);
	
	  String connUrl6 = item6.getLink();
	  Document doc6 = Jsoup.connect(connUrl6).get();
	  Elements ele6 = doc6.select("h3#articleTitle");
	  String str6 = ele6.text();
	  model.addAttribute("str6",str6);
	
	  String connUrl7 = item7.getLink();
	  Document doc7 = Jsoup.connect(connUrl7).get();
	  Elements ele7 = doc7.select("h3#articleTitle");
	  String str7 = ele7.text();
	  model.addAttribute("str7",str7);
	
	  String connUrl8 = item8.getLink();
	  Document doc8 = Jsoup.connect(connUrl8).get();
	  Elements ele8 = doc8.select("h3#articleTitle");
	  String str8 = ele8.text();
	  model.addAttribute("str8",str8);
	
	  String connUrl9 = item9.getLink();
	  Document doc9 = Jsoup.connect(connUrl9).get();
	  Elements ele9 = doc9.select("h3#articleTitle");
	  String str9 = ele9.text();
	  model.addAttribute("str9",str9);
	
	   // 뉴스 박스 클릭시 모달창에서 뉴스 원문 내용
	  Elements element1 = doc1.select("div#articleBodyContents");
	  String text1 = element1.text();
	  model.addAttribute("element1", element1);
	
	  Elements element2 = doc2.select("div#articleBodyContents");
	  String text2 = element2.text();
	  model.addAttribute("element2", element2);
	
	  Elements element3 = doc3.select("div#articleBodyContents");
	  String text3 = element3.text();
	  model.addAttribute("element3", element3);
	
	  Elements element4 = doc4.select("div#articleBodyContents");
	  String text4 = element4.text();
	  model.addAttribute("element4", element4);
	
	  Elements element5 = doc5.select("div#articleBodyContents");
	  String text5 = element5.text();
	  model.addAttribute("element5", element5);
	
	  Elements element6 = doc6.select("div#articleBodyContents");
	  String text6 = element6.text();
	  model.addAttribute("telement6", element6);
	
	  Elements element7 = doc7.select("div#articleBodyContents");
	  String text7 = element7.text();
	  model.addAttribute("element7", element7);
	
	  Elements element8 = doc8.select("div#articleBodyContents");
	  String text8 = element8.text();
	  model.addAttribute("element8", element8);
	
	  Elements element9 = doc9.select("div#articleBodyContents");
	  String text9 = element9.text();
	  model.addAttribute("element9", element9);

      return "contents/contents_news";

   }

}