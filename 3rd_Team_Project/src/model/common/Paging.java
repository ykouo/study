package model.common;

import model.board.FreeBoDAO;

public class Paging {
	private final static int pageCount = 3; //  한페이지에서 보여주는 게시글 수 
	private int blockStartNum =0; // 
	private int blockLastNum =0;
	private int lastPageNum=0;
	
	// Getter & Setter
	public int getBlockStartNum() {
		return blockStartNum;
	}
	public void setBlockStartNum(int blockStartNum) {
		this.blockStartNum = blockStartNum;
	}
	public int getBlockLastNum() {
		return blockLastNum;
	}
	public void setBlockLastNum(int blockLastNum) {
		this.blockLastNum = blockLastNum;
	}
	public int getLastPageNum() {
		return lastPageNum;
	}
	public void setLastPageNum(int lastPageNum) {
		this.lastPageNum = lastPageNum;
	}
	public static int getPagecount() {
		return pageCount;
	}
	
	// block을 생성 
	// 현재 페이지가 속한 block의 사직번호와 끝번호를 계산
	
	public void makeBlock(int curPage) {
		int blockNum=0;
		blockNum = (int)Math.floor((curPage-1)/pageCount);
		blockStartNum=(pageCount*blockNum)+1;
		blockLastNum = blockStartNum+(pageCount-1);
	}
	// 총 페이지의 마지막 번호
	public void makeLastPageNum() {
		FreeBoDAO dao=new FreeBoDAO();   // 총 게시글 수를 받아오기 위해 table객체 생성
		int total=dao.getPageCount();	// 총 게시글 수
		if(total%pageCount==0) {	// 만약 총게시글수 /한페이지에서 보여줄 게시글 수 == 0 이면 
			lastPageNum = (int)Math.floor(total/pageCount); // lastPageNum  은 총게시글수 / 한페이지에서 보여줄 게시글수의 몫
		}else {
			lastPageNum= (int)Math.floor(total/pageCount)+1; // !=0 면 몫에+1을 한다.
		}
	}
		
	//검색했을때 총페이지의 마지막 번호 
	public void makeLastPageNum(String kwd) { // 인자로 키워드 변수 인 kwd를 받는다.
		FreeBoDAO dao = new FreeBoDAO();
		int total = dao.getPageCount("페이징");
		if(total%pageCount==0) {	// 만약 총게시글수 /한페이지에서 보여줄 게시글 수 == 0 이면 
			lastPageNum = (int)Math.floor(total/pageCount); // lastPageNum  은 총게시글수 / 한페이지에서 보여줄 게시글수의 몫
		}else {
			lastPageNum= (int)Math.floor(total/pageCount)+1; // !=0 면 몫에+1을 한다.
		}
		
	}
	
}
