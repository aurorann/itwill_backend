package oop0321;

abstract class Animal { //추상클래스
	String name;
	void view() {}			//일반메소드
	abstract void disp();	//추상메소드(미완성)
}//class end


//추상클래스는 부모역할만 주로 한다
//추상클래스를 상복받은 자식클래스는 반드시 추상메소드를 완성해야 한다(override)
class Elephant extends Animal {
	@Override
	void disp() {
		System.out.println("점보");
	}
	
}//class end


class Tuna extends Animal {
	@Override
	void disp() {
		System.out.println("니모");
	}
}//class end