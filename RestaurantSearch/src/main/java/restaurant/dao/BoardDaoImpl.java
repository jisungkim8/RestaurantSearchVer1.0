package restaurant.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;//Mybatis~.jar
import restaurant.dto.BoardCommandDto;

public class BoardDaoImpl extends SqlSessionDaoSupport implements BoardDao {

	// 글목록보기(map)->/board/list.do , /member/list.do
	public List<BoardCommandDto> list(Map<String, Object> map) {
		// selectList->여러개의 레코드를 얻어올때 사용,selectOne(레코드 한개,객체)
		List<BoardCommandDto> list = getSqlSession().selectList("selectList", map);
		return list;
	}

	// select count(*) from springboard2
	public int getRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectCount", map);
	}

	public int getNewBoardNum() { // <select id="getNewSeq" ~></select> Integer
		// Object->Integer->int
		Integer newBoardNum = (Integer) getSqlSession().selectOne("getNewBoardNum");
		if(newBoardNum==null){
			newBoardNum=0;
		}
		return newBoardNum;
	}

	public void insert(BoardCommandDto board) {
		// getSqlSession().insert|update|delete(실행시킬 sql구문id,전달할 매개변수)
		getSqlSession().insert("insertBoard", board);
	}

	public BoardCommandDto selectBoard(Integer boardNum) {
		// TODO Auto-generated method stub
		BoardCommandDto command = (BoardCommandDto) getSqlSession().selectOne("selectBoard", boardNum);
		return command;
	}

	public void updateHit(Integer boardNum) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateHit", boardNum);// parameterType="Integer" or
													// "int"
	}

	// 수정하기
	public void update(BoardCommandDto board) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateBoard", board);

	}

	// 삭제하기->수정하기와 비슷(암호체크)
	public void delete(Integer boardNum) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteBoard", boardNum);
	}
}