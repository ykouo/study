package model.mypage;

public class ConcermVO {
	// 멤버변수 
	private int favnum;		// FAVNUM INT PRIMARY KEY -- 관심 게시글 고유 번호  
	private String mid;		// MID VARCHAR(50) NOT NULL -- 회원 아이디
	private int pnum;		// PNUM INT NOT NULL -- 게시글 번호
	private String category;// CATEGORY VARCHAR(50) NOT NULL -- 카테고리
	
	// Getter & Setter
	public int getFavnum() {
		return favnum;
	}
	public void setFavnum(int favnum) {
		this.favnum = favnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	// toString()
	@Override
	public String toString() {
		return "ConcermVO [favnum=" + favnum + ", mid=" + mid + ", pnum=" + pnum + ", category=" + category + "]";
	}

	
}
