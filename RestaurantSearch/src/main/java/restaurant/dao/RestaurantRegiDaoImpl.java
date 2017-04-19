package restaurant.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import restaurant.dto.RestaurantDto;
import restaurant.dto.ShopDetInfoDto;

public class RestaurantRegiDaoImpl extends SqlSessionDaoSupport implements RestaurantRegiDao {

	public void insertRestaurant(RestaurantDto restaurantDto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertRestaurant", restaurantDto);
		System.out.println("RestaruantRegiDaoImpl_insertRestaurant");
	}

	public void updateRestaurantDet(ShopDetInfoDto shopDetInfoDto) {
		// TODO Auto-generated method stub
		getSqlSession().update("insertRestaurantDet", shopDetInfoDto);
		System.out.println("RestaruantRegiDaoImpl_insertRestaurantDet");
	}

	public void updateRestaurant(RestaurantDto restaurantDto) {
		// TODO Auto-generated method stub
		System.out.println("RestaurantRegiDaoImpl_updateRestaurant");
		getSqlSession().update("updateRestaurant", restaurantDto);
	}

	public void deleteRestaurant(String restaurantId) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteRestaurant", restaurantId);
		getSqlSession().delete("deleteShopDetInfo", restaurantId);
	}

	public void insertRestaurantDetInfo(ShopDetInfoDto shopDetInfoDto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertShopDetInfo", shopDetInfoDto);
		System.out.println("RestaurantRegiDaoImpl_shopDetInfoDto");
	}

	public int countRestaurantId() {
		// TODO Auto-generated method stub
		System.out.println("countRestaurantId");
		int restaurantCount = getSqlSession().selectOne("countRestaurantId");
		return restaurantCount;
	}
		

	/*
	 * public MemDetInfoDto selectMemDetInfo(MemDetInfoDto memDetInfoDto) { //
	 * TODO Auto-generated method stub
	 * System.out.println("__selectMemDetInfo__"); MemDetInfoDto memDetInfo=new
	 * MemDetInfoDto();
	 * memDetInfo=getSqlSession().selectOne("selectMemDetInfo",memDetInfoDto);
	 * return memDetInfo; }
	 * 
	 * public MemDetInfoDto searchMemDetInfo(MemDetInfoDto memDetInfoDto) { //
	 * TODO Auto-generated method stub
	 * System.out.println("____searchMemDetInfo____"); MemDetInfoDto
	 * memDetInfo=new MemDetInfoDto();
	 * memDetInfo=getSqlSession().selectOne("memDetInfobyPasswdSearch",
	 * memDetInfoDto); return memDetInfo; }
	 */

}