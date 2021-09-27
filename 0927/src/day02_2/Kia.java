package day02_2;

public class Kia implements Car{

	@Override
	public void bootOn() {
		System.out.println("Kia 시동 On!");
		
	}

	@Override
	public void gearP() {
		System.out.println("Kia 기어위치 : Parking");
	}

	@Override
	public void gearN() {
		System.out.println("Kia 기어위치 : Neutral");
	}

	@Override
	public void gearR() {
		System.out.println("Kia 기어위치 : Reverse ");
	}

	@Override
	public void gearD() {
		System.out.println("Kia 기어위치 : Drive");
	}

	@Override
	public void br() {
		System.out.println("Kia 브레이크! 멈춤!!!");
	}

	@Override
	public void accelerator() {
		System.out.println("Kia 액셀레이터! 속도업업");
	}

	@Override
	public void bootOff() {
		System.out.println("Kia 시동 Off!");
	}

}
