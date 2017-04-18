package restaurant.dto;

public class ShopPhotoDto {
	private int photoNum;
	private int photoSepNum;
	private String title;
	private String photoPath;
	private int restaurantId;
	
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
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
}
