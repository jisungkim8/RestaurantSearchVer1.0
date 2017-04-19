package restaurant.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import restaurant.dto.RestaurantDto;

public class RestaurantDaoImpl extends SqlSessionDaoSupport implements RestaurantDao {

	public RestaurantDto selectRestaurantDetView(int restaurantId) {
		// TODO Auto-generated method stub
		System.out.println("RestaurantDaoImpl>>selectRestaurantDetView() is called!!");
		
		return getSqlSession().selectOne("selectRestaurantDetView", restaurantId);
	}
	
	public void increaseViewCountRestaurantDetView(int restaurantId) {
		// TODO Auto-generated method stub
		System.out.println("RestaurantDaoImpl>>increaseViewCountRestaurantDetView() is called!!");
		
		int resultByUpdate = getSqlSession().update("increaseViewCountRestaurantDetView", restaurantId);
		System.out.println("resultByUpdate = " + resultByUpdate);
	}
}
