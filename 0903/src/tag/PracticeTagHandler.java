package tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PracticeTagHandler extends SimpleTagSupport { // Ŭ������ ��ӹ޾� ��� 
	
	private String color; // ��Ʈ����Ʈ�� ������ ��Ʈ ���� ����
	private String size; // ��Ʈ����Ʈ�� ������ ��Ʈ ������ ����
	
	public void doTag() throws IOException, JspException{ 
		System.out.println("����� doTag�� ");
		JspWriter out = getJspContext().getOut();
		
		JspFragment body = getJspBody(); // �ڹ� �ڵ� ���̱� ������ jsb:doBody�� �ƴ϶� getJspBody�� �ҷ��;���
		if(body!=null) {	// 2)if������ �ɷ������Ѵ�.
			out.println("<p style='color:");
			out.println(color);
			out.println("; font-size:");
			out.println(size);
			out.println(";'>");
			body.invoke(null); // 1)�±� �ٵ� ������� ������ null������ �̼����� �߻��ϹǷ� 
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
