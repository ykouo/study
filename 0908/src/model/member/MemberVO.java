package model.member;

public class MemberVO {
	private String name;
	private String mid;
	private String mpw;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", mid=" + mid + ", mpw=" + mpw + "]";
	}
}
