package day02;

public class BeanFactory {
	/* 빈즈 클래스 
	 DAO를 만들어내던 친구들
	 DAO == 비즈니스 메서드를 가지고 있는 객체
	 == 모듈 
	*/
	public Object getBean(String beanName) {
		if(beanName.equals("Ga")) {
			return new GaPhone();
		}else if(beanName.equals("I")) {
			return new IPhone();
		}
		
		return null;
	}
	
	
	
	
}
