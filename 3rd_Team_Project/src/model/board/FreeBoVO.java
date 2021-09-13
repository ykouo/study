package model.board;

import java.sql.Date;

public class FreeBoVO {
	
	// ��� ���� 
		private int pnum; 			// PNUM INT PRIMARY KEY -- �Խñ� ���� ��ȣ
		private String ptitle;		// PTITLE VARCHAR(50) NOT NULL -- �Խñ� ���� 
		private String pcontent;	// PCONTENT VARCHAR(1000) NOT NULL -- �Խñ� ����
		private Date pdate;			// PDATE VARCHAR(50) NOT NULL -- �Խñ� �ۼ����� 
		private String mname;		// MNAME VARCHAR(50) NOT NULL -- ȸ�� �г���
		private String mid;			// MID VARCHAR(50) NOT NULL	-- ȸ�� ���̵�
		private int cnt;			// CNT INT NOT NULL -- ��ȸ��
		private String category;	// CATEGORY VARCHAR(50) NOT NULL -- ī�װ� 
		
		// Getter & Setter 
		public int getPnum() {
			return pnum;
		}
		public void setPnum(int pnum) {
			this.pnum = pnum;
		}
		public String getPtitle() {
			return ptitle;
		}
		public void setPtitle(String ptitle) {
			this.ptitle = ptitle;
		}
		public String getPcontent() {
			return pcontent;
		}
		public void setPcontent(String pcontent) {
			this.pcontent = pcontent;
		}
		public Date getPdate() {
			return pdate;
		}
		public void setPdate(Date pdate) {
			this.pdate = pdate;
		}
		public String getMname() {
			return mname;
		}
		public void setMname(String mname) {
			this.mname = mname;
		}
		public String getMid() {
			return mid;
		}
		public void setMid(String mid) {
			this.mid = mid;
		}
		public int getCnt() {
			return cnt;
		}
		public void setCnt(int cnt) {
			this.cnt = cnt;
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
			return "FreeBoVO [pnum=" + pnum + ", ptitle=" + ptitle + ", pcontent=" + pcontent + ", pdate=" + pdate
					+ ", mname=" + mname + ", mid=" + mid + ", cnt=" + cnt + ", category=" + category + "]";
		}
		
		
}
