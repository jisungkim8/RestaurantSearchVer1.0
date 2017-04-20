package restaurant.controller;

import java.util.List;

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

import restaurant.dao.MainRestaurantListDao;
import restaurant.dao.MemberDao;
import restaurant.dto.MainRestaurantListDto;
import restaurant.dto.MemDetInfoDto;
import restaurant.dto.MemSimInfoDto;
import spring.email.Email;
import spring.email.EmailSender;

//유효성 검사->입력->ok->boardWriter.jsp 화면에 출력
@Controller
public class MemLoginController {

	@Autowired
	MemberDao memberDao;

	@Autowired
	MainRestaurantListDao mainRestaurantListDao;

	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;

	private Logger log = Logger.getLogger(this.getClass());// 클래스 이름 불러오기

	@RequestMapping(value = "memberRegiCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String memberRegiCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		System.out.println("__memberLogin__");
		String memberId = request.getParameter("id");
		String registerCheck; // 등록여부
		int memCount;

		MemSimInfoDto memSimInfo = new MemSimInfoDto();

		if (log.isDebugEnabled()) {
			log.debug("memberId=" + memberId); // toString()
		}

		memSimInfo.setMemberId(memberId);

		System.out.println("__memberRegiCheck__method=RequestMethod.POST");
		System.out.println("memSimInfoDto=" + memSimInfo);
		memCount = memberDao.checkIdMember(memSimInfo.getMemberId());

		if (memCount == 1) {
			registerCheck = "register";
		} else {
			System.out.println("회원가입이 되지 않았습니다.");
			registerCheck = "unregister";
		}

		return registerCheck;
	}

	@RequestMapping(value = "memberPwdCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String memberPwdCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		System.out.println("___memberPwdCheck___");
		String memberId = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String passwdCheck = null; // 패스워드 체크
		int memCount;

		MemSimInfoDto memSimInfo = new MemSimInfoDto();

		if (log.isDebugEnabled()) {
			log.debug("memberId=" + memberId + "  passwd=" + passwd); // toString()
		}

		memSimInfo.setMemberId(memberId);
		memSimInfo.setPassword(passwd);

		System.out.println("__memberPwdCheck__=RequestMethod.POST");
		System.out.println("memSimInfoDto=" + memSimInfo);

		memSimInfo = memberDao.loginCheck(memSimInfo);
		System.out.println("loginCheck_after_memSimInfoDto=>" + memSimInfo);
		System.out.println("회원가입 되었습니다.");

		if (memSimInfo != null) {
			System.out.println("로그인이 성공하였습니다.");
			passwdCheck = "agreement";
		} else {
			System.out.println("패스워드가 불일치 합니다.");
			passwdCheck = "discord";
		}

		return passwdCheck;
	}

	@RequestMapping(value = "memberLogin.do", method = RequestMethod.GET)
	public String form() {
		System.out.println("MemberRegiController RequestMethod.GET 메서드 호출됨!");
		return "restaurantMainView";// return 이동할 페이지명;
	}

