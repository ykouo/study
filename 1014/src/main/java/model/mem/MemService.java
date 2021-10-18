package model.mem;

import java.util.List;

public interface MemService {
	void insertMem(MemVO vo); //C	// 회원가입기능 
	void updateMem(MemVO vo); //U	//회원정보수정기능
	void deleteMem(MemVO vo); //D	// 회원탈퇴기능 
	MemVO getMem(MemVO vo);	  // R - select one // 로그인기능 
	List<MemVO> getMemList(MemVO vo); // R - select all 1

}
