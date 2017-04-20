package restaurant.dto;

import java.util.ArrayList;

public class SearchOptionObject {
	private String memberId = "";
	private String keyword = "";
	private Integer pageNum = 0;
	
	private ArrayList<String> location = null;
	private ArrayList<String> food = null;
	
	private String price = "";
	private String booking = "";
	private String parking = "";
	
	private Integer sidebarHeight = 0;
	
	public Integer getSidebarHeight() {
		return sidebarHeight;
	}
	public void setSidebarHeight(Integer sidebarHeight) {
		this.sidebarHeight = sidebarHeight;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getPageNum() {
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	public ArrayList<String> getLocation() {
		return location;
	}
	public void setLocation(ArrayList<String> location) {
		this.location = location;
	}
	public ArrayList<String> getFood() {
		return food;
	}
	public void setFood(ArrayList<String> food) {
		this.food = food;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBooking() {
		return booking;
	}
	public void setBooking(String booking) {
		this.booking = booking;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
}
