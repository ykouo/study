package test;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
 
@WebListener  // 어노테이션  (Annotation)
			  // 정확하게 감지하기 위해  
//리스너 클래스 ▸
// public class InitialMember 해당 클래스를 리스너클래스 처럼 동작 시키기 위해 
// ServletContextListener 라는 추상메서드를 implements하는데  
// 추상메서드를 implements  하면 강제성을 갖기때문에  메서드를 오바라이딩 한다. 
public class InitialMember implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// DB데이터를 생성
		// ▸ Member.java
		ArrayList<Member> datas = new ArrayList<Member>();
		for(int i=1;i<=5;i++) {
			Member data = new Member("티모"+i,"timo"+i+"@naver.com");
			datas.add(data);			
		}
		datas.add(new Member("아리",null));
		datas.add(new Member("소나",null));
	
	// 현재 만든 데이터들은 톰캣이 시작될떄 생성된것 
	// scope: application에 저장하고 싶다 ! 
	ServletContext context = sce.getServletContext();
	context.setAttribute("members", datas); // application scope에 저장됨!!!
	context.setAttribute("member", new Member()); 
	}
	
	
	
	
}
