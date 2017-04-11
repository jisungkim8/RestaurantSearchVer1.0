package restaurant.dao;

import java.util.List;
import java.util.Map;

import restaurant.dto.ReviewPhotoDto;

public interface ReviewPhotoDao {
	public List<ReviewPhotoDto> selectReviewPhotoDetView(Map<String, Object> map);
	public int getNewReviewPhotoDetView();
	public void insertReviewPhotoDetView(ReviewPhotoDto reviewPhotoDto);
}