package tag;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class TestTagHandler extends SimpleTagSupport {

	// ���� �±��� ����� �����ϴ� �޼���
	// �����±׸� ������ ȣ���
	public void doTag() throws IOException {
		// JSP�κ��� ������ �޾ƿü��ְ��ϴ� �޼���
		// getOut() : out��ü�� �����Ҷ����
		JspWriter out=getJspContext().getOut();
		out.println("�±� �ڵ鷯 Ŭ������� �ǽ���!");
	}
	
}
