package oop0321;


class Test{
	
	/*
	//1) 각각의 try~catch문을 직접 이용한 예외처리
	public void view() {
		try {
			int a=3/0;
		}catch (Exception e) {
			System.out.println(e);
		}//end
	}//view() end
	
	public void disp() {
		try {
			int a=Integer.parseInt("KOREA");
		}catch (Exception e) {
			System.out.println(e);
		}//end
	}//disp() end	
	*/
	
	
	//2) throw문을 이용한 예외처리	
	public void view() throws Exception {
		int a=3/0;
	}//view() end
	
	public void disp() throws NullPointerException, NumberFormatException{
		int a=Integer.parseInt("KOREA");
	}//disp() end
	
	
	//OS가 개입해서 문제가 발생하지 않도록 조정하는 기법
	public synchronized void login() {}//login() end
	
}//class end

public class Test08_throws {

	public static void main(String[] args) {
		//throws문
		//->메소드 호출시 예외처리를 한꺼번에 모아서 처리
		
		try {
			Test test=new Test();
			test.view(); //ArithmeticException
			test.disp(); //NumberFormatException
		}catch (Exception e) {
			System.out.println(e);
		}//end
		
		
		

	}//main() end
}//class end
