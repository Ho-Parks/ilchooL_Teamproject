package project.spring.ilchooL.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class forecastWeather {
@SerializedName("response") private Response response;
	
	@Data
	public class Response {
		@SerializedName("body") private Body body;
		
		@Data
		public class Body {
			@SerializedName("items") private Items items;
			
			@Data
			public class Items {
				@SerializedName("item")	private List<Item> item;
				
				@Data
				public class Item {
					@SerializedName("category") private String category;
					@SerializedName("fcstValue") private String fcstValue;
				}
				
			}
		}
	}
				
}
