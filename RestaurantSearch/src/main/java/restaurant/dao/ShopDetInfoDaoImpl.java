package restaurant.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import restaurant.dto.ShopDetInfoDto;

public class ShopDetInfoDaoImpl extends SqlSessionDaoSupport implements ShopDetInfoDao {

	public ShopDetInfoDto selectShopDetInfoDetView(int restaurantId) {
		// TODO Auto-generated method stub
		System.out.println("ShopDetInfoDaoImpl>>selectShopDetInfoDetView() is called!!");
		
		return getSqlSession().selectOne("selectShopDetInfoDetView", restaurantId);
	}
	
	public void insertShopDetInfo(ShopDetInfoDto shopDetInfoDto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertShopDetInfo", shopDetInfoDto);
		System.out.println("RestaurantRegiDaoImpl_shopDetInfoDto");
	}

}
