package controller.action;
// 페이지 전달방식
// 경로
public class ActionForward {
	// 멤버변수 
	private boolean redirect;	// 페이지전달방식
	private String path;		// 경로 
	
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
