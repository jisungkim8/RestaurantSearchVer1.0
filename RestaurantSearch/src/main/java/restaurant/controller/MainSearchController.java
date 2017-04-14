package restaurant.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import restaurant.dao.RestaurantSearchDao;
import restaurant.dto.RestaurantDto2;
import restaurant.dto.RestaurantDto3;
import restaurant.dto.RestaurantSimInfoDto2;
import restaurant.dto.SearchOptionObject;
import restaurant.util.PagingUtil;


//유효성 검사->입력->ok->boardWriter.jsp 화면에 출력
@Controller
public class MainSearchController {
private Logger log = Logger.getLogger(this.getClass());//클래스 이름 불러오기
	
	@Autowired
	RestaurantSearchDao restaurantSearchDao;
	PagingUtil pagingUtil;
	
	@RequestMapping(value = "/restaurantSearch.do", method = RequestMethod.GET)
	public ModelAndView restaurantSearch(@RequestParam("keyword") String keyword, 
			@RequestParam("pageNum") int pageNum) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("SearchViewController가 처리함!");
		//글목록보기에서 list()호출
		
		System.out.println("keyword = " + keyword);
		System.out.println("currentPage = " + pageNum);
		
		String[] keywordArray = keyword.split(" ");
		
		ArrayList<String> keywordList = new ArrayList<String>();
		for (String oneKeyWord : keywordArray) {
			keywordList.add(oneKeyWord);
		}
		
		int totalCount = restaurantSearchDao.selectRestaurantSearchTotalCountByKeyWord(keywordList);
		
		
		//pagingUtil = new PagingUtil(null, keywordList, pageNum, totalCount, 3, 2, "http://localhost:8090/RestaurantSearch/restaurantSearch.do", null);
		pagingUtil = new PagingUtil();
		pagingUtil.setPagingUtil(null, keywordList, pageNum, totalCount, 5, 2, "http://localhost:8090/RestaurantSearch/restaurantSearch.do", null);
		
		System.out.println("mainSearchController >> pageNum = " + pageNum);
		System.out.println("mainSearchController >> begin = " + pagingUtil.getStartCount());
		System.out.println("mainSearchController >> end = " + pagingUtil.getEndCount());
		System.out.println("mainSearchController >> totalCount = " + totalCount);
		
		HashMap<String, Object> pagingMap = new HashMap<String, Object>();
		pagingMap.put("keyword", keywordList);
		pagingMap.put("begin", pagingUtil.getStartCount());
		pagingMap.put("end", pagingUtil.getEndCount());
				
		List<RestaurantDto2> restaurants = restaurantSearchDao.selectRestaurantSearchByKeyword(pagingMap);
		
		for (RestaurantDto2 restaurantDto2 : restaurants) {
			System.out.println("식당명 : " + restaurantDto2.getRestaurantName());
		}
		
		ArrayList<RestaurantSimInfoDto2> restaurants2 = new ArrayList<RestaurantSimInfoDto2>();
		
		RestaurantSimInfoDto2 restaurant2 = null;
		
		for (RestaurantDto2 restaurantInfo : restaurants) {
			restaurant2 = new RestaurantSimInfoDto2();
			
			System.out.println("restaurantInfo.getKeyword() = " + restaurantInfo.getKeyword());
			
			String[] splitByPipeKeywords = restaurantInfo.getKeyword().split("\\|");
			
			String locationKeywords = splitByPipeKeywords[0];
			String foodKeywords = splitByPipeKeywords[2]; 
			String themeKeywords = splitByPipeKeywords[3];
			
			for (String string : splitByPipeKeywords) {
				System.out.println("splitByDollarKeywords >>string = " + string);
			}
			
			restaurant2.setRestaurantId(restaurantInfo.getRestaurantId());
			restaurant2.setRestaurantName(restaurantInfo.getRestaurantName());
			restaurant2.setAddr(restaurantInfo.getAddr());
			restaurant2.setPhoneNumber(restaurantInfo.getPhoneNumber());
			restaurant2.setReviewAverageScore(restaurantInfo.getAverageScore());
			restaurant2.setReviewNumber(45);
			restaurant2.setRepresentPhoto(restaurantInfo.getRepresentPhoto());
			restaurant2.setLocationKeywords(locationKeywords);
			restaurant2.setFoodKeywords(foodKeywords);
			restaurant2.setThemeKeywords(themeKeywords);
			
			restaurants2.add(restaurant2);
		}
		
