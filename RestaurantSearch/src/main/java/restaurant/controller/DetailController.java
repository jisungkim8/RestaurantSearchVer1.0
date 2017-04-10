package restaurant.controller;

import java.io.File;

import org.apache.log4j.Logger;//로그처리를 해주는 클래스
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import restaurant.dao.BoardDao;
import restaurant.dto.BoardCommand;
import restaurant.util.FileUtil;
import restaurant.util.StringUtil;

@Controller
public class DetailController {

	// 로그처리->매개변수값,객체값출력,처리과정을 출력
	private Logger log = Logger.getLogger(this.getClass());// 클래스이름 불러오기

	@Autowired
	private BoardDao boardDao;

	@RequestMapping("/detail.do")
	// int seq=Integer.parseInt(request.getParameter("seq"));
	public ModelAndView process(@RequestParam("seq") int seq) {

		if (log.isDebugEnabled()) {// 디버그 모드라면
			log.debug("boardDao:" + boardDao);
		}
		// 1.조회수를 증가
		boardDao.updateHit(seq);

		// 2.seq값에 해당하는 값만 출력
		BoardCommand board = boardDao.selectBoard(seq);
		// <pre>dd ddd <br>
		// ddd</pre>
		board.setContent(StringUtil.parseBr(board.getContent()));

		// 3.이동할 페이지명,2.키명(모달 키명) ,3.모달 value명
		// defintion name="boardView"와 같아야 한다.
		// request.setAttribute("board",board)->${board.title}
		return new ModelAndView("boardView", "board", board);
	}
	
	//파일 다운로드
	@RequestMapping("/file.do")
	public ModelAndView download(@RequestParam("filename")String filename){
		File downloadFile=new File(FileUtil.UPLOAD_PATH+"/"+filename);
		//1.이동할 페이지명(view객체명)  2.키명  3.value(저장할 값)
		return new ModelAndView("downloadView", "downloadFile", downloadFile);
	}
	
	
	
}