package oop0315;

import java.util.GregorianCalendar;

public class Test07_constructor {

	public static void main(String[] args) {
		//생성자 함수(Constructor)
		//->클래서명과 동일한 함수
		//->new연산자와 함께 메모리를 할당할 때 사용한다
		//->오버로드가 가능하다
		
		//소멸자 함수(Destructor) -> 자바에서는 없음
		//가비지 콜렉팅(Garbage Collecting)
        //->JVM이 자동으로 메모리 회수를 함.
		
		
		GregorianCalendar today=new GregorianCalendar();
		
		if(today.isLeapYear(2023)) {
			System.out.println("윤년");
		}else {
			System.out.println("평년");
		}//if end
		
		
		//뮨)서기1년~서기2023년까지 윤년의 갯수를 구하시오
		
		//1)GregorianCalendar클래스 활용(추천)
		int count1=0;
		for(int y=1; y<=2023; y++) {
			if(today.isLeapYear(y)) {
				count1++;
			}
		}//for end		
		System.out.println(count1);//502
		
		//2)윤년 구하는 공식
		int count2=0;
		for(int y=1; y<=2023; y++) {
			if(y%4==0 && y%100!=0 || y%400==0) {
				count2++;
			}//if end
		}//for end
		System.out.println(count2);//490	
		
		
		/*
		경은 코드
		int hap=0;
		for(int i=1; i<=2023; i++) {
			if(today.isLeapYear(i)) {
				hap=hap+1;
			}//if end
		}//for end

		System.out.println(hap);
		*/
				
		

	}//main() end
}//class end
