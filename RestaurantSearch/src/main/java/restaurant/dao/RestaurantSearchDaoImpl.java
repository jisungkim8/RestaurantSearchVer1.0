package restaurant.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import restaurant.dto.RestaurantDto;

public class RestaurantSearchDaoImpl extends SqlSessionDaoSupport implements RestaurantSearchDao {
	public List<RestaurantDto> selectRestaurantSearchByKeyword(HashMap<String, Object> pagingMap) {
		// TODO Auto-generated method stub
		System.out.println("RestaurantSearchDaoImpl>>selectRestaurantSearchByKeyword() is called!!");

		return getSqlSession().selectList("selectRestaurantSearchView", pagingMap);
	}

	public int selectRestaurantSearchTotalCountByKeyWord(List<String> keyword) {
		// TODO Auto-generated method stub
		System.out.println("RestaurantSearchDaoImpl>>selectRestaurantSearchTotalCountByKeyWord() is called!!");
		return getSqlSession().selectOne("selectRestaurantSearchViewCount", keyword);
	}

	public int selectRestaurantSearchTotalCountBySearchOptionHashMap(HashMap<String, Object> searchOptionHashMap) {
		// TODO Auto-generated method stub
		//return 0;

		System.out.println("RestaurantSearchDaoImpl>>selectRestaurantSearchTotalCountBySearchOptionHashMap() is called!!");
		return getSqlSession().selectOne("selectRestaurantSearchViewCountByFilter", searchOptionHashMap);
	}

	public List<RestaurantDto> selectRestaurantSearchBySearchOptionHashMap(
			HashMap<String, Object> searchOptionHashMap) {
		// TODO Auto-generated method stub
		//return null;
		return getSqlSession().selectList("selectRestaurantSearchViewByFilter", searchOptionHashMap);
	}
}
