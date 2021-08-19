package project.spring.ilchooL.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import project.spring.ilchooL.model.Members;
import project.spring.ilchooL.service.MemberDao;

@Slf4j
@Service
public class MemberDaoImpl implements MemberDao{
	
	/** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;
    
    @Autowired
    MemberDao memberDao;

	@Override
	public int updatePw(Members members) throws Exception {
		return sqlSession.update("MembersMapper.updatePw", members);
	}

	@Override
	public Members id_select(Members members) throws Exception {
		return memberDao.id_select(members);
		
	}

	

}
