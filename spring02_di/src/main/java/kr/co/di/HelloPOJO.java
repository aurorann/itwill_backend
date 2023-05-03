package kr.co.di;

public class HelloPOJO {

	public static void main(String[] args) {
		// POJO방식의 객체생성
		
		IHello hello=null;
		
		hello = new MessageKO(); //POJO방식의 객체생성
		hello.sayHello("손흥민");

	}//main() end

}//class end
