package restaurant.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ShopReviewCommand {
	private int reviewId;
	private String title;
	private Date writeDate;
	private String content;
	private int recommendCnt;
	private String visitTime;
	private String dinnerOrLunch;
	private String memberId;
	private int restaurantId;
	private ArrayList<ReviewPhotoDto> reviewPhotoDtoList;
	private ArrayList<MultipartFile> upload;
	private ArrayList<String> filename;
	
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRecommendCnt() {
		return recommendCnt;
	}
	public void setRecommendCnt(int recommendCnt) {
		this.recommendCnt = recommendCnt;
	}
	public String getVisitTime() {
		return visitTime;
	}
	public void setVisitTime(String visitTime) {
		this.visitTime = visitTime;
	}
	public String getDinnerOrLunch() {
		return dinnerOrLunch;
	}
	public void setDinnerOrLunch(String dinnerOrLunch) {
		this.dinnerOrLunch = dinnerOrLunch;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	
	public ArrayList<ReviewPhotoDto> getReviewPhotoDtoList() {
		return reviewPhotoDtoList;
	}
	public void setReviewPhotoDtoList(ArrayList<ReviewPhotoDto> reviewPhotoDtoList) {
		this.reviewPhotoDtoList = reviewPhotoDtoList;
	}
	public ArrayList<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(ArrayList<MultipartFile> upload) {
		this.upload = upload;
	}
	public ArrayList<String> getFilename() {
		return filename;
	}
	public void setFilename(ArrayList<String> filename) {
		this.filename = filename;
	}
}
