package model.mypage;

public class ConcermVO {
	// ������� 
	private int favnum;		// FAVNUM INT PRIMARY KEY -- ���� �Խñ� ���� ��ȣ  
	private String mid;		// MID VARCHAR(50) NOT NULL -- ȸ�� ���̵�
	private int pnum;		// PNUM INT NOT NULL -- �Խñ� ��ȣ
	private String category;// CATEGORY VARCHAR(50) NOT NULL -- ī�װ�
	
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
