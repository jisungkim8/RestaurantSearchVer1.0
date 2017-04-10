package restaurant.controller;

import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import restaurant.dao.RestaurantDao;
import restaurant.dao.ReviewPhotoDao;
import restaurant.dao.ShopDetInfoDao;
import restaurant.dao.ShopPhotoDao;
import restaurant.dao.ShopReviewDao;
import restaurant.dto.RestaurantDto;
import restaurant.dto.ReviewPhotoDto;
import restaurant.dto.ShopDetInfoDto;
import restaurant.dto.ShopPhotoDto;
import restaurant.dto.ShopReviewDto;

@Controller
public class RestaurantDetViewController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	@Autowired
	private ShopDetInfoDao shopDetInfoDao;
	
	@Autowired
	private ShopPhotoDao shopPhotoDao;
	
	@Autowired
	private ShopReviewDao shopReviewDao; 
	
	@Autowired
	private ReviewPhotoDao reviewPhotoDao; 
	
	@RequestMapping("/restaurantDetView.do")
	public ModelAndView process(@RequestParam(value="restaurantId") int restaurantId) {
		System.out.println("RestaurantDetViewController>>process() is called!!");
		
		// 로그
		if(log.isDebugEnabled()){
			System.out.println("RestaurantDetViewController>>log is occured by /single.do");
			log.debug("restaurantId : " + restaurantId);
		}
		
		// DTO
		RestaurantDto restaurantDto = restaurantDao.selectRestaurantDetView(restaurantId);
		System.out.println("RestaurantDetViewController>>restaurantDto : " + restaurantDto);
		ShopDetInfoDto shopDetInfoDto = shopDetInfoDao.selectShopDetInfoDetView(restaurantId);
		System.out.println("RestaurantDetViewController>>shopDetInfoDto : " + shopDetInfoDto);
		ArrayList<ShopPhotoDto> shopPhotoDtoSepNum1 = (ArrayList<ShopPhotoDto>) shopPhotoDao.selectShopPhotoSepNum1DetView(restaurantId);
		System.out.println("RestaurantDetViewController>>shopPhotoDtoSepNum1 : " + shopPhotoDtoSepNum1);
		ArrayList<ShopPhotoDto> shopPhotoDtoSepNum2 = (ArrayList<ShopPhotoDto>) shopPhotoDao.selectShopPhotoSepNum2DetView(restaurantId);
		System.out.println("RestaurantDetViewController>>shopPhotoDtoSepNum2 : " + shopPhotoDtoSepNum2);
		ArrayList<ShopReviewDto> shopReviewDto = (ArrayList<ShopReviewDto>) shopReviewDao.selectShopReviewDetView(restaurantId);
		System.out.println("RestaurantDetViewController>>shopReviewDto : " + shopReviewDto);
		ArrayList<ReviewPhotoDto> reviewPhotoDto = (ArrayList<ReviewPhotoDto>) reviewPhotoDao.selectReviewPhotoDetView(restaurantId);
		System.out.println("RestaurantDetViewController>>reviewPhotoDto : " + reviewPhotoDto);
		
		// keyword 처리
		ArrayList<String> keyword = new ArrayList<String>();
		String[] str = null;

		if (restaurantDto.getKeyword() != null) {
			str = restaurantDto.getKeyword().split(" ");

			for (int i=0; i<str.length; i++) {
				keyword.add(str[i]);
			}
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("restaurantDetView");
		
		mav.addObject("restaurantDto", restaurantDto);
		mav.addObject("shopDetInfoDto", shopDetInfoDto);
		mav.addObject("keyword", keyword);
		mav.addObject("shopPhotoDtoSepNum1", shopPhotoDtoSepNum1);
		mav.addObject("shopPhotoDtoSepNum2", shopPhotoDtoSepNum2);
		mav.addObject("shopReviewDto", shopReviewDto);
		mav.addObject("reviewPhotoDto", reviewPhotoDto);
		
		return mav;
	}
}
