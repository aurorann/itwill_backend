package oop0320;

class School extends Object {//extends Object 생략가능
	String name="학교";
	public School() {
		System.out.println("School()...");
	}//School() end	
}//class end


class MiddleSchool extends School {
	public MiddleSchool() {
		//상속관계에서 부모 생성자 함수 호출 명령어
		super();//생략가능. 상속이 이미 되어있기에 먼저 호출됨.Omit	
		
		System.out.println("MiddleSchool()...");
	}//MiddleSchool() end
	
	public void disp() {
		System.out.println(name);//학교
	}
}//class end

class HighSchool extends School {//멤버함수
	String name="고등학교";//멤버변수
	public HighSchool() {
		super();
		System.out.println("HighSchool()...");
	}//HighSchool() end
	
	public void disp() {
		String name="강남 고등학교";
		System.out.println(name);		//'강남고등학교'	지역변수. 물려받은곳에 name이 있어도 자신내부에 있는 name이 먼저임
		System.out.println(this.name);	//'고등학교'		나의 멤버변수
		System.out.println(super.name);	//'학교'			부모의 멤버변수
	}
	
}//class end





