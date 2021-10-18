package model.mem;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

class MemRowMapper implements RowMapper<MemVO> {
	
	@Override
	public MemVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemVO vo = new MemVO();
		vo.setMid(rs.getString("mid"));
		vo.setMpw(rs.getString("mpw"));
		vo.setMname(rs.getString("mname"));
		vo.setCall(rs.getString("call"));
		vo.setRole(rs.getString("role"));
		vo.setMdate(rs.getDate("mdate"));
		return vo;
	}
}

@Repository
public class SpringMemDAO {
	// SQL문 
	private final String insertMemSQL ="INSERT INTO MEM (MID,MPW,MNAME,CALL,ROLE) VALUES (?,?,?,?,?)";
	private final String selectALlMemSQL = "SELECT * FROM MEM";
	private final String selectOneMemSQL = "SELECT * FROM MEM WHERE MID=? AND MPW=?";
	private final String updateMemSQL = "UPDATE MEM SET MPW=?,CALL=? WHERE MID=?"; 
	private final String deleteMemSQL =	"DELETE FROM MEM WHERE MID=? AND MPW=?";

	// JDBCTemplete
	@Autowired
	private JdbcTemplate jdbcTemplate;
	// C 회원가입기능 
	public void insertMem(MemVO vo) { 
		jdbcTemplate.update(insertMemSQL,vo.getMid(),vo.getMpw(),vo.getMname(),vo.getCall(),vo.getRole());
	} 
	// U 회원정보수정기능
	public void updateMem(MemVO vo) {
		jdbcTemplate.update(updateMemSQL,vo.getMpw(),vo.getCall(),vo.getMid());
	} 
	// D 회원탈퇴기능 
	public void deleteMem(MemVO vo) {
		jdbcTemplate.update(deleteMemSQL,vo.getMid(),vo.getMpw());
	}
	// R - select one  로그인기능 
	public MemVO getMem(MemVO vo) { // R - select one // 로그인기능 
		Object[] args= {vo.getMid(),vo.getMpw()};
		return jdbcTemplate.queryForObject(selectOneMemSQL, args,new MemRowMapper());
	}	 
	// R - select all 회원목록 가져오기 
	public List<MemVO> getMemList(MemVO vo){ // R - select all 1
		return jdbcTemplate.query(selectALlMemSQL, new MemRowMapper());
	} 

}
