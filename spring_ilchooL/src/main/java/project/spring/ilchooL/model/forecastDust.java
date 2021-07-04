package project.spring.ilchooL.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class forecastDust {
@SerializedName("response") private Response response;
	
	@Data
	public class Response {
		@SerializedName("body") private Body body;
		
		@Data
		public class Body {
			@SerializedName("items") private List<Items> items;
			
			@Data
			public class Items {
				@SerializedName("pm10Value")	private int pm10Value;
				@SerializedName("pm25Value")	private int pm25Value;

			}

		}
		
	}

}
