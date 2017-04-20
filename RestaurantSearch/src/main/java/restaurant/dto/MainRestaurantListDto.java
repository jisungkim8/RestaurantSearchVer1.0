package restaurant.dto;

public class MainRestaurantListDto {
	int restaurantID;
	float averageScore;
	String restaurantName;
	String representPhoto;
	String addr;
	String phonenumber;
	String averagePrice;
	
	
	public String getAveragePrice() {
		return averagePrice;
	}
	public void setAveragePrice(String averagePrice) {
		this.averagePrice = averagePrice;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getRestaurantID() {
		return restaurantID;
	}
	public void setRestaurantID(int restaurantID) {
		this.restaurantID = restaurantID;
	}
	public float getAverageScore() {
		return averageScore;
	}
	public void setAverageScore(float averageScore) {
		this.averageScore = averageScore;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public String getRepresentPhoto() {
		return representPhoto;
	}
	public void setRepresentPhoto(String representPhoto) {
		this.representPhoto = representPhoto;
	}
	
	
	
}
