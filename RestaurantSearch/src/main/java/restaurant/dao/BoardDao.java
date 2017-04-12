package restaurant.dao;

//페이징처리+검색어 찾기
//List,Map객체필요
import java.util.List;
import java.util.Map;

import restaurant.dto.BoardCommandDto;

public interface BoardDao {
	// 글목록보기->검색까지 겸임
	public List<BoardCommandDto> list(Map<String, Object> map);

	public int getRowCount(Map<String, Object> map);// 총레코드수 구하기

	// 게시물의 최대값을 구하기
	public int getNewBoardNum();

	public void insert(BoardCommandDto board);// 글쓰기(파일 업로드까지)
	// 조회수 증가, 조회수 증가된 데이터 레코드 찾기

	public BoardCommandDto selectBoard(Integer boardNum);// (int seq)->글상세보기

	public void updateHit(Integer boardNum);// 조회수 증가

	public void update(BoardCommandDto board);// 글수정하기

	public void delete(Integer boardNum);// 글삭제하기

}