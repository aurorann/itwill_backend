package oop0317;

//종단클래스는 상속 받을 수 없다
//final class AA{}

class AA {
	private void zero() {}//상속되지 않음
	public void one() {
		System.out.println("AA.one().....");
	}
	public void two() {
		System.out.println("AA.two().....");
	}
}//class end


//자식클래스 BB, 부모클래스 AA
class BB extends AA{
	public void three() {
		System.out.println("BB.three().....");
	}//three() end
}//class end


//자식클래스 CC, 부모클래스 BB
class CC extends BB {
	public void four() {
		System.out.println("CC.four().....");
	}
}//class end


/*
	에러.
	클래스간의 상속은 단일상속만 가능하다
	class DD{}
	class EE extends AA, DD {}
*/












