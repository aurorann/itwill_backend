package oop0316;

class Score {
	
	//멤버변수 field
	private String name="손흥민";
	private int kor, eng, mat;
	private int aver;	
	
	//생성자함수 Constructor
	//생성자함수를 오버로드하면 기본생성자 함수는 자동으로 생성되지 않음
	//그래서, 기본생성자함수는 수동으로 생성할 것을 추천
	public Score() {}
	
	//지역변수(멤버변수보다 우선순위. 1순위)
	public Score(String name, int kor, int eng, int mat) { //void 쓰면 안됨
		//this.멤버변수=지역변수
		this.name=name;
		this.kor=kor;
		this.eng=eng;
		this.mat=mat;
		this.aver=(kor+eng+mat)/3;
	}//end
	
	//멤버함수 method
	public void disp() {
		//지역변수의 우선순위가 가장 높다
		String name="박지성";
		System.out.println(name);
		
		System.out.println(this.name);
		System.out.println(this.kor);
		System.out.println(this.eng);
		System.out.println(this.mat);
		System.out.println(this.aver);
	}//disp() end
	

}//class end
