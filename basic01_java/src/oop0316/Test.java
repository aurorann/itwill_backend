package oop0316;

public class Test {

	
	public static void test1(int a, int b) {
		int hap=0;
		for(int c=a; c<=b; c++) {
			hap+=c;
		}
		
		System.out.println(hap);
	}
	
	
	public static int test2(int a, int b) {
		int hap=0;
		for(int c=a; c<=b; c++) {
			hap+=c;
		}
		
		return hap;
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		test1(10, 20);
		
		int res=test2(4, 6);
		System.out.println(res);
		
		
		int c=res+10;
		
		
		
		
		

	}

}
