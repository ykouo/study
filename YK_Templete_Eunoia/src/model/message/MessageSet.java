package model.message;

import java.util.ArrayList;

public class MessageSet {
	// 화면에서 인스타그램 처럼 피드 아래에 댓글이 보이도록 설정하기 위해
	// MessageSet이라는 클래스를 생성해서 객체를 사용할 예정 
	
	// 멤버변수 
	private MessageVO m; // 게시글을 담고있을 MessageVO의 객체 m
	private ArrayList<ReplyVO> rlist = new ArrayList<ReplyVO>();
	// 댓글들을 담고있을 어레이리스트 
	
	// getter & setter
	public MessageVO getM() {
		return m;
	}
	public void setM(MessageVO m) {
		this.m = m;
	}
	public ArrayList<ReplyVO> getRlist() {
		return rlist;
	}
	public void setRlist(ArrayList<ReplyVO> rlist) {
		this.rlist = rlist;
	}
	@Override
	public String toString() {
		return "MessageSet [m=" + m + ", rlist=" + rlist + "]";
	}
	
	
}
