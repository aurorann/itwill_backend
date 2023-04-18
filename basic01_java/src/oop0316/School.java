package oop0316;

class School {
	
	//멤버변수. field(java) cloumn(DB) property(javascript)
	private String name;
	private int kor, eng, mat;
	private int aver;	
	
	//생성자함수. 클래스명과 동일한 함수. 선언 안해도 됨. void 쓰면 안됨!
	public School() {
		System.out.println("School() 호출됨");
	}//School() end
	
	
	//생성자 함수도 오버로드(함수명 중복 정의)가 가능하다
	public School(String n) {
		name=n;
	}//School() end
	
	public School(int k, int e, int m) {
		kor=k;
		eng=e;
		mat=m;
	}//School() end
	
	public School(String n, int k, int e, int m) {
		name=n;
		kor=k;
		eng=e;
		mat=m;
	}//School() end

	
	//멤버함수
	public void calc() {
		aver=(kor+eng+mat)/3;
	}//class end
	
	public void disp() {
		System.out.println(name);
		System.out.println(kor);
		System.out.println(eng);
		System.out.println(mat);
		System.out.println(aver);
	}//disp() end
}//class end
