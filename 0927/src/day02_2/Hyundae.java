package day02_2;

public class Hyundae implements Car{
	@Override
	public void bootOn() {
		System.out.println("Hyundae 시동 On!");
		
	}

	@Override
	public void gearP() {
		System.out.println("Hyundae 기어위치 : Parking");
	}

	@Override
	public void gearN() {
		System.out.println("Hyundae 기어위치 : Neutral");
	}

	@Override
	public void gearR() {
		System.out.println("Hyundae 기어위치 : Reverse ");
	}

	@Override
	public void gearD() {
		System.out.println("Hyundae 기어위치 : Drive");
	}

	@Override
	public void br() {
		System.out.println("Hyundae 브레이크! 멈춤!!!");
	}

	@Override
	public void accelerator() {
		System.out.println("Hyundae 액셀레이터! SpeedUp");
	}

	@Override
	public void bootOff() {
		System.out.println("Hyundae 시동 Off!");
	}
}
