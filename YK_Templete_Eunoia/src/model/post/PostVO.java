package model.post;

import java.sql.Date;

public class PostVO {
	private int pnum;
	private String ptitle;
	private String pwriter;
	private String pcontent;
	private Date pdate;
	
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
	public String getPwriter() {
		return pwriter;
	}
	public void setPwriter(String pwriter) {
		this.pwriter = pwriter;
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
	@Override
	public String toString() {
		return "PostVO [pnum=" + pnum + ", ptitle=" + ptitle + ", pwriter=" + pwriter + ", pcontent=" + pcontent
				+ ", pdate=" + pdate + "]";
	}
	
	
	
	
	
}
