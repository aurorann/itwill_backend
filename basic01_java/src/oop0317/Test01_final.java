package oop0317;

import java.util.Calendar;

//1)final 클래스(종단클래스)
/*
	final class Animal{}//class end
	class Elephant extends Animal{}
*/


//2)final 메소드
class Fruit{
	void view() {}
	final void disp() {}
}//class end

class Apple extends Fruit{ //자식클래스 extends 부모클래스
	
	@Override	//<-annotation, 재정의 가능
	void view() {}

	/*
		@Override
		void disp() {}에러. final 메소드는 override(재정의) 할수 없다. 있는그대로 쓰기만 해야함

	*/
	
}//class end



public class Test01_final {

	public static void main(String[] args) {
		//fianl 마지막
		//변수 : 변수를 상수화
		//함수 : 더 이상 리폼 불가(Override 재정의 불가)
		//클래스 : 종단클래스. 후손클래스 생성 불가(extends 불가)
		
		int a=3;
		a=5;//변수는 다른값으로 대입 가능
		
		final int b=2; //변수의 상수
		//b=4; //에러. final변수는 다른값으로 대입 불가능 const
		
		System.out.println(Calendar.YEAR);		//1
		System.out.println(Calendar.MONTH);		//2
		System.out.println(Calendar.DATE);		//5
		
		System.out.println(Calendar.HOUR);		//10
		System.out.println(Calendar.MINUTE);	//12
		System.out.println(Calendar.SECOND);	//13
		
		/*
			class Calendar {
				static final int YEAR=1;
				static final int MONTH=2;
				static final int DATE=5;			
			}		
		*/
		//Calendar.YEAR=3; 에러. final변수값은 변경할 수 없다
		//Math.PI=3.15;	   에러.
		

	}//main() end
}//class end
