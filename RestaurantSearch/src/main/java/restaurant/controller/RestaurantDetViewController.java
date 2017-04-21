package restaurant.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import restaurant.dao.LikeListDao;
import restaurant.dao.MemberDao;
import restaurant.dao.RestaurantDao;
import restaurant.dao.ReviewPhotoDao;
import restaurant.dao.ShopDetInfoDao;
import restaurant.dao.ShopPhotoDao;
import restaurant.dao.ShopReviewDao;
import restaurant.dto.LikeListDto;
import restaurant.dto.MemDetInfoDto;
import restaurant.dto.MemSimInfoDto;
import restaurant.dto.RestaurantDto;
import restaurant.dto.ReviewPhotoDto;
import restaurant.dto.ShopDetInfoDto;
import restaurant.dto.ShopPhotoDto;
import restaurant.dto.ShopReviewCommand;
import restaurant.util.DuplicateFile;
import restaurant.util.FileUtil2;
import restaurant.util.StringUtil;
import restaurant.validator.ShopReviewValidator;

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
	
	@Autowired
	private LikeListDao likeListDao;
	
	@Autowired
	private MemberDao memberDao;
	
	boolean checkMoreReview = true;
	
	@RequestMapping(value="/restaurantDetView.do", method=RequestMethod.GET)
	public ModelAndView process(@RequestParam(value="restaurantId") int restaurantId, 
								@RequestParam(value="moreCount") Integer moreCount, 
								@RequestParam(value="filterName", defaultValue="reviewId") String filterName) {
		System.out.println("RestaurantDetViewController>>process() is called!!");
		
		// 로그
		if(log.isDebugEnabled()){
			System.out.println("RestaurantDetViewController>>log is occured by /restaurantDetView.do");
			log.debug("restaurantId : " + restaurantId);
			log.debug("moreCount = " + moreCount);
			log.debug("filterName = " + filterName);
		}
		
		restaurantDao.increaseViewCountRestaurantDetView(restaurantId);
		
		Integer totReviewCnt = shopReviewDao.getTotalShopReviewDetView(restaurantId);
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("restaurantId", restaurantId);
//		map.put("start", 1);
//		map.put("end", 3);
//		map.put("filterName", filterName);
		
		// DTO
		RestaurantDto restaurantDto = restaurantDao.selectRestaurantDetView(restaurantId);
		System.out.println("RestaurantDetViewController>>restaurantDto : " + restaurantDto);
		
		ShopDetInfoDto shopDetInfoDto = shopDetInfoDao.selectShopDetInfoDetView(restaurantId);
		System.out.println("RestaurantDetViewController>>shopDetInfoDto : " + shopDetInfoDto);
		
		ArrayList<ShopPhotoDto> shopPhotoDtoSepNum1 = (ArrayList<ShopPhotoDto>) shopPhotoDao.selectShopPhotoSepNum1DetView(restaurantId);
		System.out.println("RestaurantDetViewController>>shopPhotoDtoSepNum1 : " + shopPhotoDtoSepNum1);
		
		ArrayList<ShopPhotoDto> shopPhotoDtoSepNum2 = (ArrayList<ShopPhotoDto>) shopPhotoDao.selectShopPhotoSepNum2DetView(restaurantId);
		System.out.println("RestaurantDetViewController>>shopPhotoDtoSepNum2 : " + shopPhotoDtoSepNum2);
		
//		ArrayList<ShopReviewCommand> shopReviewDto = (ArrayList<ShopReviewCommand>) shopReviewDao.selectShopReviewDetView(map);
//		System.out.println("RestaurantDetViewController>>shopReviewDto : " + shopReviewDto);
//		
//		map.put("shopReviewDto", shopReviewDto);
//		
//		ArrayList<ReviewPhotoDto> reviewPhotoByReviewIdDto = (ArrayList<ReviewPhotoDto>) reviewPhotoDao.selectReviewPhotoByReviewIdDetView(map);
//		System.out.println("RestaurantDetViewController>>reviewPhotoByReviewIdDto : " + reviewPhotoByReviewIdDto);
//		
//		if (!shopReviewDto.isEmpty()) {
//			for (int i=0; i<shopReviewDto.size(); i++) {
//				ArrayList<ReviewPhotoDto> list = new ArrayList<ReviewPhotoDto>();
//				
//				for (int j=0; j<reviewPhotoByReviewIdDto.size(); j++) {
//					if (shopReviewDto.get(i).getReviewId() == reviewPhotoByReviewIdDto.get(j).getReviewId()) {
//						list.add(reviewPhotoByReviewIdDto.get(j));
//					}
//				}
//				
//				shopReviewDto.get(i).setReviewPhotoDtoList(list);
//			}
//		}
		
		// keyword 처리
		ArrayList<String> keyword = new ArrayList<String>();
		String[] str = null;

		if (restaurantDto != null) {
			if (restaurantDto.getKeyword() != null) {
				str = restaurantDto.getKeyword().split("\\|");
	
				for (int i=0; i<str.length; i++) {
					keyword.add(str[i]);
				}
			}
		}
		
		// 번지명 주소, 도로명 주소
		String[] addr = null;
		
		if (restaurantDto != null) {
			addr = restaurantDto.getAddr().split(",");
			restaurantDto.setAddr(addr[0].trim() + " (" + addr[1].trim() + ")");
		}
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("restaurantDetView");
		
		mav.addObject("restaurantId", restaurantId);
		mav.addObject("restaurantDto", restaurantDto);
		mav.addObject("shopDetInfoDto", shopDetInfoDto);
		mav.addObject("keyword", keyword);
		mav.addObject("shopPhotoDtoSepNum1", shopPhotoDtoSepNum1);
		mav.addObject("shopPhotoDtoSepNum2", shopPhotoDtoSepNum2);
//		mav.addObject("shopReviewDto", shopReviewDto);
//		mav.addObject("reviewPhotoByReviewIdDto", reviewPhotoByReviewIdDto);
		mav.addObject("totReviewCnt", totReviewCnt);
		
		return mav;
	}
	
	@ModelAttribute("reviewPhotoDto")
	public ReviewPhotoDto formBacking() {
		System.out.println("RestaurantDetViewController>>formBacking() is called!!");
		
		return new ReviewPhotoDto();
	}
	
	@RequestMapping(value="/reviewWrite.do", method=RequestMethod.POST)
	public String reviewWrite(@ModelAttribute("reviewCommand") ShopReviewCommand reviewCommand, 
								@RequestParam(value="restaurantId") int restaurantId, 
								@RequestParam(value="moreCount") int moreCount, 
								@RequestParam(value="filterName") String filterName,
								BindingResult result) {
		System.out.println("RestaurantDetViewController>>reviewWrite() is called!!");
		
		int count = 0;
		
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
		
		new ShopReviewValidator().validate(reviewCommand, result);
		
		if (result.hasErrors()) {
			System.out.println("result = " + result.getAllErrors());
			System.out.println("RestaurantDetViewController>>reviewSubmit()>>Errors are occued!!");
			return "redirect:restaurantDetView.do?restaurantId=" + restaurantId + "&moreCount=" + moreCount + "&filterName=" + filterName;
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
				
				
				if (!uploadImg.isEmpty()) {
					reviewPhotoDto = new ReviewPhotoDto();
					
					System.out.println("RestaurantDetViewController>>reviewSubmit()>>uploadImg = " + uploadImg.getOriginalFilename());
					
					File serverFile = DuplicateFile.getFile(FileUtil2.UPLOAD_PATH, uploadImg);
					System.out.println("RestaurantDetViewController>>reviewSubmit()>>serverFile = " + serverFile.getAbsolutePath().substring(serverFile.getAbsolutePath().lastIndexOf("\\")+1));
					
					
					reviewPhotoDto.setPhotoId(newPhotoId++);
					reviewPhotoDto.setPhotoPath(serverFile.getAbsolutePath().substring(serverFile.getAbsolutePath().lastIndexOf("\\") + 1));
					reviewPhotoDto.setReviewId(newReivewId);
					
					reviewPhotoDao.insertReviewPhotoDetView(reviewPhotoDto);
					
					uploadImg.transferTo(serverFile);
					
					count++;
				} else {
					if (count == 0) {

						reviewPhotoDto = new ReviewPhotoDto();
						reviewPhotoDto.setPhotoId(newPhotoId++);
						reviewPhotoDto.setPhotoPath("noimg.png");
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
		
		return "redirect:restaurantDetView.do?restaurantId=" + restaurantId + "&moreCount=" + moreCount + "&filterName=" + filterName;
	}
	
	@RequestMapping(value="/reviewUpdate.do", method=RequestMethod.POST)
	public String reviewUpdate(@ModelAttribute("reviewCommand") ShopReviewCommand reviewCommand, 
								@RequestParam(value="restaurantId") int restaurantId, 
								@RequestParam(value="moreCount") int moreCount, 
								@RequestParam(value="filterName") String filterName,
								BindingResult result) {
		System.out.println("RestaurantDetViewController>>reviewUpdate() is called!!");
		
		int count = 0;
		
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
		
		new ShopReviewValidator().validate(reviewCommand, result);
		
		if (result.hasErrors()) {
			System.out.println("result = " + result.getAllErrors());
			System.out.println("RestaurantDetViewController>>reviewUpdate()>>Errors are occued!!");
			return "redirect:restaurantDetView.do?restaurantId=" + restaurantId + "&moreCount=" + moreCount + "&filterName=" + filterName;
		}
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("reviewId", reviewCommand.getReviewId());
			
			ArrayList<ReviewPhotoDto> reviewPhotoDtoForDelete = (ArrayList<ReviewPhotoDto>) reviewPhotoDao.selectReviewPhotoByReviewIdDetView(map);
			
			
			for (ReviewPhotoDto photoPathForDelete : reviewPhotoDtoForDelete) {
				System.out.println("upload Path = " + FileUtil2.UPLOAD_PATH + "/" + photoPathForDelete.getPhotoPath());
				File existFile = new File(FileUtil2.UPLOAD_PATH + "/" + photoPathForDelete.getPhotoPath());
				
				if (existFile.exists()) {
					System.out.println("File is deleted!!");
					existFile.delete();
				} else {
					System.out.println("File is not exist!!");
				}
			}
			
			reviewPhotoDao.deleteReviewPhotoDetView(reviewCommand.getReviewId());
			
			int newPhotoId = reviewPhotoDao.getNewReviewPhotoDetView() + 1;
			ReviewPhotoDto reviewPhotoDto = null;
			
			System.out.println("reviewCommand.reviewId = " + reviewCommand.getReviewId());
			System.out.println("reviewCommand.title = " + reviewCommand.getTitle());
			System.out.println("reviewCommand.content = " + reviewCommand.getContent());
			System.out.println("reviewCommand.visitTime = " + reviewCommand.getVisitTime());
			System.out.println("reviewCommand.dinnerOrLunch = " + reviewCommand.getDinnerOrLunch());
			System.out.println("reviewCommand.restaurantId = " + reviewCommand.getRestaurantId());
			System.out.println("reviewCommand.memberId = " + reviewCommand.getMemberId());
			System.out.println("reviewCommand.upload = " + reviewCommand.getUpload());
			shopReviewDao.updateShopReviewDetView(reviewCommand);
			
			for (MultipartFile uploadImg : reviewCommand.getUpload()) {
				
				if (!uploadImg.isEmpty()) {
					System.out.println("RestaurantDetViewController>>reviewSubmit()>>uploadImg = " + uploadImg.getOriginalFilename());
					
					File serverFile = DuplicateFile.getFile(FileUtil2.UPLOAD_PATH, uploadImg);
					System.out.println("RestaurantDetViewController>>reviewSubmit()>>serverFile = " + serverFile.getAbsolutePath().substring(serverFile.getAbsolutePath().lastIndexOf("\\") + 1));
					
					reviewPhotoDto = new ReviewPhotoDto();
					
					reviewPhotoDto.setPhotoId(newPhotoId++);
					reviewPhotoDto.setPhotoPath(serverFile.getAbsolutePath().substring(serverFile.getAbsolutePath().lastIndexOf("\\") + 1));
					reviewPhotoDto.setReviewId(reviewCommand.getReviewId());
					
					reviewPhotoDao.insertReviewPhotoDetView(reviewPhotoDto);
					
					uploadImg.transferTo(serverFile);
					
					count++;
				} else {
					if (count == 0) {

						reviewPhotoDto = new ReviewPhotoDto();
						reviewPhotoDto.setPhotoId(newPhotoId++);
						reviewPhotoDto.setPhotoPath("noimg.png");
						reviewPhotoDto.setReviewId(reviewCommand.getReviewId());
						
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
		
		return "redirect:restaurantDetView.do?restaurantId=" + restaurantId + "&moreCount=" + moreCount + "&filterName=" + filterName;
	}
	
	@RequestMapping(value="/reviewDelete.do", method=RequestMethod.GET)
	public String reviewDelete(@RequestParam(value="restaurantId") int restaurantId, 
								@RequestParam(value="current") int reviewId, 
								@RequestParam(value="moreCount") int moreCount, 
								@RequestParam(value="filterName") String filterName,
								HttpSession session) {
		System.out.println("RestaurantDetViewController>>reviewDelete() is called!!");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (log.isDebugEnabled()) {
			log.debug("restaurantId = " + restaurantId);
			log.debug("reviewId = " + reviewId);
			log.debug("reviewId = " + moreCount);
			log.debug("reviewId = " + filterName);
		}
		
		map.put("restaurantId", restaurantId);
		map.put("reviewId", reviewId);
		
		ArrayList<ReviewPhotoDto> reviewPhotoDtoForDelete = (ArrayList<ReviewPhotoDto>) reviewPhotoDao.selectReviewPhotoByReviewIdDetViewForDelete(reviewId);
		System.out.println(reviewPhotoDtoForDelete.size());
		
		for (ReviewPhotoDto photoPathForDelete : reviewPhotoDtoForDelete) {
			System.out.println("upload Path = " + FileUtil2.UPLOAD_PATH + "/" + photoPathForDelete.getPhotoPath());
			File existFile = new File(FileUtil2.UPLOAD_PATH + "/" + photoPathForDelete.getPhotoPath());
			
			if (existFile.exists()) {
				System.out.println("File is deleted!!");
				existFile.delete();
			} else {
				System.out.println("File is not exist!!");
			}
		}
		
		reviewPhotoDao.deleteReviewPhotoDetView(reviewId);
		shopReviewDao.deleteShopReviewDetView(map);
				
		return "redirect:restaurantDetView.do?restaurantId=" + restaurantId + "&moreCount=" + moreCount + "&filterName=" + filterName;
	}
	
	@RequestMapping(value="/moreReview.do", method=RequestMethod.GET)
	public ModelAndView getMoreReview(@RequestParam(value="restaurantId") int restaurantId, 
										@RequestParam(value="moreCount") int moreCount, 
										@RequestParam(value="start") int start, 
										@RequestParam(value="end") int end, 
										@RequestParam(value="filterName") String filterName) {
		System.out.println("RestaurantDetViewController>>getMoreReview() is called!!");
		
		if (log.isDebugEnabled()) {
			log.debug("moreCount = " + moreCount);
			log.debug("filterName = " + filterName);
		}
		
		ModelAndView mav = new ModelAndView();
		ArrayList<ShopReviewCommand> shopReviewDto = new ArrayList<ShopReviewCommand>();
		ArrayList<ReviewPhotoDto> reviewPhotoByReviewIdDto = new ArrayList<ReviewPhotoDto>();
		ArrayList<MemDetInfoDto> memberForReview = new ArrayList<MemDetInfoDto>();
		Map<String, Object> map = new HashMap<String, Object>();
		checkMoreReview = true;

		Integer totReviewCnt = shopReviewDao.getTotalShopReviewDetView(restaurantId);
		
		if (end >= totReviewCnt) {
			end = totReviewCnt;
			checkMoreReview = false;
		}
		
		map.put("restaurantId", restaurantId);
		map.put("start", start);
		map.put("end", end);
		map.put("filterName", filterName);
		
		shopReviewDto = (ArrayList<ShopReviewCommand>) shopReviewDao.selectShopReviewDetView(map);
		System.out.println("RestaurantDetViewController>>getMoreReview()>>shopReviewDto = " + shopReviewDto);
		
		map.put("shopReviewDto", shopReviewDto);
		
		reviewPhotoByReviewIdDto = (ArrayList<ReviewPhotoDto>) reviewPhotoDao.selectReviewPhotoByReviewIdDetView(map);
		System.out.println("RestaurantDetViewController>>reviewPhotoByReviewIdDto : " + reviewPhotoByReviewIdDto);
		
		memberForReview = (ArrayList<MemDetInfoDto>) memberDao.selectMemberForReview(map);
		System.out.println("RestaurantDetViewController>>memberIdForReview : " + memberForReview);
		
		if (!shopReviewDto.isEmpty()) {
			for (int i=0; i<shopReviewDto.size(); i++) {
				ArrayList<ReviewPhotoDto> list = new ArrayList<ReviewPhotoDto>();
				
				for (int j=0; j<reviewPhotoByReviewIdDto.size(); j++) {
					if (shopReviewDto.get(i).getReviewId() == reviewPhotoByReviewIdDto.get(j).getReviewId()) {
						list.add(reviewPhotoByReviewIdDto.get(j));
					}
				}
				shopReviewDto.get(i).setContent(StringUtil.parseBr(shopReviewDto.get(i).getContent()));
				shopReviewDto.get(i).setReviewPhotoDtoList(list);
			}
		}
		
		mav.setViewName("moreReview");
		
		mav.addObject("shopReviewDto", shopReviewDto);
		mav.addObject("memberForReview", memberForReview);
		mav.addObject("checkMoreReview", checkMoreReview);
		
		return mav;
	}
	
	@RequestMapping(value="/orderByRecommendCnt.do", method=RequestMethod.GET)
	public ModelAndView reviewFilterByRecommendCnt(@RequestParam(value="restaurantId") int restaurantId, 
													@RequestParam(value="moreCount") int moreCount, 
													@RequestParam(value="start") int start, 
													@RequestParam(value="end") int end, 
													@RequestParam(value="filterName") String filterName) {
		System.out.println("RestaurantDetViewController>>reviewFilterByRecommendCnt() is called!!");
		
		if (log.isDebugEnabled()) {
			log.debug("moreCount = " + moreCount);
			log.debug("filterName = " + filterName);
		}
		
		Integer totReviewCnt = shopReviewDao.getTotalShopReviewDetView(restaurantId);
		
		ModelAndView mav = new ModelAndView();
		ArrayList<ShopReviewCommand> shopReviewDto = new ArrayList<ShopReviewCommand>();
		ArrayList<ReviewPhotoDto> reviewPhotoByReviewIdDto = new ArrayList<ReviewPhotoDto>();
		Map<String, Object> map = new HashMap<String, Object>();
		checkMoreReview = true;
		
		System.out.println("end = " + end);
		System.out.println("totReviewCnt = " + totReviewCnt);
		if (end >= totReviewCnt) {
			end = totReviewCnt;
			checkMoreReview = false;
		}

		map.put("restaurantId", restaurantId);
		map.put("start", start);
		map.put("end", end);
		map.put("filterName", filterName);
		
		shopReviewDto = (ArrayList<ShopReviewCommand>) shopReviewDao.selectShopReviewDetView(map);
		System.out.println("RestaurantDetViewController>>getMoreReview()>>shopReviewDto = " + shopReviewDto);
		
		map.put("shopReviewDto", shopReviewDto);
		
		reviewPhotoByReviewIdDto = (ArrayList<ReviewPhotoDto>) reviewPhotoDao.selectReviewPhotoByReviewIdDetView(map);
		System.out.println("RestaurantDetViewController>>reviewPhotoByReviewIdDto : " + reviewPhotoByReviewIdDto);
		
		if (!shopReviewDto.isEmpty()) {
			for (int i=0; i<shopReviewDto.size(); i++) {
				ArrayList<ReviewPhotoDto> list = new ArrayList<ReviewPhotoDto>();
				
				for (int j=0; j<reviewPhotoByReviewIdDto.size(); j++) {
					if (shopReviewDto.get(i).getReviewId() == reviewPhotoByReviewIdDto.get(j).getReviewId()) {
						System.out.println("asdasd = " + reviewPhotoByReviewIdDto.get(j).getPhotoPath());
						list.add(reviewPhotoByReviewIdDto.get(j));
					}
				}
				
				System.out.println("asdasd = " + list.size());
				
				shopReviewDto.get(i).setReviewPhotoDtoList(list);
			}
		}
		
		mav.setViewName("restaurantDetView");
		
		mav.addObject("shopReviewDto", shopReviewDto);
		mav.addObject("checkMoreReview", checkMoreReview);
		
		return mav;
	}
	
	@RequestMapping(value="/recommend.do", method=RequestMethod.POST)
	@ResponseBody
	public String increaseRecommend(@RequestParam(value="restaurantId") int restaurantId, 
									@RequestParam(value="moreCount") int moreCount, 
									@RequestParam(value="current") int reviewId,
									@RequestParam(value="status") String status,
									HttpSession session) {
		System.out.println("RestaurantDetViewController>>increaseRecommend() is called!!");
		
		
		MemSimInfoDto memSimInfoDto = (MemSimInfoDto) session.getAttribute("userLoginInfo");
		
		String memberId = memSimInfoDto.getMemberId();
		
		if (log.isDebugEnabled()) {
			log.debug("memberId = " + memberId);
			log.debug("restaurantId = " + restaurantId);
			log.debug("moreCount = " + moreCount);
			log.debug("reviewId = " + reviewId);
			log.debug("status = " + status);
		}
		
		if (status.equals("increase")) {
			shopReviewDao.increaseRecommendCnt(reviewId);
		} else {
			shopReviewDao.decreaseRecommendCnt(reviewId);
		}
		
		return status;
	}
	
	@RequestMapping(value="/styleModify.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> styleModify(@RequestParam(value="restaurantId") int restaurantId, HttpSession session) {
		System.out.println("RestaurantDetViewController>>styleModify() is called!!");
		
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> mapObject = new HashMap<String, Object>();
		
		MemSimInfoDto memSimInfoDto = (MemSimInfoDto) session.getAttribute("userLoginInfo");
		String memberId = null;
		
		String checkLikeList = null;
		
		int likeCount = likeListDao.getTotListCountByRestaurantId(restaurantId);
		
		mapObject.put("likeCount", likeCount);
		
		if (memSimInfoDto != null) {
			memberId = memSimInfoDto.getMemberId();
		} else {
			mapObject.put("checkLikeList", "nonexist");
			
			return mapObject;
		}
		
		if (log.isDebugEnabled()) {
			log.debug("memberId = " + memberId);
			log.debug("restaurantId = " + restaurantId);
		}
		
		
		LikeListDto likeListDtoList = new LikeListDto();
		
		checkLikeList = "exist";
		
		map.put("restaurantId", restaurantId);
		map.put("memberId", memberId);
		
		likeListDtoList = likeListDao.selectLikeList(map);
		
		if (likeListDtoList != null) {
			if (likeListDtoList.getRestaurantId() == restaurantId) {
				checkLikeList = "exist";
			} else{
				checkLikeList = "nonexist";
			}
		} else {
			checkLikeList = "nonexist";
		}
		
		mapObject.put("checkLikeList", checkLikeList);
		
		return mapObject;
	}
	
	@RequestMapping(value="/addLikeList.do", method=RequestMethod.POST)
	@ResponseBody
	public String addLikeListInRestaurantDetView(@RequestParam(value="restaurantId") int restaurantId, HttpSession session) {
		System.out.println("RestaurantDetViewController>>addLikeListInRestaurantDetView() is called!!");
		
		MemSimInfoDto memSimInfoDto = (MemSimInfoDto) session.getAttribute("userLoginInfo");
		
		String memberId = memSimInfoDto.getMemberId();
		
		if (log.isDebugEnabled()) {
			log.debug("memberId = " + memberId);
			log.debug("restaurantId = " + restaurantId);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int newListId = likeListDao.getNewListNum() + 1;
		
		LikeListDto likeListDto = new LikeListDto();
		LikeListDto likeListDtoList = new LikeListDto();
		
		String checkLikeList = "exist";
		
		map.put("restaurantId", restaurantId);
		map.put("memberId", memberId);
		
		likeListDtoList = likeListDao.selectLikeList(map);
		
		if (likeListDtoList != null) {
			if (likeListDtoList.getRestaurantId() == restaurantId) {
				checkLikeList = "exist";
			} else{
				checkLikeList = "nonexist";
			}
		} else {
			checkLikeList = "nonexist";
		}
		
		if (checkLikeList.equals("nonexist")) {
			likeListDto.setListNum(newListId);
			likeListDto.setMemberId(memberId);
			likeListDto.setRestaurantId(restaurantId);
			
			likeListDao.insertLikeList(likeListDto);
		} else {
			likeListDao.deleteLikeList(likeListDtoList);
		}
		
		return checkLikeList;
	}
}
