package restaurant.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import restaurant.dto.ReviewPhotoDto;
import restaurant.dto.ShopReviewDto;

public interface ReviewPhotoDao {
	public List<ReviewPhotoDto> selectReviewPhotoByReviewIdDetView(Map<String, Object> shopReviewDto);
	public int getNewReviewPhotoDetView();
	public void insertReviewPhotoDetView(ReviewPhotoDto reviewPhotoDto);
}