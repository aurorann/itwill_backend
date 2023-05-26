package oop0316;

import java.util.StringTokenizer;

public class Test02_String {

	public static void main(String[] args) {
		//문자열 관련 클래스
		
		String str="HAPPY";
		String name=new String("HAPPY");
		
		if(str==name) {//참조변수의 주소를 비교했기때문에 다름으로 나옴
			System.out.println("같다");
		}else {
			System.out.println("다르다");
		}//if end
		
		
		//문자열의 내용을 비교하는 경우 == 연산자가 아닌 equals()함수를 이용 할 것
		if(str.equals(name)) {
			System.out.println("같다");
		}else {
			System.out.println("다르다");
		}//if end
		
		
		//문자열의 갯수가 0인지?
		if(str.isEmpty()) {
			System.out.println("빈문자열 이다");
		}else {
			System.out.println("빈문자열 아니다");
		}//if end
		
		
		//특정 문자를 기준으로 문자열 분리하기
		str=new String("Gone With The Wind");
		String[] word = str.split(" ");
		for(int i=0; i<word.length; i++) {
			System.out.println(word[i]);
		}//for end
		
		////////////////////////////////////////////////////////
		
		//문자열에서 공백문자를 기준으로 분리하기
		StringTokenizer st=new StringTokenizer(str, " ");
		while(st.hasMoreElements()) {//토큰할 문자가 있는지?
			System.out.println(st.nextToken());//토큰할 문자열 가져오기
		}//while end
		
		////////////////////////////////////////////////////////
		
		//문자열 연산 속도
		//String < StringBuffer < StringBuilder(제일 빠름)
		
		String s1="";
		System.out.println(s1.length());
		
		s1=s1+"ONE";
		System.out.println(s1.length());
		
		s1=s1+"TWO";
		System.out.println(s1.length());
		
		s1=s1+"THREE";
		System.out.println(s1.length());
		System.out.println(s1);
		
		//모든 문자열 지우기(빈 문자열 대입)
		s1="";
		System.out.println(s1.length());
		System.out.println("#"+s1+"#");
		////////////////////////////////////////////////////////
		
		
		StringBuilder s2=new StringBuilder();
		
		s2.append("SEOUL");//문자열 추가 함수
		System.out.println(s2.length()+s2.toString());
		
		s2.append("JEJU");
		System.out.println(s2.length()+s2.toString());
		
		s2.append("BUSAN");
		System.out.println(s2.length()+s2.toString());
		
		
		s2.delete(0, s2.length());//문자열 삭제 함수. 삭제를 원하는 문자열 길이를 넣으면 됨.
		System.out.println(s2.length());//0		
		
		
		//StringBuffer s3=null;
		//NullPointerException 발생
		//System.out.println(s3.length());
		
		
	}//main() end
}//class end
