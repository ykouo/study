package model;

public class MemberBean {
	private String id ="an";
	private String pw = "11";
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	// DAO
	public boolean loginCheck(String inputId, String inputPw){
		boolean flag =false;
		if(id.equals(inputId)) {
			if(pw.equals(inputPw)) {
				System.out.println("�α��μ���!");
				flag = true; //�α��� ������ true��ȯ
			}else {
				System.out.println("Password Ȯ���ʿ�.. Ʋ����..");
			}
		}else {
			System.out.println("IDȮ���ʿ�.. Ʋ����..");
		}
		return flag;
	}
	
	
	
	

}
