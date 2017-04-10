package restaurant.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import restaurant.dto.RestaurantDto2;

public class RestaurantSearchDaoImpl extends SqlSessionDaoSupport implements RestaurantSearchDao {
	/*public List<RestaurantDto2> selectRestaurantSearchByKeyword(List<String> keyword, int begin, int end) {
		// TODO Auto-generated method stub
		System.out.println("RestaurantSearchDaoImpl>>selectRestaurantSearchByKeyword() is called!!");
		 
		return getSqlSession().selectList("selectRestaurantSearchView", keyword);
	}*/
	
	/*public List<RestaurantDto2> selectRestaurantSearchByKeyword(List<Object> keyword) {
		// TODO Auto-generated method stub
		System.out.println("RestaurantSearchDaoImpl>>selectRestaurantSearchByKeyword() is called!!");
		 
		return getSqlSession().selectList("selectRestaurantSearchView", keyword);
	}*/
	
	public List<RestaurantDto2> selectRestaurantSearchByKeyword(HashMap<String, Object> pagingMap) {
		// TODO Auto-generated method stub
		System.out.println("RestaurantSearchDaoImpl>>selectRestaurantSearchByKeyword() is called!!");
		 
		return getSqlSession().selectList("selectRestaurantSearchView", pagingMap);
	}

	public int selectRestaurantSearchTotalCountByKeyWord(List<String> keyword) {
		// TODO Auto-generated method stub
		System.out.println("RestaurantSearchDaoImpl>>selectRestaurantSearchTotalCountByKeyWord() is called!!");
		return getSqlSession().selectOne("selectRestaurantSearchViewCount", keyword);
	}

}
