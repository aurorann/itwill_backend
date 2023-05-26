package oop0315;

public class Test04_quiz {
	
	public static double sd(int[] aver) {
		int size=aver.length;//요소의 갯수 5
		
		//1단계) aver의 각 요소의 누적의 합 구하기(436)
		double hap=0.0;//hap변수를 for문 안에 쓰면 계속 초기화 되므로 위치 주의
		for(int i=0; i<size; i++) {
			hap=hap+aver[i];
		}//for end
		
		//aver 배열 요소의 평균 구하기 (87.2)
		double avg=hap/size;		
		
		double sum=0.0;//편차들의 총 합계
		for(int i=0; i<size; i++) {
			//aver의 각 요소에서 avg값과의 차이를 구하고 
			double d=aver[i]-avg;
			  
			//2단계)
			//->avg(87.2)와의 차이값을 전부 양수로 바꾼다(편차)
			d=Math.abs(d);
			
			//2)에서 나온 편차들의 누적한다(2.2+2.8+5.8+1.2+5.2)
			sum=sum+d;		
		}//for end
		
		//3단계) 표준편차
		return sum/size;
		
	}//sd() end
	
	
	
	/*
	경은코드
	public static double sd(int[] a) {
		double hap=0; //int를 쓰게되면 int에서 5를 나누게 되니 소수점이 나오지 않는다
		for(int i=0; i<a.length; i++) {
			hap=hap+a[i];
		}//for end				
		double aver=hap/5;		
		return aver;
	}//sd() end;
	*/
	

	public static void main(String[] args) {		
		//문제) 표준편차(Standard deviation) 구하기

		int[] aver = {85, 90, 93, 86, 82};		
		double result=sd(aver);
		System.out.printf("표준편차 : %.2f", result);
				
		/*		
			1) aver의 평균(87.2)를 구하고, aver의 각 요소에서 87.2를 뺀다
				85-87.2 = -2.2
				90-87.2 = 2.8
				93-87.2 = 5.8
				86-87.2 = -1.2
				82-87.2 = -5.2
			
			2) 1)의 값을 전부 양수로 바꾼다 -> 편차
				2.2
				2.8
				5.8
				1.2
				5.2
		
			3) 2)의 편차들의 평균값 -> 표준편차
				(2.2+2.8+5.8+1.2+5.2)/5=3.44
		*/
		

	}//main() end
}//class end