		ModelAndView mav = new ModelAndView("restaurantListView");//이동할 페이지명
		
		mav.addObject("restaurantList", restaurants2);
		mav.addObject("keyword", keyword);
		mav.addObject("currentPage", pageNum);
		mav.addObject("pagingHtml", pagingUtil.getPagingHtml());
		
		System.out.println("MainSearchController >> pagingHtml = " + pagingUtil.getPagingHtml());
		return mav;
	}
	
	@RequestMapping(value = "/getRestaurants.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getRestaurants
	(@RequestParam("keyword") String keyword,
			@RequestParam("pageNum") int pageNum) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("SearchViewController가 처리함! >> getRestaurants.do");
		
		System.out.println("keyword = " + keyword);
		
		String[] keywordArray = null;
		if (keyword.contains("ㅗ@ㅠ")) {
			keywordArray = keyword.split("ㅗ@ㅠ");
		} else {
			keywordArray = keyword.split(" ");
		}
		
		ArrayList<String> keywordList = new ArrayList<String>();
		for(String oneKeyWord : keywordArray) {
			keywordList.add(oneKeyWord);
		}
		
		int totalCount = restaurantSearchDao.selectRestaurantSearchTotalCountByKeyWord(keywordList);
		
		//pagingUtil = new PagingUtil(null, keywordList, pageNum, totalCount, 5, 2, "http://localhost:8090/RestaurantSearch/restaurantSearch.do", null);
		pagingUtil = new PagingUtil();
		pagingUtil.setPagingUtil(null, keywordList, pageNum, totalCount, 5, 2, "http://localhost:8090/RestaurantSearch/restaurantSearch.do", null);
		
		System.out.println("mainSearchController >> pageNum = " + pageNum);
		System.out.println("mainSearchController >> begin = " + pagingUtil.getStartCount());
		System.out.println("mainSearchController >> end = " + pagingUtil.getEndCount());
		System.out.println("mainSearchController >> totalCount = " + totalCount);
		
		HashMap<String, Object> pagingMap = new HashMap<String, Object>();
		pagingMap.put("keyword", keywordList);
		pagingMap.put("begin", pagingUtil.getStartCount());
		pagingMap.put("end", pagingUtil.getEndCount());
				
		List<RestaurantDto2> restaurants = restaurantSearchDao.selectRestaurantSearchByKeyword(pagingMap);
		
		for (RestaurantDto2 restaurantDto2 : restaurants) {
			System.out.println("식당명 : " + restaurantDto2.getRestaurantName());
		}
		
		ArrayList<RestaurantSimInfoDto2> restaurants2 = new ArrayList<RestaurantSimInfoDto2>();
		
		RestaurantSimInfoDto2 restaurant2 = null;
		
		for (RestaurantDto2 restaurantInfo : restaurants) {
			restaurant2 = new RestaurantSimInfoDto2();
			
			System.out.println("restaurantInfo.getKeyword() = " + restaurantInfo.getKeyword());
			
			String[] splitByPipeKeywords = restaurantInfo.getKeyword().split("\\|");
			
			String locationKeywords = splitByPipeKeywords[0];
			String foodKeywords = splitByPipeKeywords[2]; 
			String themeKeywords = splitByPipeKeywords[3];
			
			for (String string : splitByPipeKeywords) {
				System.out.println("splitByDollarKeywords >>string = " + string);
			}
			
			restaurant2.setRestaurantId(restaurantInfo.getRestaurantId());
			restaurant2.setRestaurantName(restaurantInfo.getRestaurantName());
			restaurant2.setAddr(restaurantInfo.getAddr());
			restaurant2.setPhoneNumber(restaurantInfo.getPhoneNumber());
			restaurant2.setReviewAverageScore(restaurantInfo.getAverageScore());
			restaurant2.setReviewNumber(45);
			restaurant2.setRepresentPhoto(restaurantInfo.getRepresentPhoto());
			restaurant2.setLocationKeywords(locationKeywords);
			restaurant2.setFoodKeywords(foodKeywords);
			restaurant2.setThemeKeywords(themeKeywords);
			
			restaurants2.add(restaurant2);
		}
		
		HashMap<String, Object> pagingData = new HashMap<String, Object>();
		pagingData.put("restaurantList", restaurants2);
		pagingData.put("keyword", keyword);
		pagingData.put("currentPage", pageNum);
		pagingData.put("pagingHtml", pagingUtil.getPagingHtml());
		
		System.out.println("pagingHtml = " + pagingUtil.getPagingHtml());
		return pagingData;
	}
	
	
	@RequestMapping(value = "/getRestaurantsByFilter.do", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public HashMap<String, Object> getRestaurantsByFilter
	(@RequestBody String searchOptionString) throws Exception {
		// TODO Auto-generated method stub 
		System.out.println("SearchViewController가 처리함! >> getRestaurants.do");
		
		ObjectMapper mapper = new ObjectMapper();
		
		System.out.println("searchOptionObject = " + searchOptionString);
		
		SearchOptionObject searchOptionObject = mapper.readValue(searchOptionString, SearchOptionObject.class);
		 
		Integer minPrice = 0;
		Integer maxPrice = 0;
				
		HashMap<String, Object> searchOptionHashMap = new HashMap<String, Object>();
		
		System.out.println("searchOptionObject = " + searchOptionObject);
		System.out.println("searchOptionObject.keyword = " + searchOptionObject.getKeyword());
		System.out.println("searchOptionObject = " + searchOptionObject.getPageNum());
		
		for (String location : searchOptionObject.getLocation()) {
			System.out.println("location = " + location);
		}
		
		for (String food : searchOptionObject.getFood()) {
			System.out.println("food = " + food);
		}
		
		System.out.println("searchOptionObject = " + searchOptionObject.getBooking());
		System.out.println("searchOptionObject = " + searchOptionObject.getParking());
		System.out.println("searchOptionObject = " + searchOptionObject.getPrice());
		
		String[] keywordArray = null;
		String keyword = searchOptionObject.getKeyword();
		Integer pageNum = searchOptionObject.getPageNum();
		String price = searchOptionObject.getPrice();
		
		if (keyword.contains("ㅗ@ㅠ")) {
			keywordArray = keyword.split("ㅗ@ㅠ");
		} else {
			keywordArray = keyword.split(" ");
		}
		
		ArrayList<String> keywordList = new ArrayList<String>();
		for(String oneKeyWord : keywordArray) {
			keywordList.add(oneKeyWord);
		}
		
		searchOptionHashMap.put("keywordList", keywordList);
		searchOptionHashMap.put("pageNum", pageNum);
		
		if (searchOptionObject.getLocation().size() > 0) {
			searchOptionHashMap.put("location", searchOptionObject.getLocation());
		}
		
		if (searchOptionObject.getFood().size() > 0) {
			searchOptionHashMap.put("food", searchOptionObject.getFood());
		}
		
		if (!price.equals("가격:무관")) {
			if (price.equals("10000--")) {
				minPrice = 0;
				maxPrice = 10000;
			} else if (price.equals("10000++")) {
				minPrice = 10000;
				maxPrice = 20000;
			} else if (price.equals("20000++")) {
				minPrice = 20000;
				maxPrice = 30000;
			} else if (price.equals("30000++")) {
				minPrice = 30000;
				maxPrice = 40000;
			}
			searchOptionHashMap.put("minPrice", minPrice);
			searchOptionHashMap.put("maxPrice", maxPrice);
		}
		
		if (!searchOptionObject.getParking().equals("주차:무관")) {
			searchOptionHashMap.put("parking", searchOptionObject.getParking());
		}
		
		if (!searchOptionObject.getParking().equals("예약:무관")) {
			searchOptionHashMap.put("booking", searchOptionObject.getBooking());
		}
		
		int totalCount = restaurantSearchDao.selectRestaurantSearchTotalCountBySearchOptionHashMap(searchOptionHashMap);
		
		System.out.println("getRestaurantsByFilter >> totalCount = " + totalCount);
		
		pagingUtil = new PagingUtil();
		pagingUtil.setPagingUtil(null, keywordList, pageNum, totalCount, 5, 2, "http://localhost:8090/RestaurantSearch/restaurantSearch.do", null);
		
		System.out.println("mainSearchController >> pageNum = " + pageNum);
		System.out.println("mainSearchController >> begin = " + pagingUtil.getStartCount());
		System.out.println("mainSearchController >> end = " + pagingUtil.getEndCount());
		System.out.println("mainSearchController >> totalCount = " + totalCount);
		
		//HashMap<String, Object> pagingMap = new HashMap<String, Object>();
		//pagingMap.put("keyword", keywordList);
		//pagingMap.put("begin", pagingUtil.getStartCount());
		//pagingMap.put("end", pagingUtil.getEndCount()); 
		
		searchOptionHashMap.put("begin", pagingUtil.getStartCount());
		searchOptionHashMap.put("end", pagingUtil.getEndCount());
		
		//List<RestaurantDto2> restaurants = restaurantSearchDao.selectRestaurantSearchByKeyword(pagingMap);
		//List<RestaurantDto2> restaurants = restaurantSearchDao.selectRestaurantSearchBySearchOptionHashMap(searchOptionHashMap);
		List<RestaurantDto3> restaurants = restaurantSearchDao.selectRestaurantSearchBySearchOptionHashMap(searchOptionHashMap);
		
		/*for (RestaurantDto2 restaurantDto2 : restaurants) {
			System.out.println("식당명 : " + restaurantDto2.getRestaurantName());
		}*/
		
		for (RestaurantDto3 restaurantDto3 : restaurants) {
			System.out.println("식당명 : " + restaurantDto3.getRestaurantName());
		}
		
		ArrayList<RestaurantSimInfoDto2> restaurants2 = new ArrayList<RestaurantSimInfoDto2>();
		
		RestaurantSimInfoDto2 restaurant2 = null;
		
		
		for (RestaurantDto3 restaurantInfo : restaurants) {
			restaurant2 = new RestaurantSimInfoDto2();
			
			System.out.println("restaurantInfo.getKeyword() = " + restaurantInfo.getKeyword());
			
			String[] splitByPipeKeywords = restaurantInfo.getKeyword().split("\\|");
			
			String locationKeywords = splitByPipeKeywords[0];
			String foodKeywords = splitByPipeKeywords[2]; 
			String themeKeywords = splitByPipeKeywords[3];
			
			for (String string : splitByPipeKeywords) {
				System.out.println("splitByDollarKeywords >>string = " + string);
			}
			
			restaurant2.setRestaurantId(restaurantInfo.getRestaurantId());
			restaurant2.setRestaurantName(restaurantInfo.getRestaurantName());
			restaurant2.setAddr(restaurantInfo.getAddr());
			restaurant2.setPhoneNumber(restaurantInfo.getPhoneNumber());
			restaurant2.setReviewAverageScore(restaurantInfo.getAverageScore());
			restaurant2.setReviewNumber(45);
			restaurant2.setRepresentPhoto(restaurantInfo.getRepresentPhoto());
			restaurant2.setLocationKeywords(locationKeywords);
			restaurant2.setFoodKeywords(foodKeywords);
			restaurant2.setThemeKeywords(themeKeywords);
			
			restaurants2.add(restaurant2);
		}
		
		HashMap<String, Object> pagingData = new HashMap<String, Object>();
		pagingData.put("restaurantList", restaurants2);
		pagingData.put("keyword", keyword);
		pagingData.put("currentPage", pageNum);
		pagingData.put("pagingHtml", pagingUtil.getPagingHtml());
		
		System.out.println("pagingHtml = " + pagingUtil.getPagingHtml());
		
		return pagingData;
	}
}
