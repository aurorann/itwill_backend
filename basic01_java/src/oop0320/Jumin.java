package oop0320;

import java.util.Calendar;
import java.util.GregorianCalendar;

class Jumin {
	
	private String Juminno; //주민번호
	
	public Jumin() {}
	public Jumin(String juminno) {
		this.Juminno=juminno;
	}//end
	
	
	public boolean validate() {
		boolean flag=false;
		
		//문)주민번호가 맞으면 flag변수값을 true 대입하시오
		Integer[] CHECKNUM= {2,3,4,5,6,7,8,9,2,3,4,5};
		Integer[] save=new Integer[12];
		int hap=0;
		int size=save.length;
		
		for(int i=0; i<size; i++) {
			//주민번호에서 한글자씩 가져와서 정수형 변환
			int num=Integer.parseInt(Juminno.substring(i, i+1));
			save[i]=num*CHECKNUM[i];//8*2
			hap=hap+save[i];
		}//for end
		
		int M=(11-(hap%11))%10;
		if(M==Integer.parseInt(Juminno.substring(12))) {flag=true;}//if end

		
		
		/*
		경은코드
		int[] magic= {2,3,4,5,6,7,8,9,2,3,4,5};

		int temp=0;
		for(int i=0; i<magic.length; i++) {
			char ch=Juminno.charAt(i);			
			temp=temp+(Character.getNumericValue(ch)*magic[i]);				
			//temp+=(Juminno.charAt(i)-'0')*magic[i];		
		}
		
		int result = (11-(temp%11))%10;
		
		int size=Juminno.length();
		char last=Juminno.charAt(size-1);
		if(result==Character.getNumericValue(last)) {flag=true;}//if end		
		*/
		
		return flag;
		
	}//validate() end
	
	
	public void disp() {
		//문) 생년월일, 성별, 나이, 띠 출력
		/*
			생년월일	: 1989년 12월 30일
			성별		: 남자
			나이		: 34살 -> GregorianCalendar클래스 이용
			2023-1989
			띠		: 뱀 -> 태어난년도%12 (0원숭이, 1닭, 2개 ~~11양)
		 */
		
		GregorianCalendar now=new GregorianCalendar();		
		int cYear=now.get(Calendar.YEAR);
		
		//성별코드 "1"->1
		int myCode=Integer.parseInt(Juminno.substring(6,7));
		
		int myYear=0, myMonth=0, myDate=0;
		myYear=Integer.parseInt(Juminno.substring(0,2));	//89 태어난 년도
		myMonth=Integer.parseInt(Juminno.substring(2,4));	//12 태어난 월
		myDate=Integer.parseInt(Juminno.substring(4,6));	//30 태어난 일
		
		switch(myCode) {
		case 1 :
		case 2 : myYear=1900+myYear; break;
		case 3 :
		case 4 : myYear=2000+myYear; break;		
		}//switch end
		
		//나이 구하기
		int myAge=cYear-myYear;
		
		String gender="";
		switch(myCode%2) {
		case 0 : gender="여자"; break;
		case 1 : gender="남자"; break;
		}//switch end
		
		//동물 띠 구하기
		String[] animal= {"원숭이","닭","개","돼지","쥐","소","호랑이","토끼","용","뱀","말","양"};
		
		System.out.println("주민번호 : "+Juminno);
		System.out.println("생년월일 : "+myYear+"년"+myMonth+"월"+myDate+"일");
		System.out.println("나이 : "+myAge);
		System.out.println("성별 : "+gender);
		System.out.println("띠 : "+animal[myYear%12]);
		
		//살아온 날수(네이버 날짜계산기 참조)
		
		
		
		
		
		/*
		경은코드
		String year=Juminno.substring(0,2);//년도
		String month=Juminno.substring(2,4);//월
		String day=Juminno.substring(4,6);//일
		
		System.out.println("생년월일 : "+19+year+"년 "+month+"월 "+day+"일");		
	
		if(Juminno.charAt(6)=='1' || Juminno.charAt(6)=='3' ) {
			System.out.println("성별 : 남자");
		}else if(Juminno.charAt(6)=='2' || Juminno.charAt(6)=='4' ){
			System.out.println("성별 : 여자");
		}else{
			System.out.println("성별 : 잘못입력하셨습니다");
		}//if end
		
		
		GregorianCalendar now=new GregorianCalendar();		
		//System.out.println(now.get(Calendar.YEAR));
		int old=now.get(Calendar.YEAR)-(1900+(Integer.parseUnsignedInt(year)));
		System.out.println("나이 : "+old+"살");
		
		 //int idno = Integer.parseInt(Juminno); Juminno 문자배열을 숫자로 변환...안될까
		
		
		switch((1900+(Integer.parseUnsignedInt(year)))%12) {
		case 0 : System.out.println("원숭이띠"); break;
		case 1 : System.out.println("닭띠"); break;
		case 2 : System.out.println("개띠"); break;
		case 3 : System.out.println("돼지띠"); break;
		case 4 : System.out.println("쥐띠"); break;
		case 5 : System.out.println("소띠"); break;
		case 6 : System.out.println("호랑이띠"); break;
		case 7 : System.out.println("토끼띠"); break;
		case 8 : System.out.println("용띠"); break;
		case 9 : System.out.println("뱀띠"); break;
		case 10 : System.out.println("말띠"); break;
		case 11 : System.out.println("양띠"); break;
		}
		*/
	}//disp() end

}//class end
