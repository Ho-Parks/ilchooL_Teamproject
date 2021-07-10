
package project.spring.ilchooL.service.impl;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jdk.internal.org.jline.utils.Log;
import project.spring.ilchooL.model.CovidItem;
import project.spring.ilchooL.service.CovidService;

@Service
public class CovidServiceImpl implements CovidService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public void collectCovid(CovidItem covid_item) throws Exception {
		try {
			if (sqlSession.update("covidMapper.updateCovidItem", covid_item) == 0) {
				sqlSession.insert("covidMapper.insertCovidItem", covid_item);
			}
		} catch (Exception e) {
			Log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
	} // end collectCovid
	
	@Override
	public CovidItem getCovidItem(CovidItem covid_item) throws Exception {
		CovidItem result = null;
		
		try {
			result = sqlSession.selectOne("covidMapper.selectCovidItem", covid_item);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			Log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			Log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}	// end getCovidItem
}
