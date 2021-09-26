package model.common;

import model.board.FreeBoDAO;

public class Paging {
	private final static int pageCount = 3; //  ������������ �����ִ� �Խñ� �� 
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
	
	// block�� ���� 
	// ���� �������� ���� block�� ������ȣ�� ����ȣ�� ���
	
	public void makeBlock(int curPage) {
		int blockNum=0;
		blockNum = (int)Math.floor((curPage-1)/pageCount);
		blockStartNum=(pageCount*blockNum)+1;
		blockLastNum = blockStartNum+(pageCount-1);
	}
	// �� �������� ������ ��ȣ
	public void makeLastPageNum() {
		FreeBoDAO dao=new FreeBoDAO();   // �� �Խñ� ���� �޾ƿ��� ���� table��ü ����
		int total=dao.getPageCount();	// �� �Խñ� ��
		if(total%pageCount==0) {	// ���� �ѰԽñۼ� /������������ ������ �Խñ� �� == 0 �̸� 
			lastPageNum = (int)Math.floor(total/pageCount); // lastPageNum  �� �ѰԽñۼ� / ������������ ������ �Խñۼ��� ��
		}else {
			lastPageNum= (int)Math.floor(total/pageCount)+1; // !=0 �� ��+1�� �Ѵ�.
		}
	}
		
	//�˻������� ���������� ������ ��ȣ 
	public void makeLastPageNum(String kwd) { // ���ڷ� Ű���� ���� �� kwd�� �޴´�.
		FreeBoDAO dao = new FreeBoDAO();
		int total = dao.getPageCount("����¡");
		if(total%pageCount==0) {	// ���� �ѰԽñۼ� /������������ ������ �Խñ� �� == 0 �̸� 
			lastPageNum = (int)Math.floor(total/pageCount); // lastPageNum  �� �ѰԽñۼ� / ������������ ������ �Խñۼ��� ��
		}else {
			lastPageNum= (int)Math.floor(total/pageCount)+1; // !=0 �� ��+1�� �Ѵ�.
		}
		
	}
	
}
