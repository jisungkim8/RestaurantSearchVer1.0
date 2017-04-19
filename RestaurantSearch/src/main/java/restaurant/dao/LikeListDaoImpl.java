package restaurant.dao;

import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import restaurant.dto.LikeListDto;

public class LikeListDaoImpl extends SqlSessionDaoSupport implements LikeListDao {

	public LikeListDto selectLikeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println("LikeListDaoImpl>>selectLikeList() is called!!");
		
		return getSqlSession().selectOne("selectLikeList", map);
	}
	
	public int getTotListCountByRestaurantId(int restaurantId) {
		// TODO Auto-generated method stub
		System.out.println("LikeListDaoImpl>>getTotList() is called!!");
		
		int listCount = getSqlSession().selectOne("getTotListCountByRestaurantId", restaurantId);
		System.out.println("LikeListDaoImpl>>listCount = " + listCount);
		
		return listCount;
	}
	
	public int getNewListNum() {
		// TODO Auto-generated method stub
		System.out.println("LikeListDaoImpl>>getNewListNum() is called!!");
		
		Integer newListNum = getSqlSession().selectOne("getNewListNum");
		
		if (newListNum == null) {
			newListNum = 0;
		}
		
		return newListNum;
	}

	public void insertLikeList(LikeListDto likeListDto) {
		// TODO Auto-generated method stub
		System.out.println("LikeListDaoImpl>>insertLikeList() is called!!");
		
		int insertLikeList = getSqlSession().insert("insertLikeList", likeListDto);
		System.out.println("LikeListDaoImple>>insertLikeList()>>insertLikeList = " + insertLikeList);
	}
	
	public void deleteLikeList(LikeListDto likeListDto) {
		// TODO Auto-generated method stub
		System.out.println("LikeListDaoImpl>>deleteLikeList() is called!!");
		
		int deleteLikeList = getSqlSession().insert("deleteLikeList", likeListDto);
		System.out.println("LikeListDaoImple>>deleteLikeList()>>deleteLikeList = " + deleteLikeList);
	}
}
