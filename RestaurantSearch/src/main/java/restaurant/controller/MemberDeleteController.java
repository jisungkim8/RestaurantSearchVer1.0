
package restaurant.controller;

import java.util.List;

//---------로그에 출력할 수 있도록 설정(Annotation)--
import org.apache.log4j.Logger;//로그 객체 생성
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import restaurant.dao.LikeListDao;
import restaurant.dao.MemberDao;
import restaurant.dao.ReviewPhotoDao;
import restaurant.dao.ShopReviewDao;
import restaurant.dto.MemDetInfoDto;
import restaurant.dto.ShopReviewCommand;

@Controller 
public class MemberDeleteController {
	//로그객체
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MemberDao memberDao;//Setter Method호출할 필요가 없다.
	@Autowired
	private ShopReviewDao shopReviewDao;
	@Autowired
	private ReviewPhotoDao reviewPhotoDao;
	@Autowired 
	private LikeListDao likeListDao;
	
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
			// memberId로 리뷰를 먼저 검색함
			List<ShopReviewCommand> sdid =  shopReviewDao.selectShopReviewByMemberId(memberId);
			
			String reviewId = "";
			if (sdid != null) {
				// 회원이 작성 한 모든 리뷰에 대해서 반복..
				for (ShopReviewCommand shopReviewCommand: sdid) {
					reviewPhotoDao.deleteReviewPhotoDetView(shopReviewCommand.getReviewId()); // 회원이 작성한 리뷰와 관련된 모든 사진 삭제
				}
				shopReviewDao.deleteShopReviewByMemberId(memberId); // 회원아이디로 된 맛집 리뷰전부 삭제
			}
			likeListDao.deleteLikeListByMemberId(memberId);  //위시리스트 삭제 
			memberDao.deleteMember(memberId); 				 // 회원 간편정보 삭제 후, 회원 상세정보삭제.. 
			// 해당 member가 작성한 리뷰가 있다면,
			// 해당 reviewId로 찾아가서 모든 리뷰관련 테이블을 지워줌...
			// 없다면, 좋아요리스트 선 삭제 후, 회원간편정보테이블, 회원상세정보테이블순으로 삭제...
		}
		return "redirect:/memList.do";
	}
}