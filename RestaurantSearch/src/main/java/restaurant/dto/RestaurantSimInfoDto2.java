package restaurant.dto;

import java.util.ArrayList;

//Springboard2테이블->필드와 매핑

public class RestaurantSimInfoDto2 {
	private int restaurantId; // 식당 id
	
	private String restaurantName;
	private String addr;
	private String roadAddr;
	private String phoneNumber;
	private String representPhoto;

	private ArrayList<String> locationKeyword;
	private ArrayList<String> foodKeyword;
	private ArrayList<String> themeKeyword;

	private String locationKeywords;
	private String foodKeywords;
	private String themeKeywords;
	
	private float reviewAverageScore;
	private int reviewNumber;
	
	public String getLocationKeywords() {
		return locationKeywords;
	}

	public void setLocationKeywords(String locationKeywords) {
		this.locationKeywords = locationKeywords;
	}

	public String getFoodKeywords() {
		return foodKeywords;
	}

	public void setFoodKeywords(String foodKeywords) {
		this.foodKeywords = foodKeywords;
	}

	public String getThemeKeywords() {
		return themeKeywords;
	}

	public void setThemeKeywords(String themeKeywords) {
		this.themeKeywords = themeKeywords;
	}
	
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

	public ArrayList<String> getLocationKeyword() {
		return locationKeyword;
	}

	public void setLocationKeyword(ArrayList<String> locationKeyword) {
		this.locationKeyword = locationKeyword;
	}

	public ArrayList<String> getFoodKeyword() {
		return foodKeyword;
	}

	public void setFoodKeyword(ArrayList<String> foodKeyword) {
		this.foodKeyword = foodKeyword;
	}

	public ArrayList<String> getThemeKeyword() {
		return themeKeyword;
	}

	public void setThemeKeyword(ArrayList<String> themeKeyword) {
		this.themeKeyword = themeKeyword;
	}
	//private int foodId; //음식코드

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

	public String getRoadAddr() {
		return roadAddr;
	}

	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}
}
