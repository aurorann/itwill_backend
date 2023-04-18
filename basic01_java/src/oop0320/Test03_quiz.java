package oop0320;



public class Test03_quiz {

	public static void main(String[] args) {
		//연습문제

		//문1)주민번호의 각 숫자의 합을 구하시오(Character클래스와 charAt()함수 이용)
		//		8+9+1+2+3+0+1+2+3+4+5+6+7
		String jumin="8912301234567";
		
		int sum=0;
		for(int i=0; i<jumin.length(); i++) {
			char ch= jumin.charAt(i);//'8'
			//'8' -> 8
			sum=sum+Character.getNumericValue(ch);
		}//for end
		
		System.out.println(sum);
			
		
		
		/*
		경은코드		
		//charAt()함수 사용
		int num=0;
		
		for(int i=0; i<jumin.length(); i++) {
			num += (jumin.charAt(i)-'0');// num=num+(jumin.charAt(i)-'0')
		}
		
		System.out.println(num);		
		 */
		
		
		//문2)대소문자를 서로 바꿔서 출력하시오(Character클래스와 charAt()함수 이용)
		//	gONE wITH tHE wIND
		String str="Gone With The Wind";
		for(int i=0; i<str.length(); i++) {
			char ch=str.charAt(i);
			if(Character.isUpperCase(ch)) {
				System.out.print(Character.toLowerCase(ch));
			}else if(Character.isLowerCase(ch)) {
				System.out.print(Character.toUpperCase(ch));
			}else {
				System.out.print(ch);
			}//if end
		}//for end
		
		
		/*
		경은코드		
		//Character의 메서드 활용하기
		String result2 = "";
		
		for(char c : str.toCharArray()){
		 if(Character.isUpperCase(c)){//대문자
		   result2 += Character.toLowerCase(c);
		 }else if(Character.isLowerCase(c)){//소문자
		  result2 += Character.toUpperCase(c);
		 }else{
		  result2 += c;
		 }
		}

		System.out.println(result2);
		
		
		//charAt()함수 사용
		String result = "";  
		for(int i=0;i<str.length();i++){
		 char c = str.charAt(i);
		 if(c>=65 && c<=90){//대문자
		   result += String.valueOf(c).toLowerCase();
		 }else if(c>=97 && c<=122){//소문자
		   result += String.valueOf(c).toUpperCase();
		 }else{
		   result += c;
		  }
		 }
		
		System.out.println(result);
		 */
		
		
		
	}//main() end
}//class end
