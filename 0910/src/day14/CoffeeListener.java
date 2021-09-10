package day14;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class CoffeeListener
 *
 */
@WebListener
public class CoffeeListener implements ServletContextListener {

	/**
	 * Default constructor.
	 */
	public CoffeeListener() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		// �����ҋ� ������ ���� �ϴϱ� ���⿡ �ۼ�
		ServletContext context = sce.getServletContext();

		ArrayList<Coffee> coffeeList = new ArrayList<>();
		Coffee coffee1 = new Coffee("�Ƹ޸�ī��", 4100);
		Coffee coffee2 = new Coffee("��ġ��������", 6100);
		Coffee coffee3 = new Coffee("����ũ��Ǫ��Ǫġ��", 6800);
		Coffee coffee4 = new Coffee("���ٹ�ٴҶ��", 6100);

		coffeeList.add(coffee1);
		coffeeList.add(coffee2);
		coffeeList.add(coffee3);
		coffeeList.add(coffee4);

		System.out.println(coffeeList);
		context.setAttribute("coffeeList", coffeeList);

	}

}
