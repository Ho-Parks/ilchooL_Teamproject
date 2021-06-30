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
			@SerializedName("S_DT") private String s_dt;
			@SerializedName("SN_HJ") private String sn_hj;
			@SerializedName("S_HJ") private String s_hj;
			@SerializedName("S_DEATH") private String s_death;
			@SerializedName("S_RECOVER") private String s_recover;
			@SerializedName("S_CARE") private String s_care;
		}
	}
}
