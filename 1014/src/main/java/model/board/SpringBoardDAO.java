package model.board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

class BoardRowMapper implements RowMapper<BoardVO>{

	@Override
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		BoardVO vo = new BoardVO();
		vo.setBid(rs.getInt("bid"));
		vo.setMid(rs.getString("mid"));
		vo.setTitle(rs.getString("title"));
		vo.setContent(rs.getString("content"));
		vo.setWdate(rs.getDate("wdate"));
		return vo;
	}
	
}

@Repository
public class SpringBoardDAO {

	
	// SQL문
	private final String insertBoardSQL = "INSERT INTO BOARD (BID,MID,TITLE,CONTENT) VALUES ((SELECT NVL(MAX(BID),0)+1 FROM BOARD),?,?,?)"; 
	private final String updateBoardSQL = "UPDATE BOARD SET TITLE=?,CONTENT=? WHERE BID=?";
	private final String deleteBoardSQL = "DELETE FROM BOARD WHERE BID=? AND MID=?";
	private final String selectAllBoardSQL = "SELECT * FROM BOARD ORDER BY BID DESC";
	private final String selectOneBoardSQL = "SELECT * FROM BOARD WHERE BID=?";
	private final String searchBoardSQL = "SELECT * FROM BOARD WHERE TITLE LIKE ? ORDER BY BID DESC";

	
	// jdbcTemplate 추가
	
	// new 연산자사용을 컨테이너가 대신!
	// 스프링컨테이너가 IoC를 지원
	// <bean> == 객체를 등록
	// .xml의 부담스러운 설정을 피하기 위해
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 메서드 
	// C 게시글 추가
	public void insertBoard(BoardVO vo) {
		jdbcTemplate.update(insertBoardSQL,vo.getMid(),vo.getTitle(),vo.getContent());
	}
	// U 게시글 수정
	public void updateBoard(BoardVO vo) {
		jdbcTemplate.update(updateBoardSQL,vo.getTitle(),vo.getContent(),vo.getBid());
	}
	// D 게시글 삭제
	public void deleteBoard(BoardVO vo) {
		jdbcTemplate.update(deleteBoardSQL,vo.getBid(),vo.getMid());
	}
	// R select one 게시글 상세보기
	public BoardVO getBoard(BoardVO vo) {
		Object[] args = {vo.getBid()};
		return jdbcTemplate.queryForObject(selectOneBoardSQL, args,new BoardRowMapper());
	}
	// R - select all 1 게시글 리스트 
	public List<BoardVO> getBoardList(BoardVO vo){	
		return jdbcTemplate.query(selectAllBoardSQL,new BoardRowMapper());
	}
	// R - select all 2 검색기능
	public List<BoardVO> searchBoard(BoardVO vo){
		Object[] args = {"%"+vo.getTitle()+"%"};
		return jdbcTemplate.query(searchBoardSQL,args,new BoardRowMapper());
	}
	

}
