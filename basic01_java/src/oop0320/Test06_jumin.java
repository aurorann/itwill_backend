package oop0320;

public class Test06_jumin {

	public static void main(String[] args) {
		//문제) 주민번호 유효성 검사
		// Jumin 클래스 생성해서 실습합니다
		
		Jumin id=new Jumin("8912301234567");
		
		if(id.validate()) {
			System.out.println("주민번호가 맞습니다");
			id.disp();
		}else {
			System.out.println("주민번호가 유효하지 않습니다");
		}//if end
		
		
		
	}//main() end
}//class end
