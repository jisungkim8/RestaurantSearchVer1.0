package restaurant.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import restaurant.dao.MemberDao;
import restaurant.dto.MemDetInfoDto;
import restaurant.dto.MemSimInfoDto;

//유효성 검사->입력->ok->boardWriter.jsp 화면에 출력
@Controller
public class MemberRegiController {

	@Autowired
	MemberDao memberDao;

	private Logger log = Logger.getLogger(this.getClass());// 클래스 이름 불러오기

	@RequestMapping(value = "/memberRegister.do", method = RequestMethod.GET)
	public String form() {
		System.out.println("MemberRegiController RequestMethod.GET 메서드 호출됨!");
		return "memberRegiView";// return 이동할 페이지명;
	}

	@RequestMapping(value = "/memberRegister.do", method = RequestMethod.POST)
	public ModelAndView submit(@ModelAttribute("memDetInfoDto") MemDetInfoDto memDetInfoDto,
			@ModelAttribute("memSimInfoDto") MemSimInfoDto memSimInfoDto) {

		if (log.isDebugEnabled()) {
			log.debug("memDetInfoDto=" + memDetInfoDto); // toString()
			log.debug("memSimInfoDto=" + memSimInfoDto); // toString()
		}

		memDetInfoDto.setMemberType("초급");
		System.out.println("memDetInfoDto.getEmailCheck()==>" + memDetInfoDto.getEmailCheck());

		if (memDetInfoDto.getEmailCheck() == null) {
			System.out.println("memDetInfoDto.getEmailCheck() == null");
			memDetInfoDto.setEmailCheck("미수신");
		}
		
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date currentTime = new Date();
		String dTime = formatter.format ( currentTime );
		System.out.println("dTime=>"+dTime);
		memSimInfoDto.setLastLoginTime(dTime);
		memSimInfoDto.setMemberGrade("초급");
		memSimInfoDto.setAccuPoint(100);
		memSimInfoDto.setCurrPoint(100);
		
		System.out.println("memDetInfoDto=" + memDetInfoDto);
		System.out.println("memSimInfoDto=" + memSimInfoDto);

		System.out.println("MemberRegiController RequestMethod.POST 메서드 호출됨!");

		// 정상적으로 에러가 발생이 되지 않고 입력을 완수 했다면
		memberDao.insertMember(memDetInfoDto);
	    memberDao.insertMemSimInfo(memSimInfoDto);
	    
		// ModelAndView mav=new ModelAndView("redirect:/list.do")
		return new ModelAndView("redirect:/restaurantMain.do");

	}

	@RequestMapping("dupliMemberCheck.do")
	@ResponseBody
	public String dupliIdCheck(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String checkResult = "";

		System.out.println(" dupliIdCheck dupliIdCheck id=>" + id);

		// ex) Model 단에서 DB 조회

		int memberCount = memberDao.checkIdMember(id);

		if (memberCount >= 1)
			checkResult = "dupli";
		else
			checkResult = "create";

		return checkResult;
	}
	
	@RequestMapping(value = "/memberInfoUpdate.do", method = RequestMethod.GET)
	public String memInfoUpdateGet() {
		System.out.println("MemberRegiController RequestMethod.GET 메서드 호출됨!");
		return "memberRegiView";// return 이동할 페이지명;
	}

	@RequestMapping(value = "/memberInfoUpdate.do", method = RequestMethod.POST)
	public ModelAndView memInfoUpdate(@ModelAttribute("memDetInfoDto") MemDetInfoDto memDetInfoDto) {
		if (log.isDebugEnabled()) {
			log.debug("memDetInfoDto=" + memDetInfoDto); // toString()
		}

		memDetInfoDto.setMemberType("초급");
		System.out.println("memDetInfoDto.getEmailCheck()==>" + memDetInfoDto.getEmailCheck());

		/*if (memDetInfoDto.getEmailCheck()=="수신") {
			System.out.println("memDetInfoDto.getEmailCheck() == null");
			memDetInfoDto.setEmailCheck("수신");
		}else
			memDetInfoDto.setEmailCheck("미수신");*/
		
		if (memDetInfoDto.getEmailCheck()==null) {
			System.out.println("memDetInfoDto.getEmailCheck() == null");
			memDetInfoDto.setEmailCheck("미수신");
		}
		
		System.out.println("memDetInfoDto=" + memDetInfoDto);
		System.out.println("MemberRegiController memInfoUpdate.POST 메서드 호출됨!");
		// 정상적으로 에러가 발생이 되지 않고 입력을 완수 했다면
		memberDao.updateMember(memDetInfoDto);
		// ModelAndView mav=new ModelAndView("redirect:/list.do")
		return new ModelAndView("redirect:/restaurantMain.do");
	}
	
	@RequestMapping("memLeave.do")
	public ModelAndView memberLeave(@RequestParam("id") String memberId,HttpSession session) {
		System.out.println("___회원 탈퇴___");
		System.out.println("memberId"+memberId);
		memberDao.deleteMember(memberId);			
		return new ModelAndView("redirect:/restaurantMain.do");
	 }
}