package restaurant.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import restaurant.dto.ShopReviewDto;

public class ShopReviewDaoImpl extends SqlSessionDaoSupport implements ShopReviewDao {

	public List<ShopReviewDto> selectShopReviewDetView(int restaurantId) {
		// TODO Auto-generated method stub
		System.out.println("ShopReviewDaoImpl>>selectShopReviewDetView() is called!!");
		
		return getSqlSession().selectList("selectShopReviewDetView", restaurantId);
	}

}
