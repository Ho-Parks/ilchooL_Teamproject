package project.spring.ilchooL.controllers;




import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {
	/** 회원가입 페이지 */
    @RequestMapping(value = "/account/login_new", method = RequestMethod.GET)
    public String login_new() {
        return "account/login_new";
    }

    /** 로그인 페이지 */
    @RequestMapping(value = "/account/login", method = RequestMethod.GET)
    public String login() {
        return "account/login";
    }
	
	/** 이용약관 페이지 이동 컨트롤러 */
	@RequestMapping(value = "/account/login_new_terms", method = RequestMethod.GET)
	public String login_new_terms() {
		return "account/login_new_terms";
	}
	
	
	/** 마이페이지 이동 컨트롤러 */
	@RequestMapping(value = "/mypage/mypage", method = RequestMethod.GET)
	public String mypage(Model model) {
		return "mypage/mypage";
	}
}