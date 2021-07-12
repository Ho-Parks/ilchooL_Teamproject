package project.spring.ilchooL.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.ilchooL.model.Finance;
import project.spring.ilchooL.model.FinancePopular;
import project.spring.ilchooL.model.FinanceTop;
import project.spring.ilchooL.service.FinanceService;

@Service
public class FinanceServiceImpl implements FinanceService {
	
	@Autowired
	SqlSession sqlSession;

	/** 
	 * finance(해외종목)테이블에 데이터 추가
	 */
	@Override
	public int addFinance() throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("financeMapper.insertFinance");
			
			if(result == 0 ) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}

	
	/**
	 * finance_popular(인기종목)테이블에 데이터 추가
	 */
	@Override
	public int addFinancePopular() throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("financePopularMapper.insertFinancePopular");
			
			if(result == 0 ) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}

	
	/**
	 * finance_top(거래상위)테이블에 데이터 추가
	 */
	@Override
	public int addFinanceTop() throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("financeTopMapper.insertFinanceTop");
			
			if(result == 0 ) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}


	

}
