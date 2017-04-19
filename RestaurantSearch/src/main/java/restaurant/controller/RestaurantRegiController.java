package restaurant.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import restaurant.dao.RestaurantRegiDao;
import restaurant.dao.ShopDetInfoDao;
import restaurant.dto.RestaurantDto;
import restaurant.dto.ShopDetInfoDto;
import restaurant.util.FileUtil2;

//유효성 검사->입력->ok->boardWriter.jsp 화면에 출력
@Controller
public class RestaurantRegiController {

	@Autowired
	RestaurantRegiDao restaurantRegiDao;

	private Logger log = Logger.getLogger(this.getClass());// 클래스 이름 불러오기

	@RequestMapping(value = "/restaurantRegi.do", method = RequestMethod.GET)
	public String form() {
		System.out.println("MemberRegiController RequestMethod.GET 메서드 호출됨!");
		return "restaurantRegiView";// return 이동할 페이지명;
	}

	@RequestMapping(value = "/restaurantRegi.do", method = RequestMethod.POST)
	public ModelAndView submit(@ModelAttribute("restaurantDto") RestaurantDto restaurantDto)
		{

		if (log.isDebugEnabled()) {
			log.debug("restaurantDto=" + restaurantDto); // toString()
	
		}
		
		int restaurantCount;

	/*@RequestMapping(value = "/restaurantRegi.do", method = RequestMethod.POST)
	public ModelAndView submit(@ModelAttribute("restaurantDto") RestaurantDto restaurantDto,
			@ModelAttribute("shopDetInfoDto") ShopDetInfoDto shopDetInfoDto) {

		if (log.isDebugEnabled()) {
			log.debug("restaurantDto=" + restaurantDto); // toString()
			log.debug("shopDetInfoDto=" + shopDetInfoDto); // toString()
		}*/

		System.out.println("MemberRegiController RequestMethod.POST 메서드 호출됨!");

		restaurantRegiDao.insertRestaurant(restaurantDto);
		
		/*restaurantRegiDao.insertRestaurantDetInfo(shopDetInfoDto);*/
		// 정상적으로 에러가 발생이 되지 않고 입력을 완수 했다면

		// ModelAndView mav=new ModelAndView("redirect:/list.do")
		return new ModelAndView("redirect:/restaurantMain.do");

	}

	@RequestMapping(value = "/restaurantUpdate.do", method = RequestMethod.GET)
	public String restaurantUpdateGet() {
		System.out.println("MemberRegiController RequestMethod.GET 메서드 호출됨!");
		return "restaurantRegiView";// return 이동할 페이지명;
	}

	@RequestMapping(value = "/restaurantUpdate.do", method = RequestMethod.POST)
	public ModelAndView restaurantUpdate(@ModelAttribute("restaurantDto") RestaurantDto restaurantDto) {
		if (log.isDebugEnabled()) {
			log.debug("restaurantDto=" + restaurantDto); // toString()
		}

		String oldFileName = "";// 기존의 파일명 저장

		System.out.println("RestaurantRegiController restaurantUpdate.POST 메서드 호출됨!");
		oldFileName = restaurantDto.getRepresentPhoto();

		// 업로드된 파일이 존재한다면
		if (!restaurantDto.getUpload().isEmpty()) {
			System.out.println("원본파일명=" + restaurantDto.getUpload().getOriginalFilename());
			// 새로운 탐색기에서 새로 변경할 파일을 업로드하는 경우
			try {
				restaurantDto.setRepresentPhoto(restaurantDto.getUpload().getOriginalFilename());
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else { // 업로드된 파일이 존재하지 않았다면
			restaurantDto.setRepresentPhoto(oldFileName);
		}

		// DB상에 반영하라
		restaurantRegiDao.updateRestaurant(restaurantDto);

		// 업로드->업로드된 변경된 파일->지정한 업로드 위치로 복사해서 이동
		if (!restaurantDto.getUpload().isEmpty()) {
			try {
				File file2 = new File(FileUtil2.UPLOAD_PATH + "/" + restaurantDto.getRepresentPhoto());
				restaurantDto.getUpload().transferTo(file2); // ~transferTo(전송할객체명)

			} catch (IOException e) { // 시큐어 코딩 방식
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 전의 파일을 삭제
			if (oldFileName != null) {
				FileUtil2.removeFile(oldFileName);
			}

		} // else
		System.out.println("멤버정보입력전에dto정보" + restaurantDto);

		// 정상적으로 에러가 발생이 되지 않고 입력을 완수 했다면
		// ModelAndView mav=new ModelAndView("redirect:/list.do")

		// return new
		// ModelAndView("redirect:/memProfile.do").addObject("memberId",memDetInfoDto.getMemberId());
		return new ModelAndView("redirect:/restaurantMain.do");
	}

	@RequestMapping("restaurantDelete.do")
	public ModelAndView restaurantDelete(@RequestParam("restaurantId") String restaurantId, HttpSession session) {
		System.out.println("___회원 탈퇴___");
		System.out.println("memberId" + restaurantId);
		restaurantRegiDao.deleteRestaurant(restaurantId);
		return new ModelAndView("redirect:/restaurantMain.do");
	}
}