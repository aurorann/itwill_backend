package oop0315;

class School {
	//멤버변수 field
	private String name;
	private int kor, eng, mat;
	private int aver;
	
	//생성자함수 Constructor
	//->클래스명과 동일한 함수
	//->리턴형이 없다
	//->public void Schhol(){} 주의!!
	public School() { //기본 생성자 함수
					  //default constructor
					  //자동으로 생성된다
					  //없어도 됨.
		System.out.println("School() 호출됨...");
	}//School() end
	
	//멤버함수 method
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
