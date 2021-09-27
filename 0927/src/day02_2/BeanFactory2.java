package day02_2;

public class BeanFactory2 {
	public Object getBean(String beanName) {
		if(beanName.equals("Hyundae")||beanName.equals("현대")||beanName.equals("hyundae")) {
			return new Hyundae();
		}else if(beanName.equals("Kia")||beanName.equals("기아")||beanName.equals("KIA")) {
			return new Kia();
		}
	
		return null;
	}
}
