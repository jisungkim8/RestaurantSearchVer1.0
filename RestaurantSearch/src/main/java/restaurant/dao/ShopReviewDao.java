package restaurant.dao;

import java.util.List;

import restaurant.dto.ShopReviewDto;

public interface ShopReviewDao {
	public List<ShopReviewDto> selectShopReviewDetView(int restaurantId);
}