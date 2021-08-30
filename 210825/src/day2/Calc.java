package day2;

public class Calc {
	// 관심분리 (concern분리)
	//-> 기능을 따로따로 보관
	// == 협업유리
	// == 유지보수 편리
	// 기능보관한 클래스 파일 -> 모듈 == 컴포넌트 == 빈즈 : M
	
	int result =0;
	
	public Calc(int num1, int num2, String op) {
		
		if(op.equals("+")) {
			result = num1+num2;
		}else if(op.equals("-")) {
			result = num1-num2;
		}else if(op.equals("x")) {
			result = num1*num2;
		}else if(op.equals("/")) {
			result = num1/num2;
		}
	}

	public int getResult() {
		return result;
	}

	
}
