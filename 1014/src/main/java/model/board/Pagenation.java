package model.board;

public class Pagenation {
	// 멤버변수 
	private int pageSize; // 한 페이지에서 보일 게시글 수 
	private int firstPageNum; // 첫번째 페이지 번호
	private int prevPageNum; // 이전 페이지 번호
	private int startPageNum; // 시작페이지 (페이징네비기준)
	private int pageNum; // 페이지 번호
	private int endPageNum; // 마지막 페이지 (페이징네비기준)
	private int nextPageNum; // 다음 페이지 번호
	private int finalPageNum; // 마지막 페이지 번호
	private int totalCount; //  게시글 전체 수 
	
	// Getter & Setter
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstPageNum() {
		return firstPageNum;
	}
	public void setFirstPageNum(int firstPageNum) {
		this.firstPageNum = firstPageNum;
	}
	public int getPrevPageNum() {
		return prevPageNum;
	}
	public void setPrevPageNum(int prevPageNum) {
		this.prevPageNum = prevPageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	public int getNextPageNum() {
		return nextPageNum;
	}
	public void setNextPageNum(int nextPageNum) {
		this.nextPageNum = nextPageNum;
	}
	public int getFinalPageNum() {
		return finalPageNum;
	}
	public void setFinalPageNum(int finalPageNum) {
		this.finalPageNum = finalPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.Paging();
	}
	
	// Paging()
	public void Paging() {
		if(this.totalCount==0) {	// 게시글이 아예 없을 경우 
			return;
		}
		if(this.pageNum==0) { 		// 기본값 설정
			this.setPageNum(1);
		}
		if(this.pageSize==0) {		// 기본값 설정
			this.setPageSize(10);
		}
		
		int finalPage = (totalCount+(pageSize-1))/pageSize;
		// ex) total = 30 (30+(10-1))/10)=3
		System.out.println("finalPage="+finalPage);
		
		if(this.pageNum>finalPage) {	// 현재 페이지 번호가 마지막페이지보다 크다면 
			this.setPageNum(finalPage);	// 현재페이지번호를 마지막 페이지번호로 설정한다.
		}
		if(this.pageNum<0 || this.pageNum>finalPage) {	// 만약 현재페이지번호가 0보다 작거나 마지막페이지 보다 크다면 
			this.pageNum=1;	// 현재페이지번호를 1로 셋팅
		}
		
		boolean isNowFirst = pageNum == 1? true:false; // 현재페이지번호가 1과 같다 참:거짓
		boolean isNowFinal = pageNum == finalPage? true:false; // 마지막페이지 
		
		int startPage = ((pageNum-1)/10)*10+1; 
		int endPage = startPage+10-1; 
		
		if(endPage>finalPage) {
			endPage=finalPage;
		}
		this.setFirstPageNum(1);
		if(isNowFirst) {
			this.setPrevPageNum(1);
		}else {
			this.setPrevPageNum((pageNum-1)<1?1:(pageNum-1));
		}
		this.setStartPageNum(startPage);
		this.setEndPageNum(endPage);
	
		if(isNowFinal) {
			this.setNextPageNum(finalPage);
		}else {
			this.setNextPageNum((pageNum+1)>finalPage?finalPage:(pageNum+1));
		}
		this.setFinalPageNum(finalPage);
	}
	@Override
	public String toString() {
		return "Pagenation [pageSize=" + pageSize + ", firstPageNum=" + firstPageNum + ", prevPageNum=" + prevPageNum
				+ ", startPageNum=" + startPageNum + ", pageNum=" + pageNum + ", endPageNum=" + endPageNum
				+ ", nextPageNum=" + nextPageNum + ", finalPageNum=" + finalPageNum + ", totalCount=" + totalCount
				+ "]";
	}
	
	
}
