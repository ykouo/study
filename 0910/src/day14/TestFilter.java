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
@WebFilter("*.jsp") // 앞으로 모든 .jsp로 가려면 나(Filter)를 지나가 라는 의미이다. 
public class TestFilter implements Filter {
	// 현 필터는 다국어처리를 담당하는 필터!
	// 멤버변수
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
    // 서버(톰캣)가 꺼질때 한번 (해제)
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	//해당필터가 동작할때마다 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	// 										ㄴ 리퀘스트, 리스폰스 를 가로챈다는 사실을 알수있다. 
		// TODO Auto-generated method stub
		// place your code here
		// pass the request along the filter chain
		request.setCharacterEncoding(this.encoding);
		
		chain.doFilter(request, response); 
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	// 서버(톰캣)가 실행될때 필터를 만들때 한번 (초기생성)
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.encoding=fConfig.getServletContext().getInitParameter("encoding");		
		// 외부파일web.xml에서 등록해놓은 초기화매개변수값(==UTF-8)을 멤버변수로 가져옴 
		// 외부에 설정해놓은 초기화 매개변수를 참고하겠다. web.xml에 있는 내용을 불러오겠다.		
	}

}
