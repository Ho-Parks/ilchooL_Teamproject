
package project.spring.ilchooL.service;

import project.spring.ilchooL.model.CovidItem;

public interface CovidService {

	public void collectCovid(CovidItem covid_item) throws Exception;
	
	public CovidItem getCovidItem(CovidItem covid_item) throws Exception;
}
