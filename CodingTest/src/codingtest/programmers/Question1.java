package codingtest.programmers;
class Solution {
    public int[] solution(int[] lottos, int[] win_nums) {
        int[] answer = new int[2];
        // 0카운팅 변수 선언
        // success cnt 변수 선언
        int zeroCnt = 0;
        int successCnt = 0;
        System.out.println("lottos.length : "+ lottos.length);      
        for(int i=0;i<lottos.length;i++){
            if(lottos[i] == 0){
                zeroCnt++;
            }
            System.out.println(zeroCnt);
            for(int j=0;j<win_nums.length;j++){
                if(lottos[i] == win_nums[j]){
                    successCnt++;
                    break;
                }                     
            }
  
        }
        answer[0] = grade(zeroCnt+successCnt);
        answer[1] = grade(successCnt);

        return answer;
    }
            // 등수 계산하는 메서드 
    public int grade(int cnt){
        switch(cnt){
            case 6 : return 1;
            case 5 : return 2;
            case 4 : return 3;
            case 3 : return 4;
            case 2 : return 5;
            case 1 : return 6;
            default : return 6;
        }
    }
}
public class Question1 {
	public static void main(String[] args) {
		
	}
}
