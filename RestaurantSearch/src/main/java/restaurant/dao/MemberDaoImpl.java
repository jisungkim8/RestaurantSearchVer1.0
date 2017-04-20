package restaurant.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import restaurant.dto.MemDetInfoDto;
import restaurant.dto.MemSimInfoDto;

public class MemberDaoImpl extends SqlSessionDaoSupport implements MemberDao {

	public void insertMember(MemDetInfoDto memDetInfoDto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertMember", memDetInfoDto);
		System.out.println("MemberDaoImpl_insertMember");
	}

	public void updateMember(MemDetInfoDto memDetInfoDto) {
		// TODO Auto-generated method stub
		System.out.println("MemberDaoImpl_updateMember");		
		getSqlSession().update("updateMemInfo",memDetInfoDto);
	}
	
	public void updateMemInfoExceptPhoto(MemDetInfoDto memDetInfoDto) {
		// TODO Auto-generated method stub
		System.out.println("MemberDaoImpl_updateMember");		
		getSqlSession().update("updateMemInfoExceptPhoto",memDetInfoDto);
	}

	public void deleteMember(String memberId) {
		// TODO Auto-generated method stub
		System.out.println("MemberDaoImple >> delteMember >> memberId = " + memberId);
		memberId = memberId.trim();
		getSqlSession().delete("deleteMemSimInfo" , memberId);
		getSqlSession().delete("deleteMemDetInfo" , memberId);
	}

	public int checkIdMember(String id) {
		// TODO Auto-generated method stub
		System.out.println("checkIdMember");
		int memberCount = getSqlSession().selectOne("checkIdMember", id);
		return memberCount;
	}

	public void insertMemSimInfo(MemSimInfoDto memSimInfoDto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertMemSimInfo", memSimInfoDto);
		System.out.println("MemberDaoImpl_memSimInfoDto");
	}

	public MemSimInfoDto loginCheck(MemSimInfoDto memSimInfoDto) {
		// TODO Auto-generated method stub
		System.out.println("MemSimInfoDto loginCheck");
		MemSimInfoDto memSimInfo=new MemSimInfoDto();
		memSimInfo=getSqlSession().selectOne("selectLoginCheckMem",memSimInfoDto);
		return memSimInfo;
	}
	
	public MemDetInfoDto selectMemDetInfo(MemDetInfoDto memDetInfoDto) {
		// TODO Auto-generated method stub
		System.out.println("__selectMemDetInfo__");
		MemDetInfoDto memDetInfo=new MemDetInfoDto();
		memDetInfo=getSqlSession().selectOne("selectMemDetInfo",memDetInfoDto);
		return memDetInfo;
	}
	
	public MemDetInfoDto searchMemDetInfo(MemDetInfoDto memDetInfoDto) {
		// TODO Auto-generated method stub
		System.out.println("____searchMemDetInfo____");
		MemDetInfoDto memDetInfo=new MemDetInfoDto();
		memDetInfo=getSqlSession().selectOne("memDetInfobyPasswdSearch",memDetInfoDto);
		return memDetInfo;
	}
	
	public String searchPasswdMem(String memId) {
		// TODO Auto-generated method stub
		String memPasswd;
		memPasswd=getSqlSession().selectOne("searchPasswdMem",memId);		
		return memPasswd;
	}
	
	public int checkNicName(String id) {
		System.out.println("checkNicName");
		int nicNameCount = getSqlSession().selectOne("checkNicName", id);
		return nicNameCount;
	}
	
	public int checkNicNameMyProfile(MemDetInfoDto MemDetInfoDto) {
		System.out.println("checkNicName");
		int nicNameCount = getSqlSession().selectOne("checkNicNameMyProfile", MemDetInfoDto);
		return nicNameCount;
	}
	
	public List<MemDetInfoDto> list(Map<String, Object> map) {
		// selectList->여러개의 레코드를 얻어올때 사용,selectOne(레코드 한개,객체)
		List<MemDetInfoDto> list = getSqlSession().selectList("memList", map);
		return list;
	}

	// select count(*) from springboard2
	public int getRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("memCount", map);
	}
	
	public MemDetInfoDto selectMember(String memberId) {
		// TODO Auto-generated method stub
		MemDetInfoDto selectMember = (MemDetInfoDto) getSqlSession().selectOne("selectMember", memberId);
		return selectMember;
	}


	
	
}