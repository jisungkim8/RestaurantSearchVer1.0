package restaurant.dao;

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

	public void deleteMember(String memberId) {
		// TODO Auto-generated method stub
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
	
}