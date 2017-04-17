
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
import restaurant.dto.BoardCommandDto;//DTO
import restaurant.util.PagingUtil;
//---------------------------------------------------

@Controller 
public class ListController {
	//로그객체
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardDao boardDao;//Setter Method호출할 필요가 없다.
	
	//pageNum,keyField,keyWord(검색분야,검색어)
	@RequestMapping("/list.do")
	public ModelAndView process
	   (@RequestParam(value="pageNum",defaultValue="1") int currentPage,
	    @RequestParam(value="keyField",defaultValue="") String keyField,
	    @RequestParam(value="keyWord",defaultValue="") String keyWord){
		
		if(log.isDebugEnabled()){
			System.out.println("ListController의  list.do");
			log.debug("currentPage : " + currentPage);
			log.debug("keyField : " + keyField);
			log.debug("keyWord : " + keyWord);
		}
		//검색분야,검색어를 Map객체 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyField", keyField);//검색분야
		map.put("keyWord", keyWord);//검색어
		
		//총레코드수 
		int count = boardDao.getRowCount(map);
	    
		//PagingUtil page = new PagingUtil(currentPage, count, 10,10, "list.do");
		PagingUtil page = new PagingUtil(currentPage, count, 10,10, "list.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<BoardCommandDto> list = null;
		if(count > 0){
			System.out.println("여기는 DAO 호출");
			list = boardDao.list(map);
		}else{
			list = Collections.emptyList();
		}
		
		System.out.println("ListController클래스의 count="+count);
		
		ModelAndView  mav = new ModelAndView();
		mav.setViewName("boardList");//boardList.jsp로 페이지 이동
		mav.addObject("count", count);//총레코드수
		mav.addObject("list", list);//화면에 출력할 데이터
		mav.addObject("pagingHtml", page.getPagingHtml());//링크문자열
		
		return mav;
	}
}