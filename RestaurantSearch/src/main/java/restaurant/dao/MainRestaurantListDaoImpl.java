package restaurant.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;


import restaurant.dto.MainRestaurantListDto;

public class MainRestaurantListDaoImpl extends SqlSessionDaoSupport implements MainRestaurantListDao {

	public List<MainRestaurantListDto> selectMainRestaurantList(){
		System.out.println("MainRestaurantListDaoImpl>>selectMainRestaurantList() is called!!");
		return  getSqlSession().selectList("selectMainRestaurantList");
	}

	public List<MainRestaurantListDto> selectNewRestaurantList() {
		System.out.println("MainRestaurantListDaoImpl>>selectNewRestaurantList() is called!!");
		return  getSqlSession().selectList("selectNewRestaurantList");
		
	}

	}
