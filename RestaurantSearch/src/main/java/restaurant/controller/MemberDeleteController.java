
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
import org.springframework.web.bind.annotation.ResponseBody;
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
public class MemberDeleteController {
	//로그객체
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MemberDao memberDao;//Setter Method호출할 필요가 없다.
	
	@RequestMapping("/adminMemberDelete.do")
	@ResponseBody 
	public String process(@RequestParam("memberId") String memberId) {
		if (log.isDebugEnabled()) {// 디버그 모드라면
			log.debug("memberDao:" + memberDao);
		}

		// 2.boardNum값에 해당하는 값만 출력
		MemDetInfoDto selectMember = memberDao.selectMember(memberId);
		
		System.out.println("selectMember = " + selectMember.getMemberId());
		
		if (selectMember != null) {
			System.out.println("selectMember != null");
			memberDao.deleteMember(memberId);
		}
		
		return "redirect:/memList.do";
	}
}