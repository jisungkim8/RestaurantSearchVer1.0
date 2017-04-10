package restaurant.dao;

import java.util.HashMap;
import java.util.List;

import restaurant.dto.RestaurantDto2;

public interface RestaurantSearchDao {
	/*public List<RestaurantDto2> selectRestaurantSearchByKeyword(List<String> keyword, int begin, int end);*/
	//public List<RestaurantDto2> selectRestaurantSearchByKeyword(List<Object> keyword);
	public List<RestaurantDto2> selectRestaurantSearchByKeyword(HashMap<String, Object> pagingMap);
	public int selectRestaurantSearchTotalCountByKeyWord(List<String> keyword); 
}
