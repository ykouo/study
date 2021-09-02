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
				System.out.println("로그인성공!");
				flag = true; //로그인 성공시 true반환
			}else {
				System.out.println("Password 확인필요.. 틀렸음..");
			}
		}else {
			System.out.println("ID확인필요.. 틀렸음..");
		}
		return flag;
	}
	
	
	
	

}
