package restaurant.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import restaurant.dao.MemberDao;
import restaurant.dto.MemDetInfoDto;
import restaurant.dto.MemSimInfoDto;
import restaurant.util.FileUtil2;

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

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentTime = new Date();
		String dTime = formatter.format(currentTime);
		System.out.println("dTime=>" + dTime);
		memSimInfoDto.setLastLoginTime(dTime);
		memSimInfoDto.setMemberGrade("초급");
		memSimInfoDto.setAccuPoint(100);
		memSimInfoDto.setCurrPoint(100);

		System.out.println("memDetInfoDto=" + memDetInfoDto);
		System.out.println("memSimInfoDto=" + memSimInfoDto);

		System.out.println("MemberRegiController RequestMethod.POST 메서드 호출됨!");

		// 정상적으로 에러가 발생이 되지 않고 입력을 완수 했다면
		try {
			String newName = "";// 변경할 파일이름
			// 업로드된 파일이 존재한다면
			if (!memDetInfoDto.getUpload().isEmpty()) {
				newName = FileUtil2.rename(memDetInfoDto.getUpload().getOriginalFilename());
				System.out.println("원본파일명=" + memDetInfoDto.getUpload().getOriginalFilename());
				// DTO의 객체 filename -> 바뀐파일명 --> 실제로 DB상의 filename
				System.out.println("newName=" + newName);
				memDetInfoDto.setPhotoPath(memDetInfoDto.getUpload().getOriginalFilename());
			}
			System.out.println("멤버정보입력전에dto정보" + memDetInfoDto);
			memberDao.insertMember(memDetInfoDto);
			memberDao.insertMemSimInfo(memSimInfoDto);
			// 업로드->업로드된 변경된 파일->지정한 업로드 위치로 복사해서 이동
			if (!memDetInfoDto.getUpload().isEmpty()) {
				File file = new File(FileUtil2.UPLOAD_PATH + "/" + memDetInfoDto.getUpload().getOriginalFilename());
				memDetInfoDto.getUpload().transferTo(file); // ~transferTo(전송할객체명)
			}
		} catch (IOException e) { // 시큐어 코딩 방식
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

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

	@RequestMapping("dupliNicnameCheck.do")
	@ResponseBody
	public String dupliNicnameCheck(HttpServletRequest request, HttpServletResponse response) {
		String nicName = request.getParameter("nicName");
		String checkResult = "";

		System.out.println(" dupliIdCheck dupliIdCheck id=>" + nicName);

		// ex) Model 단에서 DB 조회

		int nicNameCount = memberDao.checkNicName(nicName);

		if (nicNameCount >= 1)
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

		String oldFileName = "";// 기존의 파일명 저장

		memDetInfoDto.setMemberType("초급");
		System.out.println("memDetInfoDto.getEmailCheck()==>" + memDetInfoDto.getEmailCheck());

		
		//MultipartFile file = multi.getFile("upload");


		//System.out.println("MultipartFile file =>"+file.getOriginalFilename());


		/*
		 * if (memDetInfoDto.getEmailCheck()=="수신") {
		 * System.out.println("memDetInfoDto.getEmailCheck() == null");
		 * memDetInfoDto.setEmailCheck("수신"); }else
		 * memDetInfoDto.setEmailCheck("미수신");
		 */

		if (memDetInfoDto.getEmailCheck() == null) {
			System.out.println("memDetInfoDto.getEmailCheck() == null");
			memDetInfoDto.setEmailCheck("미수신");
		}

		System.out.println("memDetInfoDto=" + memDetInfoDto);
		System.out.println("MemberRegiController memInfoUpdate.POST 메서드 호출됨!");
		oldFileName = memDetInfoDto.getPhotoPath();

		// 업로드된 파일이 존재한다면
		if (!memDetInfoDto.getUpload().isEmpty()) {
			System.out.println("원본파일명=" + memDetInfoDto.getUpload().getOriginalFilename());
			// 새로운 탐색기에서 새로 변경할 파일을 업로드하는 경우
			try {
				memDetInfoDto.setPhotoPath(memDetInfoDto.getUpload().getOriginalFilename());
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else { // 업로드된 파일이 존재하지 않았다면
			memDetInfoDto.setPhotoPath(oldFileName);
		}

		// DB상에 반영하라
		memberDao.updateMember(memDetInfoDto);

		// 업로드->업로드된 변경된 파일->지정한 업로드 위치로 복사해서 이동
		if (!memDetInfoDto.getUpload().isEmpty()) {
			try {
				File file2 = new File(FileUtil2.UPLOAD_PATH + "/" + memDetInfoDto.getPhotoPath());
				memDetInfoDto.getUpload().transferTo(file2); // ~transferTo(전송할객체명)

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
		System.out.println("멤버정보입력전에dto정보" + memDetInfoDto);

		// 정상적으로 에러가 발생이 되지 않고 입력을 완수 했다면
		// ModelAndView mav=new ModelAndView("redirect:/list.do")

		// return new
		// ModelAndView("redirect:/memProfile.do").addObject("memberId",memDetInfoDto.getMemberId());
		return new ModelAndView("redirect:/restaurantMain.do");
	}

	@RequestMapping("memLeave.do")
	public ModelAndView memberLeave(@RequestParam("id") String memberId, HttpSession session) {
		System.out.println("___회원 탈퇴___");
		System.out.println("memberId" + memberId);
		memberDao.deleteMember(memberId);
		return new ModelAndView("redirect:/restaurantMain.do");
	}
}