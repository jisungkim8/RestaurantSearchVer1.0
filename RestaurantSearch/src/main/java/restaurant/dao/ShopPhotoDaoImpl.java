package restaurant.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import restaurant.dto.ShopPhotoDto;

public class ShopPhotoDaoImpl extends SqlSessionDaoSupport implements ShopPhotoDao {

	public List<ShopPhotoDto> selectShopPhotoSepNum1DetView(int restaurantId) {
		// TODO Auto-generated method stub
		System.out.println("ShopPhotoDaoImpl>>selectShopPhotoSepNum1DetView() is called!!");
		
		return getSqlSession().selectList("selectShopPhotoSepNum1DetView", restaurantId);
	}
	
	public List<ShopPhotoDto> selectShopPhotoSepNum2DetView(int restaurantId) {
		// TODO Auto-generated method stub
		System.out.println("ShopPhotoDaoImpl>>selectShopPhotoSepNum2DetView() is called!!");
		
		return getSqlSession().selectList("selectShopPhotoSepNum2DetView", restaurantId);
	}

}
