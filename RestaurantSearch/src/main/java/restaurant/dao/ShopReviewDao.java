package restaurant.dao;

import java.util.List;
import java.util.Map;

import restaurant.dto.ShopReviewCommand;
import restaurant.dto.ShopReviewDto;

public interface ShopReviewDao {
	public List<ShopReviewCommand> selectShopReviewDetView(Map<String, Object> map);
	public int getNewShopReviewDetView();
	public void insertShopReviewDetView(ShopReviewCommand shopReviewCommand);
	public void updateShopReviewDetView(ShopReviewCommand shopReviewCommand);
	public void deleteShopReviewDetView(Map<String, Object> map);
	public void increaseRecommendCnt(int reviewId);
	public void decreaseRecommendCnt(int reviewId);
	public int getTotalShopReviewDetView(int restaurantId);
}