	@RequestMapping(value = "memberLogin.do", method = RequestMethod.POST)
	public ModelAndView memberLogin(@ModelAttribute("memSimInfoDto") MemSimInfoDto memSimInfoDto,
			@RequestParam(value = "restaurantId") int restaurantId, @RequestParam(value = "moreCount") int moreCount,
			@RequestParam(value = "filterName") String filterName, @RequestParam(value = "pageName") String pageName,
			HttpSession session) {
		String registerCheck;
		MemSimInfoDto memSimInfo = new MemSimInfoDto();
		MemDetInfoDto memDetInfo = new MemDetInfoDto();
		ModelAndView mav = new ModelAndView();

		if (log.isDebugEnabled()) {
			log.debug("memSimInfoDto=" + memSimInfoDto); // toString()
		}
		System.out.println("memberLogin.do >>>>>");
		System.out.println("memberLogin.do >>>>>");
		System.out.println("memberLogin.do >>>>>");
		System.out.println("memberLogin.do >>>>>");
		System.out.println("memberLogin.do >>>>>");
		System.out.println("memberLogin.do >>>>>");
		System.out.println("memberLogin.do >>>>>");
		
		System.out.println("__memberLogin__method=RequestMethod.POST");
		System.out.println("memSimInfoDto=" + memSimInfoDto);
		System.out.println("restaurantDetView.do?restaurantId=" + restaurantId + "&moreCount=" + moreCount
				+ "&filterName=" + filterName + "pageName=" + pageName);

		memSimInfo = memberDao.loginCheck(memSimInfoDto);
		memDetInfo.setMemberId(memSimInfoDto.getMemberId());
		memDetInfo = memberDao.selectMemDetInfo(memDetInfo);
		System.out.println("loginCheck_after_memSimInfoDto=>" + memSimInfo);
		
		if (memSimInfo == null) {
			registerCheck = "unregister";
		} else {
			registerCheck = "register";
			session.setAttribute("userLoginInfo", memSimInfo);
			session.setAttribute("userLoginDetInfo", memDetInfo);
		}
		List<MainRestaurantListDto> list = mainRestaurantListDao.selectMainRestaurantList();
		List<MainRestaurantListDto> newlist = mainRestaurantListDao.selectNewRestaurantList();
		
		if (pageName.equals("restMainView")) {
			System.out.println("=====restMainView.jsp====");
			mav.setViewName("restaurantMainView");
			mav.addObject("memSimInfo", memSimInfo);
			mav.addObject("registerCheck", registerCheck);
			mav.addObject("list", list);
			mav.addObject("newlist", newlist);

		} else if (pageName.equals("restDetView")) {
			System.out.println("=====restDetView.jsp====");
			mav.setViewName("redirect:restaurantDetView.do?restaurantId=" + restaurantId + "&moreCount=" + moreCount
					+ "&filterName=" + filterName);
			// mav.addObject("restaurantId", restaurantId);
			// mav.addObject("moreCount", moreCount);
			// mav.addObject("filterName", filterName);
			// return new
			// ModelAndView("redirect:restaurantDetView.do?restaurantId=" +
			// restaurantId + "&moreCount=" + moreCount + "&filterName=" +
			// filterName);
		}

		return mav;
	}
	
	@RequestMapping(value = "memberLoginForList.do", method = RequestMethod.POST)
	public ModelAndView memberLoginForList(@ModelAttribute("memSimInfoDto") MemSimInfoDto memSimInfoDto,
			@RequestParam("keyword") String keyword, @RequestParam("pageNum") int pageNum,
			@RequestParam("pageName") String pageName, HttpSession session) {
		String registerCheck;
		MemSimInfoDto memSimInfo = new MemSimInfoDto();
		MemDetInfoDto memDetInfo = new MemDetInfoDto();
		ModelAndView mav = new ModelAndView();

		if (log.isDebugEnabled()) {
			log.debug("memSimInfoDto=" + memSimInfoDto); // toString()
		}
		System.out.println("memberLoginForList >>>>>");
		System.out.println("memSimInfoDto=" + memSimInfoDto);

		memSimInfo = memberDao.loginCheck(memSimInfoDto);
		memDetInfo.setMemberId(memSimInfoDto.getMemberId());
		memDetInfo = memberDao.selectMemDetInfo(memDetInfo);
		System.out.println("loginCheck_after_memSimInfoDto=>" + memSimInfo);
		
		if (memSimInfo == null) {
			registerCheck = "unregister";
		} else {
			registerCheck = "register";
			session.setAttribute("userLoginInfo", memSimInfo);
			session.setAttribute("userLoginDetInfo", memDetInfo);
		}
		
		if (pageName.equals("restListView")) {
			System.out.println("=====restListView.jsp====");
			mav.setViewName("redirect:restaurantSearch.do?keyword=" + keyword + "&pageNum=" + pageNum);
		}
		return mav;
	}

