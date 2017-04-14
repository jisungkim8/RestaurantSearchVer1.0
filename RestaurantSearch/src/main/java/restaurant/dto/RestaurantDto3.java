package restaurant.dto;

public class RestaurantDto3 {
	int restaurantId;
	String restaurantName;
	String addr;
	String phoneNumber;
	String representPhoto;
	String keyword;
	int averagePrice;
	String filterInfo;
	float averageScore;
	
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getRepresentPhoto() {
		return representPhoto;
	}
	public void setRepresentPhoto(String representPhoto) {
		this.representPhoto = representPhoto;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public float getAverageScore() {
		return averageScore;
	}
	public void setAverageScore(float averageScore) {
		this.averageScore = averageScore;
	}
	public int getAveragePrice() {
		return averagePrice;
	}
	public void setAveragePrice(int averagePrice) {
		this.averagePrice = averagePrice;
	}
	public String getFilterInfo() {
		return filterInfo;
	}
	public void setFilterInfo(String filterInfo) {
		this.filterInfo = filterInfo;
	}
}
