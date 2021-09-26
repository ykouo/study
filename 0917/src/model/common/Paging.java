package model.common;

import model.message.MessageDAO;

public class Paging {
	
	// ������� 
	private int totalCount; // �Խñ� ��ü�� 
	private int page=1; //���������� 
	private int beginPage; //����������
	private int endPage; // ��������
	private int displayRow=5; // ���������� ��� �Խñ��� �����֐�
	private int displayPage=5; //���������� ������ �������� ��������
	boolean prev;// ���������� ��ư�� ���ϰ��� �Ⱥ��ϰ��� üũ�ϴ� ���� 
	boolean next; //���������� ��ư�� ���ϰ��� �Ⱥ��ϰ��� üũ�ϴ� ���� 
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
