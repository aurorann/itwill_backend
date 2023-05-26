package oop0313;

public class Test09_if {

	public static void main(String[] args) {
		// 조건문 관련 연습문제
		
		//if 조건문
		//문1)임의의 문자가 대문자, 소문자, 기타인지 구분해서 출력하시오
		char ch='R';
		if (ch>='a' && ch<='z'){
			System.out.printf("%c 소문자\n", ch);
		} else if(ch>='A' && ch<='Z') {
			System.out.printf("%c 대문자\n", ch);
		} else {
			System.out.printf("%c 기타\n", ch);
		}//if end	
		
		/*
		경은 코드
		if (ch>='a' && ch<='z'){
			System.out.println("소문자");
		} else if(ch>='A' && ch<='Z') {
			System.out.println("대문자");
		} else {System.out.println("기타");}
		*/
		
		
		//문2)대문자는 소문자로, 소문자는 대문자로 서로 바꿔서 출력하시오
		//	 나머지 기호는 그대로 출력
		if (ch>='A' && ch<='Z') {
			System.out.printf("%c\n", ch+32);
		} else if(ch>='a' && ch<='z') {
			System.out.printf("%c\n", ch-32);
		} else {
			System.out.printf("%c\n", ch);}	

		/*
		경은코드		
		int tmp = ch;		
		//System.out.println((char)tmp);

		if (tmp>=97) {
			System.out.println((char)(tmp-32));
		} else if(tmp<97) {
			System.out.println((char)(tmp+32));
		} else {
			System.out.println((char)tmp);}	
		*/	
		
		
		//switch~case 문
		//문3)평균점수에 따라서 A,B,C,D,F학점을 출력하시오
		int kor=100, eng=100, mat=100;
		
		int aver=(kor+eng+mat)/3;
		//System.out.println(aver);
		
		switch(aver/10) {
		case 10:
			System.out.println("A학점");
			break;
		case 9:
			System.out.println("B학점");
			break;
		case 8:
			System.out.println("C학점");
			break;
		case 7:
			System.out.println("D학점");
			break;
		default :
			System.out.println("F학점");
			break;
		}
		
		
		
		
		
		

	}//main() end
}//class end
