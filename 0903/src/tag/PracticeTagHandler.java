package tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PracticeTagHandler extends SimpleTagSupport { // 클래스를 상속받아 사용 
	
	private String color; // 어트리뷰트로 설정한 폰트 색상 변수
	private String size; // 어트리뷰트로 설정한 폰트 사이즈 변수
	
	public void doTag() throws IOException, JspException{ 
		System.out.println("여기는 doTag안 ");
		JspWriter out = getJspContext().getOut();
		
		JspFragment body = getJspBody(); // 자바 코드 안이기 때문에 jsb:doBody가 아니라 getJspBody로 불러와야함
		if(body!=null) {	// 2)if문으로 걸러내야한다.
			out.println("<p style='color:");
			out.println(color);
			out.println("; font-size:");
			out.println(size);
			out.println(";'>");
			body.invoke(null); // 1)태그 바디를 사용하지 않으면 null포인터 이셉션이 발생하므로 
			out.println("</p>");
		}
		
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
	
}
