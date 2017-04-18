package restaurant.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import restaurant.dto.ShopReviewCommand;
import restaurant.dto.ShopReviewDto;

public class ShopReviewDaoImpl extends SqlSessionDaoSupport implements ShopReviewDao {

	public List<ShopReviewCommand> selectShopReviewDetView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println("ShopReviewDaoImpl>>selectShopReviewDetView() is called!!");
		
		return getSqlSession().selectList("selectShopReviewDetView", map);
	}
	
	public int getNewShopReviewDetView() {
		// TODO Auto-generated method stub
		System.out.println("ShopReviewDaoImpl>>getNewShopReviewDetView() is called!!");
		
		Integer newReviewId = getSqlSession().selectOne("getNewShopReviewDetView");
		
		if (newReviewId == null) {
			newReviewId = 0;
		}
		
		return newReviewId;
	}
	
	public void insertShopReviewDetView(ShopReviewCommand shopReviewCommand) {
		// TODO Auto-generated method stub
		System.out.println("ShopReviewDaoImpl>>insertShopReviewDetView() is called!!");
		
		int resultByInsert = (int) getSqlSession().insert("insertShopReviewDetView", shopReviewCommand);
		System.out.println("ShopReviewDaoImpl>>insertResult = " + resultByInsert);
	}
	
	public void increaseRecommendCnt(int reviewId) {
		// TODO Auto-generated method stub
		System.out.println("ShopReviewDaoImpl>>increaseRecommendCnt() is called!!");
		
		int resultByIncrease = (int) getSqlSession().update("increaseRecommendCnt", reviewId);
		System.out.println("ShopReviewDaoImpl>>resultByIncrease = " + resultByIncrease);
	}
	
	public void decreaseRecommendCnt(int reviewId) {
		// TODO Auto-generated method stub
		System.out.println("ShopReviewDaoImpl>>decreaseRecommendCnt() is called!!");
		
		int resultByDecrease = (int) getSqlSession().update("decreaseRecommendCnt", reviewId);
		System.out.println("ShopReviewDaoImpl>>resultByDecrease = " + resultByDecrease);
	}
	
	public int getTotalShopReviewDetView(int restaurantId) {
		// TODO Auto-generated method stub
		System.out.println("ShopReviewDaoImpl>>getTotalShopReviewDetView() is called!!");
		
		Integer totalCount = getSqlSession().selectOne("getTotalShopReviewDetView", restaurantId);
		
		return totalCount;
	}
}
