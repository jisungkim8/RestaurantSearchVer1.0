package restaurant.dao;

import restaurant.dto.ShopDetInfoDto;

public interface ShopDetInfoDao {
	public ShopDetInfoDto selectShopDetInfoDetView(int restaurantId);
}
