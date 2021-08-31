package model.member;

public class MemberVO {
	private int mnum;
	private String mid;
	private String mpw;
	
	// getter & setter
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	// toString 
	@Override
	public String toString() {
		return "MemberVO [mnum=" + mnum + ", mid=" + mid + ", mpw=" + mpw + "]";
	}
	
	
	
	
	
	
}
