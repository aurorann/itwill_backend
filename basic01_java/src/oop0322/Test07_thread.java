package oop0322;


class MyThread3 implements Runnable {
	//클래스가 클래스를 상속받는 경우, 단일 상속만 가능하다
	
	private int num;
	private String name;
	
	public MyThread3() {}
	public MyThread3(int num, String name) {
		this.num=num;
		this.name=name;
	}//end
	
	@Override
	public void run() {//비즈니스 로직 구현
		for(int a=0; a<num; a++) {
			System.out.println(name+":"+a);
		}//for end
	}//run() end

	
}//class end

public class Test07_thread {

	public static void main(String[] args) {
		//3) Runnable인터페이스를 이용해서 쓰레드를 구현한 경우
		/*
			Interface Runnable{}
			class Thread implements Runnable{}
		*/
		
		Thread t1=new Thread(new MyThread3(1000,"★"));
		Thread t2=new Thread(new MyThread3(1000,"★★"));
		Thread t3=new Thread(new MyThread3(1000,"★★★"));
		
		t1.start();
		t2.start();
		t3.start();		
		

	}//main() end
}//class end
