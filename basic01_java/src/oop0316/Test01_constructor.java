package oop0316;

public class Test01_constructor {

	public static void main(String[] args) {
		//생성자 함수
		//->클래스명과 동일한 함수
		//->오버로드가 가능하다
		//->new연산자와 함께 메모리 할당할 때 사용한다
		
		//※ School 클래스 생성후 테스트 합니다
		
		//new School();
		//new School();
		
		//생성자 함수의 전달값은 객체선언과 동시에 초기값을 전달해 주는 역할을 한다
		School one=new School("개나리");
		one.calc();
		one.disp();
		
		School two=new School(70, 80, 90);
		two.calc();
		two.disp();
		
		School three=new School("진달래", 10, 20, 30);
		three.calc();
		three.disp();
		

	}//main() end
}//class end
