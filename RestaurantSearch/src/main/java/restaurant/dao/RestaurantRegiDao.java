package restaurant.dao;

import restaurant.dto.RestaurantDto;
import restaurant.dto.ShopDetInfoDto;
import restaurant.dto.ShopPhotoDto;

public interface RestaurantRegiDao {
	public void insertRestaurant(RestaurantDto restaurantDto);
	
	public void updateRestaurantDet(ShopDetInfoDto shopDetInfoDto);
	
	public void updateRestaurant(RestaurantDto restaurantDto);

	public void insertRestaurantDetInfo(ShopDetInfoDto shopDetInfoDto);
	
	public void insertRestaurantPhoto(ShopPhotoDto shopPhotoDto);
	
	public void deleteRestaurant(String restaurantId);

	public int countRestaurantId();

/*	public RestaurantDto selectMemDetInfo(RestaurantDto restaurantDto);

	public RestaurantDto searchMemDetInfo(RestaurantDto restaurantDto);
*/
	
}