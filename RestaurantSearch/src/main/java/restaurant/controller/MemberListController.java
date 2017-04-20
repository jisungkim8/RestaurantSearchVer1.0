
package restaurant.controller;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//---------로그에 출력할 수 있도록 설정(Annotation)--
import org.apache.log4j.Logger;//로그 객체 생성
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

//---------페이징 처리 및 메서드 호출---------------
import restaurant.dao.BoardDao;
import restaurant.dao.MemberDao;
import restaurant.dto.BoardCommandDto;//DTO
import restaurant.dto.MemDetInfoDto;
import restaurant.util.PagingUtil;
//---------------------------------------------------
import restaurant.util.StringUtil;

@Controller 
public class MemberListController {
	//로그객체
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MemberDao memberDao;//Setter Method호출할 필요가 없다.
	
	//pageNum,keyField,keyWord(검색분야,검색어)
	@RequestMapping("/memList.do")
	public ModelAndView process
	   (@RequestParam(value="pageNum",defaultValue="1") int currentPage,
	    @RequestParam(value="keyField",defaultValue="") String keyField,
	    @RequestParam(value="keyWord",defaultValue="") String keyWord){
		
		if(log.isDebugEnabled()){
			System.out.println("memListController의  memList.do");
			log.debug("currentPage : " + currentPage);
			log.debug("keyField : " + keyField);
			log.debug("keyWord : " + keyWord);
		}
		//검색분야,검색어를 Map객체 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyField", keyField);//검색분야
		map.put("keyWord", keyWord);//검색어
		
		//총레코드수 
		int count = memberDao.getRowCount(map);
	    
		//PagingUtil page = new PagingUtil(currentPage, count, 10,10, "list.do");
		PagingUtil page = new PagingUtil(currentPage, count, 10,10, "list.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<MemDetInfoDto> list = null;
		if(count > 0){
			System.out.println("여기는 DAO 호출");
			list = memberDao.list(map);
		}else{
			list = Collections.emptyList();
		}
		
		System.out.println("MemerListController클래스의 count="+count);
		
		ModelAndView  mav = new ModelAndView();
		mav.setViewName("memberList");//boardList.jsp로 페이지 이동
		mav.addObject("count", count);//총레코드수
		mav.addObject("list", list);//화면에 출력할 데이터
		mav.addObject("pagingHtml", page.getPagingHtml());//링크문자열
		
		return mav;
	}
	
	@RequestMapping("/memDetail.do")
	// int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	public ModelAndView process(@RequestParam("memberId") String memberId) {

		if (log.isDebugEnabled()) {// 디버그 모드라면
			log.debug("memberDao:" + memberDao);
		}

		// 2.boardNum값에 해당하는 값만 출력
		MemDetInfoDto selectMember = memberDao.selectMember(memberId);
		// <pre>dd ddd <br>
		// ddd</pre>

		// 3.이동할 페이지명,2.키명(모달 키명) ,3.모달 value명
		// defintion name="boardView"와 같아야 한다.
		// request.setAttribute("board",board)->${board.title}
		return new ModelAndView("memberView", "selectMember", selectMember);
	}
}