package day14;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class DogListener
 *
 */
@WebListener
public class DogListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public DogListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
        //�����Ҷ� ������ ����
    	ServletContext context = sce.getServletContext();
    	ArrayList<Dog> dogList = new ArrayList<>();
    	Dog dog1 = new Dog("��Ƽ��");
    	Dog dog2 = new Dog("Ǫ��");
    	Dog dog3 = new Dog("��ũ���׸���");
    	Dog dog4 = new Dog("���������");
    	Dog dog5 = new Dog("��������");
    	dogList.add(dog1);
    	dogList.add(dog2);
    	dogList.add(dog3);
    	dogList.add(dog4);
    	dogList.add(dog5);
    	
    	context.setAttribute("dogList", dogList);
    	
    }
	
}
