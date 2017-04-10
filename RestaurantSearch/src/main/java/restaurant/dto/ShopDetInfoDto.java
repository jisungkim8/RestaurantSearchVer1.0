package restaurant.dto;

public class ShopDetInfoDto {
	int restaurantId;
	String shortDesc;
	String representMenu;
	String operStartDate;
	String representative;
	String homepage;
	String operHour;
	String modifyDate;
	float averageScore;
	int regionId;
	
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public String getShortDesc() {
		return shortDesc;
	}
	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}
	public String getRepresentMenu() {
		return representMenu;
	}
	public void setRepresentMenu(String representMenu) {
		this.representMenu = representMenu;
	}
	public String getOperStartDate() {
		return operStartDate;
	}
	public void setOperStartDate(String operStartDate) {
		this.operStartDate = operStartDate;
	}
	public String getRepresentative() {
		return representative;
	}
	public void setRepresentative(String representative) {
		this.representative = representative;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getOperHour() {
		return operHour;
	}
	public void setOperHour(String operHour) {
		this.operHour = operHour;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public float getAverageScore() {
		return averageScore;
	}
	public void setAverageScore(float averageScore) {
		this.averageScore = averageScore;
	}
	public int getRegionId() {
		return regionId;
	}
	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}
}
