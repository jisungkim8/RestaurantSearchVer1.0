package restaurant.dao;

import java.util.List;

import restaurant.dto.ShopPhotoDto;

public interface ShopPhotoDao {
	public List<ShopPhotoDto> selectShopPhotoSepNum1DetView(int restaurantId);
	public List<ShopPhotoDto> selectShopPhotoSepNum2DetView(int restaurantId);

}
