package restaurant.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import restaurant.dao.RestaurantSearchDao;
import restaurant.dto.RestaurantDto2;
import restaurant.dto.RestaurantSimInfoDto2;
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
		pagingUtil.setPagingUtil(null, keywordList, pageNum, totalCount, 3, 2, "http://localhost:8090/RestaurantSearch/restaurantSearch.do", null);
		
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
		pagingUtil.setPagingUtil(null, keywordList, pageNum, totalCount, 3, 2, "http://localhost:8090/RestaurantSearch/restaurantSearch.do", null);
		
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
}
