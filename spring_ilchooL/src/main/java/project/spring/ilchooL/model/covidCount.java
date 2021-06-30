package project.spring.ilchooL.model;

import lombok.Data;

@Data
public class covidCount {
	private String S_DT;
	private String SN_HJ;
	private String S_HJ;
	private String S_DEATH;
	private String S_RECOVER;
	private String S_CARE;
	
	public covidCount(String s_DT, String sN_HJ, String s_HJ, String s_DEATH, String s_RECOVER, String s_CARE) {
		super();
		S_DT = s_DT;
		SN_HJ = sN_HJ;
		S_HJ = s_HJ;
		S_DEATH = s_DEATH;
		S_RECOVER = s_RECOVER;
		S_CARE = s_CARE;
	}
	
	public covidCount() {
		super();
	}
}
