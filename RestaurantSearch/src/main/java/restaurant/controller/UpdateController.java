package restaurant.controller;

import java.io.File;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import restaurant.dao.BoardDao;
import restaurant.dto.BoardCommand;
import restaurant.util.FileUtil;
import restaurant.validator.BoardValidator;

//유효성검사->입력->ok->boardWriter.jsp화면에 출력

@Controller
public class UpdateController {

	// 디버깅하기위해서 적용객체 생성(로그객체)
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private BoardDao boardDao; // 멤버변수위에 @Autowired->Setter X

	// 형식)@RequstMapping(value="/요청명령어",method=RequestMethod.GET(Get방식)
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam("seq") int seq) {

		BoardCommand boardCommand = boardDao.selectBoard(seq);
		// boaardModify.jsp로 이동
		return new ModelAndView("boardModify", "command", boardCommand);
	}

	// 수정을 다하고나서 수정버튼 눌렀다면(에러메세지(유효성검사)
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute("command") BoardCommand command, BindingResult result) {
		if (log.isDebugEnabled()) {
			log.debug("BoardCommand=" + command);// toString()
		}
		// 유효성 검사->(비밀번호)에러발생->에레메세지를 불러오게 설정
		new BoardValidator().validate(command, result);
		// 만약에 에러가 발생이 되었다면
		if (result.hasErrors()) {
			return "boardModify";// form()호출
		}

		// 업로드가 안되어 있으면 상관X, 업로드된 파일(기존)->새로운 파일명변경
		BoardCommand board = null;
		String oldFileName = "";// 기존의 파일명 저장
		// 수정하기전의 상태의 레코드를 불러온다.
		board = boardDao.selectBoard(command.getSeq());
		// DB상의 암호!=웹상의 암호
		if (!board.getPwd().equals(command.getPwd())) {
			// 에러메세지를 웹상에 출력
			result.rejectValue("pwd", "invalidPassword");
			return "boardModify";// boardModify.jsp로 전환(새로 암호를 입력받기)
		} else {// 비밀번호가 맞으면->기존파일을 구해서
				// 업로드파일이 존재하면->기존파일 삭제, 새로운파일로 세팅->DB저장
				// 업로드파일이 존재X->기존파일은 그대로 덮어쓰기(DB까지)
			oldFileName = board.getFilename();

			// 업로드된 파일이 존재한다면
			if (!command.getUpload().isEmpty()) {

				System.out.println("원본파일명=" + command.getUpload().getOriginalFilename());
				// 새로운 탐색기에서 새로 변경할 파일을 업로드하는 경우
				try {

					command.setFilename(FileUtil.rename(command.getUpload().getOriginalFilename()));
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

			} else {// 업로드된 파일이 존재하지 않았다면
				command.setFilename(oldFileName);

			}

			// DB상에 반영하라.
			boardDao.update(command);

			// 업로드->업로드된 변경된파일->지정한 업로드위치로 복사해서 이동
			if (!command.getUpload().isEmpty()) {

				try {

					File file = new File(FileUtil.UPLOAD_PATH + "/" + command.getFilename());
					command.getUpload().transferTo(file);// ~transferTo(전송할객체명)

				} catch (IOException e) { // 시큐어코딩방식
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				// 전의 파일을 삭제
				if (oldFileName != null) {
					FileUtil.removeFile(oldFileName);
				} // if

			} // else
		}
		return "redirect:/list.do"; // ListController->boardList.jsp로 이동
	}
}
