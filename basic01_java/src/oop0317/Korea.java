package oop0317;

class Korea {
	String name="대한민국";
	final void view() {
		System.out.println("Korea.view()...");
	}//view() end
	
	void disp() {
		System.out.println("Korea.disp()..."+name);
	}//disp() end	
}//class end


class Seoul extends Korea {}//class end


class Busan extends Korea {
	String name="부산광역시";
	
	@Override	//<-annotation
	void disp() {
		System.out.println("Busan.disp()..."+name);
	}//disp() end	
	
	/*
		@Override
		void view() {} 에러. final메소드는 더이상 오버라이드 할 수 없다.
	 */
}//class end