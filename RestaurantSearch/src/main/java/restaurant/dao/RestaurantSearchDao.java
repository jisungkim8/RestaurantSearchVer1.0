package restaurant.dao;

import java.util.HashMap;
import java.util.List;

import restaurant.dto.RestaurantDto2;
import restaurant.dto.RestaurantDto3;

public interface RestaurantSearchDao {
	/*public List<RestaurantDto2> selectRestaurantSearchByKeyword(List<String> keyword, int begin, int end);*/
	//public List<RestaurantDto2> selectRestaurantSearchByKeyword(List<Object> keyword);
	public int selectRestaurantSearchTotalCountByKeyWord(List<String> keyword);
	public List<RestaurantDto2> selectRestaurantSearchByKeyword(HashMap<String, Object> pagingMap);
	
	public int selectRestaurantSearchTotalCountBySearchOptionHashMap(HashMap<String, Object> searchOptionHashMap); 
	//public List<RestaurantDto2> selectRestaurantSearchBySearchOptionHashMap(HashMap<String, Object> searchOptionHashMap);
	public List<RestaurantDto3> selectRestaurantSearchBySearchOptionHashMap(HashMap<String, Object> searchOptionHashMap);
	public RestaurantDto3 selectRestaurantSearchById(Integer restaurantId);
	public List<RestaurantDto3> selectRestaurantSearchByMemberId(String memberId);

}
