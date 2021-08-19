package project.spring.ilchooL.controllers;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.common.util.concurrent.Service;

import project.spring.ilchooL.helper.WebHelper;
import project.spring.ilchooL.model.Members;
import project.spring.ilchooL.service.MemberDao;
import project.spring.ilchooL.service.MembersService;

@Controller
public class MemberRestController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	MembersService membersService;
	
	@Autowired
	MemberDao memberDao;

	@RequestMapping(value = "/account/id_pw_search.do", method = RequestMethod.GET)
	public void findPwGET() throws Exception {
		
	}
	
	@RequestMapping(value = "/account/id_pw_search.do", method = RequestMethod.POST)
	public void findPwPOST(@ModelAttribute Members member, 
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="email") String email,
			@RequestParam(value="user_id") String user_id) throws Exception {
		
		//세션값 받아오기
		HttpSession session = request.getSession();		
		Members loginSession = (Members) session.getAttribute("loginInfo");			
								
		//로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
		if(loginSession !=null) { 
			webHelper.redirect(null,"로그아웃 후 이용해주세요.");
		}		
		
		Members input = new Members();
		input.setEmail(email);
		input.setUser_id(user_id);
		
		PrintWriter out = response.getWriter();
		
		membersService.findPw(response, member);
		membersService.sendEmail(member);
		
	}

}