	@RequestMapping("memProfile.do")
	public ModelAndView memProfile(@RequestParam("memberId") String memId, @RequestParam("password") String passWd) {
		System.out.println("memProfile");
		System.out.println("memProfile memberId=>" + memId);

		MemSimInfoDto memSimInfo = new MemSimInfoDto();
		MemDetInfoDto memDetInfo = new MemDetInfoDto();
		memSimInfo.setMemberId(memId);
		memSimInfo.setPassword(passWd);
		memDetInfo.setMemberId(memId);

		if (log.isDebugEnabled()) {
			log.debug("memSimInfo=" + memSimInfo + "memDetInfo" + memDetInfo); // toString()
		}

		memSimInfo = memberDao.loginCheck(memSimInfo);
		memDetInfo = memberDao.selectMemDetInfo(memDetInfo);
		memDetInfo.setPhotoPath("images/" + memDetInfo.getPhotoPath());

		if (log.isDebugEnabled()) {
			log.debug("memSimInfo=" + memSimInfo + "memDetInfo" + memDetInfo); // toString()
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberProfile");
		mav.addObject("memSimInfo", memSimInfo);
		mav.addObject("memDetInfo", memDetInfo);
		return mav;
	}

	@RequestMapping("pwdSearch.do")
	public ModelAndView passwdSearch(@RequestParam("memberId") String memberId,
			@RequestParam("birthDate") String birthDate) throws Exception {

		ModelAndView mav;
		String pw;
		// System.out.println(pw);
		String pwdSearchCheck;
		MemSimInfoDto memSimInfo = new MemSimInfoDto();
		MemDetInfoDto memDetInfo = new MemDetInfoDto();
		memDetInfo.setMemberId(memberId);
		memDetInfo.setBirthDate(birthDate);
		memDetInfo = memberDao.searchMemDetInfo(memDetInfo);

		if (memDetInfo != null) {
			pwdSearchCheck = "search";
			pw = memberDao.searchPasswdMem(memDetInfo.getMemberId());
			email.setContent("비밀번호는 " + pw + " 입니다.");
			email.setReceiver(memberId);
			email.setSubject(memberId + "계정의 비밀번호 찾기 메일입니다.");
			emailSender.SendEmail(email);
			mav = new ModelAndView("passwdSearch");
			mav.addObject("pwdSearchCheck", pwdSearchCheck);
			return mav;
		} else {
			mav = new ModelAndView("passwdSearch");
			pwdSearchCheck = "notsearch";
			mav.addObject("pwdSearchCheck", pwdSearchCheck);
			return mav;
		}
	}

	@RequestMapping("pwdSearchView.do")
	public ModelAndView passwdSearch() throws Exception {
		ModelAndView mav;
		mav = new ModelAndView("passwdSearch");
		return mav;
	}

	// 로그아웃
	@RequestMapping("memberLogout")
	public ModelAndView memberLogout(HttpSession session) {
		System.out.println("memberLogout_로그아웃");
		session.setAttribute("userLoginInfo", null);
		ModelAndView mav = new ModelAndView();

		List<MainRestaurantListDto> list = mainRestaurantListDao.selectMainRestaurantList();
		List<MainRestaurantListDto> newlist = mainRestaurantListDao.selectNewRestaurantList();

		mav.setViewName("restaurantMainView");
		mav.addObject("list", list);
		mav.addObject("newlist", newlist);
		return mav;
	}

	@RequestMapping("restDetmemberLogout.do")
	public ModelAndView restDetMemberLogout(@RequestParam(value = "restaurantId") int restaurantId,
			@RequestParam(value = "moreCount") int moreCount, @RequestParam(value = "filterName") String filterName,
			HttpSession session) {
		System.out.println("memberLogout_로그아웃");
		session.setAttribute("userLoginInfo", null);
		ModelAndView mav = new ModelAndView();

		List<MainRestaurantListDto> list = mainRestaurantListDao.selectMainRestaurantList();
		List<MainRestaurantListDto> newlist = mainRestaurantListDao.selectNewRestaurantList();

		mav.setViewName("redirect:restaurantDetView.do?restaurantId=" + restaurantId + "&moreCount=" + moreCount
					+ "&filterName=" + filterName);
		mav.addObject("list", list);
		mav.addObject("newlist", newlist);
		return mav;
	}
	
	@RequestMapping("restListmemberLogout.do")
	public ModelAndView restListmemberLogout(@RequestParam("keyword") String keyword,
			@RequestParam("pageNum") int pageNum, HttpSession session) {
		System.out.println("memberLogout_로그아웃");
		session.setAttribute("userLoginInfo", null);
		ModelAndView mav = new ModelAndView();

		mav.setViewName("redirect:restaurantListView.do?keyword=" 
				+ keyword + "&pageNum=" + pageNum);
		return mav;
	}
}