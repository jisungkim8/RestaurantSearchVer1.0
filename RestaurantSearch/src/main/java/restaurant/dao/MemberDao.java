package restaurant.dao;

import java.util.List;
import java.util.Map;

import restaurant.dto.MemDetInfoDto;
import restaurant.dto.MemSimInfoDto;
import restaurant.dto.ShopReviewDto;

public interface MemberDao {
	public void insertMember(MemDetInfoDto memDetInfoDto);
	
	public void updateMember(MemDetInfoDto memDetInfoDto);
	
	public void updateMemInfoExceptPhoto(MemDetInfoDto memDetInfoDto);
	
	public int checkIdMember(String id);
	
	public int checkNicNameMyProfile(MemDetInfoDto MemDetInfoDto);
	
	public void deleteMember(String memberId);
	
	public void insertMemSimInfo(MemSimInfoDto memSimInfoDto);
	
	public MemSimInfoDto loginCheck(MemSimInfoDto memSimInfoDto);
	
	public MemDetInfoDto selectMemDetInfo(MemDetInfoDto memDetInfoDto);
	
	public MemDetInfoDto searchMemDetInfo(MemDetInfoDto memDetInfoDto);
	
	public String searchPasswdMem(String memId);

	public List<MemDetInfoDto> list(Map<String, Object> map);
	
	public int getRowCount(Map<String, Object> map);// 총레코드수 구하기
	
	public MemDetInfoDto selectMember(String memberId);// 상세보기

	public int checkNicName(String nicName);
	
	public List<MemDetInfoDto> selectMemberForReview(Map<String, Object> shopReviewDto);
}
