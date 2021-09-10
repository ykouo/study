package day14;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class TestFilter
 */
@WebFilter("*.jsp") // ������ ��� .jsp�� ������ ��(Filter)�� ������ ��� �ǹ��̴�. 
public class TestFilter implements Filter {
	// �� ���ʹ� �ٱ���ó���� ����ϴ� ����!
	// �������
	private String encoding; 
	
    /**
     * Default constructor. 
     */
    public TestFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
    // ����(��Ĺ)�� ������ �ѹ� (����)
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	//�ش����Ͱ� �����Ҷ����� 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	// 										�� ������Ʈ, �������� �� ����æ�ٴ� ����� �˼��ִ�. 
		// TODO Auto-generated method stub
		// place your code here
		// pass the request along the filter chain
		request.setCharacterEncoding(this.encoding);
		
		chain.doFilter(request, response); 
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	// ����(��Ĺ)�� ����ɶ� ���͸� ���鶧 �ѹ� (�ʱ����)
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.encoding=fConfig.getServletContext().getInitParameter("encoding");		
		// �ܺ�����web.xml���� ����س��� �ʱ�ȭ�Ű�������(==UTF-8)�� ��������� ������ 
		// �ܺο� �����س��� �ʱ�ȭ �Ű������� �����ϰڴ�. web.xml�� �ִ� ������ �ҷ����ڴ�.		
	}

}
