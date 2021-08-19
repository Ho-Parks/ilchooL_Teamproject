package project.spring.ilchooL.service;

import org.springframework.web.servlet.ModelAndView;

import project.spring.ilchooL.model.Members;

public interface MemberDao {
	
	// 비밀번호 변경
	public int updatePw(Members members) throws Exception;
	
	// 가입 여부
	public Members id_select(Members members) throws Exception;

}
