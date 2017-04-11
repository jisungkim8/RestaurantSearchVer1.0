package restaurant.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import restaurant.dto.ReviewPhotoDto;

public class ReviewPhotoDaoImpl extends SqlSessionDaoSupport implements ReviewPhotoDao {

	public List<ReviewPhotoDto> selectReviewPhotoDetView(Map<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println("ReviewPhotoDaoImpl>>selectReviewPhotoDetView() is called!!");
		
		return getSqlSession().selectList("selectReviewPhotoDetView", map);
	}
	
	public int getNewReviewPhotoDetView() {
		// TODO Auto-generated method stub
		System.out.println("ReviewPhotoDaoImpl>>getNewReviewPhotoDetView() is called!!");
		
		Integer newPhotoId = getSqlSession().selectOne("getNewReviewPhotoDetView");
		
		if (newPhotoId == null) {
			newPhotoId = 0;
		}
		
		return newPhotoId;
	}

	public void insertReviewPhotoDetView(ReviewPhotoDto reviewPhotoDto) {
		// TODO Auto-generated method stub
		System.out.println("ReviewPhotoDaoImpl>>insertReviewPhotoDetView() is called!!");
		
		int resultByInsert = getSqlSession().insert("insertReviewPhotoDetView", reviewPhotoDto);
		System.out.println("ReviewPhotoDaoImpl>>resultByInsert = " + resultByInsert);
	}
}
