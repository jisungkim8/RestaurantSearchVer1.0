package restaurant.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
import restaurant.dto.ShopReviewCommand;
import restaurant.dto.ShopReviewDto;
import restaurant.util.DuplicateFile;
import restaurant.util.FileUtil2;

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
	
	@RequestMapping(value="/restaurantDetView.do", method=RequestMethod.GET)
	public ModelAndView process(@RequestParam(value="restaurantId") int restaurantId, @RequestParam(value="moreCount") Integer moreCount) {
		System.out.println("RestaurantDetViewController>>process() is called!!");
		
		// 로그
		if(log.isDebugEnabled()){
			System.out.println("RestaurantDetViewController>>log is occured by /restaurantDetView.do");
			log.debug("restaurantId : " + restaurantId);
			log.debug("moreCount = " + moreCount);
		}
		
		if (moreCount == null) {
			moreCount = 1;
		}
		
		Integer totCntOfReviewEnd = shopReviewDao.getTotalShopReviewDetView(restaurantId);
		Integer totCntOfReviewStart = totCntOfReviewEnd - 2;
		
		System.out.println("totCntOfReviewStart = " + totCntOfReviewStart);
		System.out.println("totCntOfReviewEnd = " + totCntOfReviewEnd);
		
		if (totCntOfReviewStart < 0) {
			totCntOfReviewStart = 0;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurantId", restaurantId);
		map.put("start", 1);
		map.put("end", 3);
		map.put("totCntOfReviewStart", totCntOfReviewStart);
		map.put("totCntOfReviewEnd", totCntOfReviewEnd);
		
		// DTO
		RestaurantDto restaurantDto = restaurantDao.selectRestaurantDetView(restaurantId);
		System.out.println("RestaurantDetViewController>>restaurantDto : " + restaurantDto);
		ShopDetInfoDto shopDetInfoDto = shopDetInfoDao.selectShopDetInfoDetView(restaurantId);
		System.out.println("RestaurantDetViewController>>shopDetInfoDto : " + shopDetInfoDto);
		ArrayList<ShopPhotoDto> shopPhotoDtoSepNum1 = (ArrayList<ShopPhotoDto>) shopPhotoDao.selectShopPhotoSepNum1DetView(restaurantId);
		System.out.println("RestaurantDetViewController>>shopPhotoDtoSepNum1 : " + shopPhotoDtoSepNum1);
		ArrayList<ShopPhotoDto> shopPhotoDtoSepNum2 = (ArrayList<ShopPhotoDto>) shopPhotoDao.selectShopPhotoSepNum2DetView(restaurantId);
		System.out.println("RestaurantDetViewController>>shopPhotoDtoSepNum2 : " + shopPhotoDtoSepNum2);
		ArrayList<ShopReviewDto> shopReviewDto = (ArrayList<ShopReviewDto>) shopReviewDao.selectShopReviewDetView(map);
		System.out.println("RestaurantDetViewController>>shopReviewDto : " + shopReviewDto);
		ArrayList<ReviewPhotoDto> reviewPhotoDto = (ArrayList<ReviewPhotoDto>) reviewPhotoDao.selectReviewPhotoDetView(map);
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
		
		mav.addObject("restaurantId", restaurantId);
		mav.addObject("restaurantDto", restaurantDto);
		mav.addObject("shopDetInfoDto", shopDetInfoDto);
		mav.addObject("keyword", keyword);
		mav.addObject("shopPhotoDtoSepNum1", shopPhotoDtoSepNum1);
		mav.addObject("shopPhotoDtoSepNum2", shopPhotoDtoSepNum2);
		mav.addObject("shopReviewDto", shopReviewDto);
		mav.addObject("reviewPhotoDto", reviewPhotoDto);
		
		return mav;
	}
	
	@RequestMapping(value="/restaurantDetView.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getJson(@RequestParam(value="restaurantId") int restaurantId) {
		HashMap<String, Object> reviewMap = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurantId", restaurantId);
		map.put("start", 1);
		map.put("end", 3);
		
		ArrayList<ShopReviewDto> shopReviewDto = (ArrayList<ShopReviewDto>) shopReviewDao.selectShopReviewDetView(map);
		System.out.println("RestaurantDetViewController>>shopReviewDto : " + shopReviewDto);
		ArrayList<ReviewPhotoDto> reviewPhotoDto = (ArrayList<ReviewPhotoDto>) reviewPhotoDao.selectReviewPhotoDetView(map);
		System.out.println("RestaurantDetViewController>>reviewPhotoDto : " + reviewPhotoDto);
		
		reviewMap.put("shopReviewDto", shopReviewDto);
		reviewMap.put("reviewPhotoDto", reviewPhotoDto);
		
		return reviewMap;
	}
	
	@ModelAttribute("reviewPhotoDto")
	public ReviewPhotoDto formBacking() {
		System.out.println("RestaurantDetViewController>>formBacking() is called!!");
		
		return new ReviewPhotoDto();
	}
	
	@RequestMapping(value="/reviewWrite.do", method=RequestMethod.POST)
	public String reviewSubmit(@ModelAttribute("reviewCommand") ShopReviewCommand reviewCommand, @RequestParam(value="restaurantId") int restaurantId, @RequestParam(value="moreCount") int moreCount, BindingResult result) {
		System.out.println("RestaurantDetViewController>>reviewSubmit() is called!!");
		
		if (log.isDebugEnabled()) {
			log.debug("reviewCommand = " + reviewCommand);
			log.debug("reviewCommand.getReviewId() = " + reviewCommand.getReviewId());
			log.debug("reviewCommand.getTitle() = " + reviewCommand.getTitle());
			log.debug("reviewCommand.getWriteDate() = " + reviewCommand.getWriteDate());
			log.debug("reviewCommand.getContent() = " + reviewCommand.getContent());
			log.debug("reviewCommand.getRecommendCnt() = " + reviewCommand.getRecommendCnt());
			log.debug("reviewCommand.getVisitTime() = " + reviewCommand.getVisitTime());
			log.debug("reviewCommand.getDinnerOrLunch() = " + reviewCommand.getDinnerOrLunch());
			log.debug("reviewCommand.getMemberId() = " + reviewCommand.getMemberId());
			log.debug("reviewCommand.getRestaurantId() = " + reviewCommand.getRestaurantId());
			log.debug("reviewCommand.getUpload() = " + reviewCommand.getUpload());
			log.debug("moreCount = " + moreCount);
		}
		
//		new ShopReviewValidator().validate(reviewCommand, result);
		
		if (result.hasErrors()) {
			System.out.println("result = " + result.getAllErrors());
			System.out.println("RestaurantDetViewController>>reviewSubmit()>>Errors are occued!!");
		}
		
		try {
			int newReivewId = shopReviewDao.getNewShopReviewDetView() + 1;
			int newPhotoId = reviewPhotoDao.getNewReviewPhotoDetView() + 1;
			ReviewPhotoDto reviewPhotoDto = null;
			
			reviewCommand.setReviewId(newReivewId);
			
			System.out.println("reviewCommand.reviewId = " + reviewCommand.getReviewId());
			System.out.println("reviewCommand.title = " + reviewCommand.getTitle());
			System.out.println("reviewCommand.content = " + reviewCommand.getContent());
			System.out.println("reviewCommand.visitTime = " + reviewCommand.getVisitTime());
			System.out.println("reviewCommand.dinnerOrLunch = " + reviewCommand.getDinnerOrLunch());
			System.out.println("reviewCommand.restaurantId = " + reviewCommand.getRestaurantId());
			System.out.println("reviewCommand.memberId = " + reviewCommand.getMemberId());
			System.out.println("reviewCommand.upload = " + reviewCommand.getUpload());
			shopReviewDao.insertShopReviewDetView(reviewCommand);
			
			for (MultipartFile uploadImg : reviewCommand.getUpload()) {
				int count = 0;
				
				if (!uploadImg.isEmpty()) {
					System.out.println("RestaurantDetViewController>>reviewSubmit()>>uploadImg = " + uploadImg.getOriginalFilename());
					
					File serverFile = DuplicateFile.getFile(FileUtil2.UPLOAD_PATH, uploadImg);
					System.out.println("RestaurantDetViewController>>reviewSubmit()>>serverFile = " + serverFile.getAbsolutePath().substring(serverFile.getAbsolutePath().lastIndexOf("\\")));
					
					reviewPhotoDto = new ReviewPhotoDto();
					
					reviewPhotoDto.setPhotoId(newPhotoId++);
					reviewPhotoDto.setPhotoPath("images" + serverFile.getAbsolutePath().substring(serverFile.getAbsolutePath().lastIndexOf("\\")));
					reviewPhotoDto.setReviewId(newReivewId);
					
					reviewPhotoDao.insertReviewPhotoDetView(reviewPhotoDto);
					
					uploadImg.transferTo(serverFile);
					
					count++;
				} else {
					if (count == 0) {
						reviewPhotoDto = new ReviewPhotoDto();
						
						reviewPhotoDto.setPhotoId(newPhotoId++);
						reviewPhotoDto.setPhotoPath("design/images/noimg.png");
						reviewPhotoDto.setReviewId(newReivewId);
						
						reviewPhotoDao.insertReviewPhotoDetView(reviewPhotoDto);
					} else {
						continue;
					}
				}
				
			}
				
		} catch(IOException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:restaurantDetView.do?restaurantId=" + restaurantId + "&moreCount=" + moreCount;
	}
	
	@RequestMapping(value="/recommend.do", method=RequestMethod.POST)
	public String increaseRecommend(@RequestParam(value="restaurantId") int restaurantId, @RequestParam(value="moreCount") int moreCount, @RequestParam(value="current") int reviewId) {
		System.out.println("RestaurantDetViewController>>increaseRecommend() is called!!");
		
		shopReviewDao.increaseRecommendCnt(reviewId);
		
		return "redirect:restaurantDetView.do?restaurantId=" + restaurantId;
	}
	
	@RequestMapping(value="/moreReview.do", method=RequestMethod.GET)
	public ModelAndView getMoreReview(@RequestParam(value="restaurantId") int restaurantId, @RequestParam(value="moreCount") int moreCount, @RequestParam(value="start") int start, @RequestParam(value="end") int end) {
		System.out.println("RestaurantDetViewController>>getMoreReview() is called!!");
		
		if (log.isDebugEnabled()) {
			log.debug("moreCount = " + moreCount);
		}
		
		ModelAndView mav = new ModelAndView();
		ArrayList<ShopReviewDto> shopReviewDto = new ArrayList<ShopReviewDto>();
		ArrayList<ReviewPhotoDto> reviewPhotoDto = new ArrayList<ReviewPhotoDto>();
		Map<String, Object> map = new HashMap<String, Object>();
		Integer totCntOfReviewEnd = shopReviewDao.getTotalShopReviewDetView(restaurantId) - moreCount*3;
		Integer totCntOfReviewStart = totCntOfReviewEnd - 2;
		boolean checkMoreReview = true;
		
		if (totCntOfReviewEnd < 0) {
			totCntOfReviewEnd = 0;
		}
		
		if (totCntOfReviewStart < 0) {
			totCntOfReviewStart = 0;
			checkMoreReview = false;
		}

		System.out.println("totCntOfReviewStart = " + totCntOfReviewStart);
		System.out.println("totCntOfReviewEnd = " + totCntOfReviewEnd);
		
		map.put("restaurantId", restaurantId);
		map.put("start", start);
		map.put("end", end);
		map.put("totCntOfReviewStart", totCntOfReviewStart);
		map.put("totCntOfReviewEnd", totCntOfReviewEnd);
		
		shopReviewDto = (ArrayList<ShopReviewDto>) shopReviewDao.selectShopReviewDetView(map);
		System.out.println("RestaurantDetViewController>>getMoreReview()>>shopReviewDto = " + shopReviewDto);
		reviewPhotoDto = (ArrayList<ReviewPhotoDto>) reviewPhotoDao.selectReviewPhotoDetView(map);
		System.out.println("RestaurantDetViewController>>getMoreReview()>>reviewPhotoDto = " + reviewPhotoDto);
		
		mav.setViewName("NewFile");
		
		mav.addObject("shopReviewDto", shopReviewDto);
		mav.addObject("reviewPhotoDto", reviewPhotoDto);
		mav.addObject("checkMoreReview", checkMoreReview);
		
		return mav;
	}
}
