package day02_2;

public class Driver {

	public static void main(String[] args) {
		BeanFactory2 factory = new BeanFactory2();
		Car car = (Car)factory.getBean(args[0]);
		car.bootOn();
		car.gearP();
		car.gearD();
		car.gearN();
		car.gearR();
		car.accelerator();
		car.br();
		car.bootOff();
	}
}
