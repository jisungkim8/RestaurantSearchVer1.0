package restaurant.dto;

public class ShopPhotoDto {
	private int photoNum;
	private int photoSepNum;
	private String title;
	private String photoPath;
	private String restaurantId;
	
	public int getPhotoNum() {
		return photoNum;
	}
	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}
	public int getPhotoSepNum() {
		return photoSepNum;
	}
	public void setPhotoSepNum(int photoSepNum) {
		this.photoSepNum = photoSepNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public String getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(String restaurantId) {
		this.restaurantId = restaurantId;
	}
}
