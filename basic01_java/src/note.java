
public class note {
	
	public static void test1(int a, int b) {
		int c=a+b;
		System.out.println(c);
		//return; 리턴값이 없다(void)
		//return c; //리턴값은 1개만 리턴할수있다. 여러개를 원하면 배열 등으로 자료형을 다르게 해야한다
				  //리턴값이 있는 경우 리턴값의 자료형을 void자리에 쓴다
	}//test1 end

	public static void main(String[] args) {

		test1(2, 4);
		//System.out.println(test1());
		
		//값 : 상수값, 변수값, 리턴값
		//System.out.println(test1(5,6));
		

	}

}
