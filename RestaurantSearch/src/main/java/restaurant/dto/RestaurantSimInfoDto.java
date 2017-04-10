package restaurant.dto;

//Springboard2테이블->필드와 매핑

public class RestaurantSimInfoDto {
	private int restaurantId; // 식당 id
	
	private String restaurantName;
	private String addr;
	private String phoneNumber;
	private String representPhoto;
	private String keyword;
	private float reviewAverageScore;
	private int reviewNumber;
	
	//private int foodId; //음식코드

	public float getReviewAverageScore() {
		return reviewAverageScore;
	}

	public void setReviewAverageScore(float reviewAverageScore) {
		this.reviewAverageScore = reviewAverageScore;
	}

	public int getReviewNumber() {
		return reviewNumber;
	}

	public void setReviewNumber(int reviewNumber) {
		this.reviewNumber = reviewNumber;
	}

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

	/*public int getFoodId() {
		return foodId;
	}

	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}*/
}
