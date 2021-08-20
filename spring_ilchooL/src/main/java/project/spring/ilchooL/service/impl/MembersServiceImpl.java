package project.spring.ilchooL.service.impl;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import project.spring.ilchooL.model.Members;
import project.spring.ilchooL.service.MemberDao;


/** 회원 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
@Service
public class MembersServiceImpl implements project.spring.ilchooL.service.MembersService {

    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;
    
    @Autowired
    MemberDao mdao;


    /**
     * 회원 데이터 상세 조회
     * @param input 조회할 데이터의 일련번호(PK)를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    @Override
    public Members getMembersItem(Members input) throws Exception {
        Members result = null;

        try {
            result = sqlSession.selectOne("MembersMapper.selectMember", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }

    /**
     * 회원 데이터 목록 조회
     * @param input 검색조건을 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<Members> getMembersList(Members input) throws Exception {
        List<Members> result = null;

        try {
            result = sqlSession.selectList("MembersMapper.selectMembers", input);
            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }

    /**
     * 회원 데이터가 저장되어 있는 갯수 조회
     * @param input 검색조건을 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    @Override
    public int getMembersCount(Members input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.selectOne("MembersMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }

    /**
     * 회원가입
     * @param input 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    @Override
    public int addMembers(Members input) throws Exception {
        int result = 0;

        // 중복검사 기능을 먼저 호출한다. --> 예외가 발생할 경우 이 메서드가 정의하는 throws문에 의해 컨트롤러로 예외가 전달된다.
        this.idUniqueCheck(input);
        

        try {
            result = sqlSession.insert("MembersMapper.insertMember", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("회원가입이 완료되지 않았습니다. 다시 수행해 주세요.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("회원가입에 실패했습니다.");
        }

        return result;
    }

    /**
     * 회원 (마이페이지) 수정하기
     * @param input 수정할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    @Override
    public int editMembers(Members input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.update("MembersMapper.updateMember", input);
            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        }

        return result;
    }

    /**
     * 회원 데이터 삭제하기
     * @param input 삭제할 데이터의 일련번호(PK)를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    @Override
    public int deleteMembers(Members input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.delete("MembersMapper.deleteMembers", input);
            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("삭제된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 삭제에 실패했습니다.");
        }

        return result;
    }

    /**
     * 아이디 중복검사
     * @param input
     * @throws Exception
     */
    @Override
    public void idUniqueCheck(Members input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.selectOne("MembersMapper.idUniqueCheck", input);
            if (result > 0) {
                throw new NullPointerException("result=" + result);
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("이미 사용중인 아이디 입니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("아이디 중복검사에 실패했습니다.");
        }
    }
    
    /**
     * 이메일 중복검사
     * @param input
     * @throws Exception
     */
    @Override
    public void emailUniqueCheck(Members input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.selectOne("MembersMapper.emailUniqueCheck", input);
            if (result > 0) {
                throw new NullPointerException("result=" + result);
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("이미 사용중인 이메일 입니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("이메일 중복검사에 실패했습니다.");
        }
    }

    /**
     * 로그인
     * @param input
     * @throws Exception
     */
    @Override
    public Members login(Members input) throws Exception {
        Members result = null;

        try {
            result = sqlSession.selectOne("MembersMapper.login", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }

            // 조회에 성공하면 result에 저장되어 있는 PK를 활용하여 로그인 시간을 갱신한다.
            sqlSession.update("MembersMapper.updateLoginDate", result);
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("아이디나 비밀번호가 잘못되었습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }
    
    /**
     * 이메일 발송
     */
    @Override
    public void sendEmail(Members input) throws Exception {
       // Mail Server 설정
       String charSet = "utf-8";
       String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
       String hostSMTPid = "bo3893@gmail.com"; //서버 이메일 주소(보내는 사람 이메일 주소)
       String hostSMTPpwd = "sos8824960"; //서버 이메일 비번(보내는 사람 이메일 비번)

       // 보내는 사람 EMail, 제목, 내용
       String fromEmail = "bo3893@gmail.com"; //보내는 사람 이메일주소(받는 사람 이메일에 표시됨)
       String fromName = "ilchooL";  //프로젝트이름 또는 보내는 사람 이름
       String subject = "";
       String msg = "";
       
       
       subject = "임시 비밀번호 입니다.";
       msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
       msg += "<h3 style='color: blue;'>";
       msg += input.getUser_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
       msg += "<p>임시 비밀번호 : ";
       msg += input.getUser_pw() + "</p></div>";
       
    
       
       
       // 받는 사람 E-Mail 주소
       String mail = input.getEmail();
       
       try {
          HtmlEmail email = new HtmlEmail();
          email.setDebug(true);
          email.setCharset(charSet);
          email.setSSL(true);
          email.setHostName(hostSMTP);
          email.setSmtpPort(465); //네이버 이용시 587

          email.setAuthentication(hostSMTPid, hostSMTPpwd);
          email.setTLS(true);
          email.addTo(mail, charSet);
          email.setFrom(fromEmail, fromName, charSet);
          email.setSubject(subject);
          email.setHtmlMsg(msg);
          email.send();
       } catch (Exception e) {
          System.out.println("메일발송 실패 : " + e);
          e.printStackTrace();
       }
       
    }
    
    /**
     * 비밀번호 찾기
     */
    @Override
    public void findPw(HttpServletResponse response, Members input) throws Exception {
       response.setContentType("text/html;charset=utf-8");
       //Members ck = mdao.id_select(input.getUser_id());
       //Members ck = mdao.id_select(input);
       PrintWriter out = response.getWriter();
       
       if(input == null) {
          out.print("<script>alert('가입된 정보가 없습니다.');history.go(-1);</script>");
       }
       
       
       // 가입된 아이디가 없으면
       //if(ck == null) {
       //   out.print("<script>alert('가입된 아이디가 없습니다.');history.go(-1);</script>");
       //   out.close();
       //}
       
       // 가입된 이메일이 아니면
       
       // 임시 비밀번호 생성
       String pw = "";
       for (int i=0; i<12; i++) {
          pw += (char) ((Math.random() * 26) + 97);
       }
       input.setUser_pw(pw);
       
       // 비밀번호 변경
       mdao.updatePw(input);
       
       // 비밀번호 변경 메일 발송
       sendEmail(input);
       
       out.print("<script>alert('이메일로 임시 비밀번호를 발송하였습니다.');history.go(-1);</script>");
       out.close();
       
       
       
    }

    @Override
    public Members id_check(Members input) throws Exception {
        return sqlSession.selectOne("MembersMapper.id_select", input);
        
    }

	@Override
	public Members searchMembersID(Members input) throws Exception {
		Members result = null;

		try {
			result = sqlSession.selectOne("MembersMapper.searchID", input);
		} catch (NullPointerException e) {
			throw new Exception("저장된 아이디가 없습니다.");
		} catch (Exception e) {
			throw new Exception("아이디 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	@Override
	public Members admin_check(Members input) throws Exception {
		Members result = null;

		try {
			result = sqlSession.selectOne("MembersMapper.isAdmin", input);
		} catch (NullPointerException e) {
			throw new Exception("관리자 조회를 할 수 없습니다..");
		} catch (Exception e) {
			throw new Exception("관리자 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	@Override
    public void findId(HttpServletResponse response, String uid) throws Exception {
       response.setContentType("text/html;charset=utf-8");
       //Members ck = mdao.id_select(input.getUser_id());
       //Members ck = mdao.id_select(input);
       PrintWriter out = response.getWriter();
       
       if(uid == null) {
          out.print("<script>alert('가입된 정보가 없습니다.');history.go(-1);</script>");
       }
       
       out.print("<script>alert('가입하신 아이디는 " + uid + " 입니다.');history.go(-1);</script>");
       out.close();
       
    }
 }




