package restaurant.dao;

import java.util.List;
import java.util.Map;

import restaurant.dto.ReviewPhotoDto;

public interface ReviewPhotoDao {
	public List<ReviewPhotoDto> selectReviewPhotoByReviewIdDetView(Map<String, Object> shopReviewDto);
	public int getNewReviewPhotoDetView();
	public void insertReviewPhotoDetView(ReviewPhotoDto reviewPhotoDto);
	public void deleteReviewPhotoDetView(int reviewId);
	public List<ReviewPhotoDto> selectReviewPhotoByReviewIdDetViewForDelete(int reviewId);
}