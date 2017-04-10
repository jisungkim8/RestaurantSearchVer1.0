package restaurant.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import restaurant.dto.ReviewPhotoDto;

public class ReviewPhotoDaoImpl extends SqlSessionDaoSupport implements ReviewPhotoDao {

	public List<ReviewPhotoDto> selectReviewPhotoDetView(int restaurantId) {
		// TODO Auto-generated method stub
		System.out.println("ReviewPhotoDaoImpl>>selectReviewPhotoDetView() is called!!");
		
		return getSqlSession().selectList("selectReviewPhotoDetView", restaurantId);
	}

}
