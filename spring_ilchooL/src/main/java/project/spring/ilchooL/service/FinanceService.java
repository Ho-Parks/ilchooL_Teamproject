package project.spring.ilchooL.service;


public interface FinanceService {
	
	/**
	 * finance(해외증시)테이블에 데이터 추가
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int addFinance() throws Exception;
	
	
	/**
	 * finance_popular(인기종목)테이블에 데이터 추가
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int addFinancePopular() throws Exception;
	
	
	/**
	 * finance_top(거래상위)테이블에 데이터 추가
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int addFinanceTop() throws Exception;


}
