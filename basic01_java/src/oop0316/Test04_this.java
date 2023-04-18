package oop0316;

public class Test04_this {

	public static void main(String[] args) {
		//this
		//->클래스가 자신을 가르키는 대명사
		//->일반지역변수와 멤버변수를 구분하기 위함
		
		Score one=new Score();
		one.disp();
		
		Score two=new Score("김연아", 50, 60, 70);//객체생성하며 매개변수 선언
		two.disp();
		
		Score three=new Score("무궁화", 10, 20, 30);
		three.disp();
		
		//객체가 참조하고 있는 주소
		System.out.println(one.hashCode());
		System.out.println(two.hashCode());
		System.out.println(three.hashCode());
		////////////////////////////////////////////
		
		
		Score kim = new Score("봉선화", 10, 20, 30);	//#100
		Score lee = new Score("라일락", 40, 50, 60);	//#200
		Score park = new Score("진달래", 70, 80, 90);	//#300
		
		//변수 : 지역변수 전역변수 매개변수 참조변수
		//객체 배열
		Score[] score = {
				 new Score("오필승", 10, 20, 30)
				,new Score("코리아", 40, 50, 60)
				,new Score("대한민국", 70, 88, 90)
		};
		
		/*
	        +---------+---------+--------+
	        |  #100   |  #200   |  #300  |
	        +---------+---------+--------+
	         score[0]   score[1]  score[2]
		*/
		
		score[0].disp();
		score[1].disp();
		score[2].disp();
		
		int size=score.length;
		
		for(int i=0; i<size; i++) {
			score[i].disp();
		}

	}//main() end
}//calss end
