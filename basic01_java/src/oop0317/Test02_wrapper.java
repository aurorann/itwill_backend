package oop0317;

import java.lang.*; //<-자바의 기본 패키지(생략가능)

public class Test02_wrapper {

	public static void main(String[] args) {
		//Wrapper class 포장클래스. wrapper를 갖고있는 클래스를 칭한다.
		//->기본자료형을 참조형화 해 놓은 클래스들
		//->대부분 java.lang 패키지에 선언되어 있음
		/*
			기본형		참조형(클래스)
			boolean		Boolean
			byte		Byte
			short		Short
			int			Integer
			long		Long
			float		Float
			double		Double
			char		Character		
		*/
		//////////////////////////////////////////
		
		boolean boo1=true;
		Boolean boo2=new Boolean("false");//Deprecated 절판
		Boolean boo3=true;
		
		System.out.println(boo1);
		System.out.println(boo2);
		System.out.println(boo3);
		System.out.println(boo3.toString());//"true"
		////////////////////////////////////////////////////
		
		
		int in1=3;
		Integer in2=new Integer(5);
		Integer in3=7;
		
		System.out.println(in1);
		System.out.println(in2);
		System.out.println(in3);
		
		System.out.println(in2.toString());		//"5"
		System.out.println(in3.doubleValue());	//7.0
		
		System.out.println(Integer.toBinaryString(15));	//"1111"
		System.out.println(Integer.toOctalString(15));	//"17"
		System.out.println(Integer.toHexString(15));	//"f"
		
		System.out.println(Integer.sum(2,4));	//6
		System.out.println(Integer.max(2,4));	//4
		System.out.println(Integer.min(2,4));	//2
		
		//★★★
		System.out.println(Integer.parseInt("123"));//"123"-> 123 숫자로 변환
		
		//NumberFormatException 발생. 문자는 숫자로 바꿀수 없다
		//System.out.println(Integer.parseInt("Korea"));//
		/////////////////////////////////////////////////////////////////
		
		
		long lo1=3L;
		Long lo2=new Long(5); 
		Long lo3=7L;
		
		double dou1=2.4;
		Double dou2=new Double("3.5");
		Double dou3=6.7;
		
		//문)실수형값들 중에서 정수의 합을 구하시오
		int hap=(int)dou1+dou2.intValue()+dou3.intValue();
		//hap이 int이기에 hap에 넣을 것들을 먼저 int로 변환해줘야한다
		
		System.out.println(hap);//11
		/////////////////////////////////////////////////////////////////
		
		
		char ch1='R';
		Character ch3=new Character('a');
		Character ch2='m';
		
		System.out.println(ch1);
		System.out.println(ch2);
		System.out.println(ch3);
		
		System.out.println(Character.isWhitespace(' ')); //true
		System.out.println(Character.toLowerCase('R'));  //r
		System.out.println(Character.toUpperCase('a'));  //A
		
		
	}//main() end
}//class end
