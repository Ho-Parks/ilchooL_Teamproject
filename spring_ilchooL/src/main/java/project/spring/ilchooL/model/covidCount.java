package project.spring.ilchooL.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class covidCount {
	@SerializedName("TbCorona19CountStatus") private TbCorona19CountStatus tbCorona19CountStatus;
	
	@Data
	public class TbCorona19CountStatus {
		@SerializedName("row") private List<Row> row;
		
		@Data
		public class Row {
			@SerializedName("S_DT") private String S_DT;
			@SerializedName("SN_HJ") private String SN_HJ;
			@SerializedName("S_HJ") private String S_HJ;
			@SerializedName("S_DEATH") private String S_DEATH;
			@SerializedName("S_RECOVER") private String S_RECOVER;
			@SerializedName("S_CARE") private String S_CARE;
		}
	}
}
