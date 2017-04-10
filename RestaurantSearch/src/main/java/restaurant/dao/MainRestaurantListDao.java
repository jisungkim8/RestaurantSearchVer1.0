package restaurant.dao;

import java.util.List;
import java.util.Map;

import restaurant.dto.MainRestaurantListDto;

public interface MainRestaurantListDao {
	public List<MainRestaurantListDto> selectMainRestaurantList();
	public List<MainRestaurantListDto> selectNewRestaurantList();
}
