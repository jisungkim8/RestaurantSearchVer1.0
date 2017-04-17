package restaurant.dao;

import java.util.HashMap;
import java.util.List;

import restaurant.dto.RestaurantDto;

public interface RestaurantSearchDao {
	public int selectRestaurantSearchTotalCountByKeyWord(List<String> keyword);
	public List<RestaurantDto> selectRestaurantSearchByKeyword(HashMap<String, Object> pagingMap);
	
	public int selectRestaurantSearchTotalCountBySearchOptionHashMap(HashMap<String, Object> searchOptionHashMap); 
	public List<RestaurantDto> selectRestaurantSearchBySearchOptionHashMap(HashMap<String, Object> searchOptionHashMap);
}
