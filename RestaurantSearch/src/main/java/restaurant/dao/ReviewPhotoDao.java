package restaurant.dao;

import java.util.List;

import restaurant.dto.ReviewPhotoDto;

public interface ReviewPhotoDao {
	public List<ReviewPhotoDto> selectReviewPhotoDetView(int restaurantId);
}