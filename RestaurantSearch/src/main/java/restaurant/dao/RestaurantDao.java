package restaurant.dao;

import restaurant.dto.RestaurantDto;

public interface RestaurantDao {
	public RestaurantDto selectRestaurantDetView(int restaurantId);
	public void increaseViewCountRestaurantDetView(int restaurantId);
}
