package restaurant.controller;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import restaurant.dao.MainRestaurantListDao;
import restaurant.dto.MainRestaurantListDto;

@Controller
public class MainViewController {
	
	private Logger log=Logger.getLogger(this.getClass());//클래스 이름 불러오기

	@Autowired
	MainRestaurantListDao mainRestaurantListDao;
			
	@RequestMapping("/restaurantMain.do")
	public ModelAndView handle() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MainViewController가 처리함!");

		if(log.isDebugEnabled()){//디버그 모드라면
    		log.debug("mainRestaurantListDao:"+mainRestaurantListDao);
    	}
		
		List<MainRestaurantListDto> list=mainRestaurantListDao.selectMainRestaurantList();
		List<MainRestaurantListDto> newlist=mainRestaurantListDao.selectNewRestaurantList();
		List<MainRestaurantListDto> bestlist=mainRestaurantListDao.SelectBestRestaurantList();
		
		//ModelAndView mav=new ModelAndView("restaurantMainView");//이동할 페이지명
		ModelAndView mav=new ModelAndView("restaurantMainView2");
		
		mav.addObject("bestlist", bestlist);
		mav.addObject("list", list);
		mav.addObject("newlist", newlist);		
		
		System.out.println("mainRestarantListDto 등록됨!");
		return mav;
	}
}
