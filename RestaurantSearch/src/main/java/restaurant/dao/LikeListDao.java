package restaurant.dao;

import java.util.Map;

import restaurant.dto.LikeListDto;

public interface LikeListDao {
	public LikeListDto selectLikeList(Map<String, Object> map);
	public int getTotListCountByRestaurantId(int restaurantId);
	public int getNewListNum();
	public void insertLikeList(LikeListDto likeListDto);
	public void deleteLikeList(LikeListDto likeListDto);
}
