package oop0315;

public class Test08_constructor {

	public static void main(String[] args) {
		//생성자함수 연습
		//※School클래스 생성후 연습
		
		//new School();//객체(Object) 또는 Instance 생성자 함수
		new School();
		
		School one=new School(); //#100번지
		System.out.println(one.hashCode());
		one.calc();
		one.disp();
		
		
		String a=new String();	//빈문자열
		String b=null;			//메모리 할당 하지 않고 b라는 참조변수 선언
		System.out.println(a.length());//글자갯수 0
		System.out.println(b.length());//NullPointerException 발생
		
		System.out.println("null");//문자열 상수
		
	}//main() end
}//class end
