package restaurant.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import restaurant.dao.BoardDao;
import restaurant.dto.BoardCommandDto;
import restaurant.util.FileUtil;
import restaurant.validator.BoardDeleteValidator;

//유효성검사->입력->ok->boardWriter.jsp화면에 출력
//@키워드->어노테이션, 다른언어(장식자)라고 부름

@Controller
public class DeleteController {

	// 디버깅하기위해서 적용객체 생성(로그객체)
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private BoardDao boardDao; // 멤버변수위에 @Autowired->Setter X

	// 암호가 틀리면 전에 입력한 암호값을 제거하고 다시 처음부터 값을 입력
	@ModelAttribute("command")
	public BoardCommandDto forbacking() {
		return new BoardCommandDto();
	}

	// 형식)@RequstMapping(value="/요청명령어",method=RequestMethod.GET(Get방식)
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String form() {
		return "boardDelete";// boardDelete.jsp로 이동
	}

	// 암호를 입력하고 삭제버튼 눌렀다면(에러메세지(유효성검사)
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute("command") BoardCommandDto command, BindingResult result) {
		if (log.isDebugEnabled()) {
			log.debug("BoardCommandDto=" + command);// toString()
			log.debug("boardNum="+command.getBoardNum());
		}
		// 유효성 검사->(비밀번호)에러발생->에레메세지를 불러오게 설정
		new BoardDeleteValidator().validate(command, result);
		// 만약에 에러가 발생이 되었다면
		if (result.hasErrors()) {
			return form();// form()호출->boardDelete.jsp로 전환
		}

		// 삭제할 게시물번호에 해당하는 레코드를 구해온다.
		BoardCommandDto board = boardDao.selectBoard(command.getBoardNum());
		// DB상의 암호!=웹상의 암호
		if (!board.getPwd().equals(command.getPwd())) {
			// 에러메세지를 웹상에 출력
			result.rejectValue("pwd", "invalidPassword");
			return form();// boardDelete.jsp로 전환(새로 암호를 입력받기)
		} else {// 비밀번호가 맞으면->삭제->업로드된 파일도 삭제
			boardDao.delete(command.getBoardNum());
			// 만약에 삭제한 게시물에 업로드된 파일이 존재한다면 삭제하라
			if (board.getFilename() != null) {
				FileUtil.removeFile(board.getFilename());
			}
		}

		return "redirect:/list.do"; // ListController->boardList.jsp로 이동
	}
}
