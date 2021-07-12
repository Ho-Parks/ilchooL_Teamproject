package project.spring.ilchooL.controllers;




import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	/** 로그인 페이지 이동 컨트롤러 */
	@RequestMapping(value = "/login/Login.do", method = RequestMethod.GET)
	public String login(Model model) {
		return "login/Login";
	}
	
//	/** 로그인 페이지 이동 컨트롤러 */
//	@RequestMapping(value = "/Login.do", method = RequestMethod.POST)
//	public String login1(Model model) {
//		return "/Login";
//	}
//	
	/** 회원가입 페이지 이동 컨트롤러 */
	@RequestMapping(value = "/login/login_new.do", method = RequestMethod.GET)
	public String login_new(Model model) {
		return "login/login_new";
	}
	
	/** 이용약관 페이지 이동 컨트롤러 */
	@RequestMapping(value = "/login/login_new_terms.do", method = RequestMethod.GET)
	public String login_new_terms(Model model) {
		return "login/login_new_terms";
	}
	
	/** 로그인 페이지 이동 컨트롤러 */
	@RequestMapping(value = "/login/id_pw_search.do", method = RequestMethod.GET)
	public String id_pw_search(Model model) {
		return "login/id_pw_search";
	}
	
	/** 로그인 페이지 이동 컨트롤러 */
	@RequestMapping(value = "/api/login_ok.do", method = RequestMethod.POST)
	public String login_ok(Model model) {
		return "api/login_ok";
	}
	
	/** 로그인 페이지 이동 컨트롤러 */
	@RequestMapping(value = "/mypage/mypage.do", method = RequestMethod.GET)
	public String mypage(Model model) {
		return "mypage/mypage";
	}
}