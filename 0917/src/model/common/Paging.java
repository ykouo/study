package model.common;

import model.message.MessageDAO;

public class Paging {
	
	// 멤버변수 
	private int totalCount; // 게시글 전체수 
	private int page=1; //현재페이지 
	private int beginPage; //시작페이지
	private int endPage; // 끝페이지
	private int displayRow=5; // 한페이지에 몇개의 게시글을 보여주맂
	private int displayPage=5; //한페이제에 폋개의 페이지를 보여줄지
	boolean prev;// 이전페이지 버튼이 보일건지 안보일건지 체크하는 변수 
	boolean next; //다음페이지 버튼이 보일건지 안보일건지 체크하는 변수 
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		paging();
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getDisplayRow() {
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	public void paging() {
		endPage = ((int)Math.ceil(page/(double)displayPage))*displayPage;
		System.out.println("endPage="+endPage);
		beginPage = endPage-(displayPage-1);
		System.out.println("beginPage" +beginPage);
		System.out.println("beginPage="+beginPage);
		
		
		int totalPage= ((int)Math.ceil(totalCount/(double)displayRow));
		
		if(totalPage<endPage) {
			endPage=totalPage;
			next=false;
		}else {
			next=true;
		}
		prev = (beginPage==1) ? false:true;
		System.out.println("endPage:"+endPage);
		System.out.println("beginPage:"+beginPage);
	}
	
}
