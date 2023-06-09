package oop0316;

public class Test03_quiz {

	public static void main(String[] args) {
		//String 관련 연습 문제
		
		//문1) 이메일 주소에 @문자 있으면
        //    @글자 기준으로 문자열을 분리해서 출력하고
        //    @문자 없다면 "이메일주소 틀림" 메세지를 출력하시오        
        /*    
              출력결과
              webmaster
              itwill.co.kr
        */
		
		String email=new String("webmaster@itwill.co.kr");
		
		if(email.indexOf("@")==-1) {//email에 가서 "@"가 없으면 -1를 반환한다.
			System.out.println("이메일 주소 틀림");
		}else {
			System.out.println("이메일 주소 맞음");
			
			int pos=email.indexOf("@");//email에서 "@"의 글자 위치 
			System.out.println(pos);//9
			
			//substring(), split(), StringTokenizer클래스 문자열 분리
			String id	  = email.substring(0, pos);//0,(9-1)
			String server = email.substring(pos+1);//10번째부터 마지막까지
			
			System.out.println(id);
			System.out.println(server);			
		}//if end
		
		
		/*
		경은 코드
		String[] word = email.split("@");
		for(int i=0; i<word.length; i++) {
			System.out.println(word[i]);
		}//for end
		*/
		
		///////////////////////////////////////////////
		
		
		//문2) 이미지 파일만 첨부(.png  .jpg  .gif)
		/*
			출력결과
			파일명 : sky2023.03.16
			확장명 : jpg		
		*/
		
		String path=new String("i:/frontend/images/sky2023.03.16.png");
		
		//path에서 마지막 "/" 기호의 순서값
		int lastSlash=path.lastIndexOf("/");
		System.out.println(lastSlash);//18
		
		//전체 파일명
		String file=path.substring(lastSlash+1);
		System.out.println("전체 파일명 : "+file);
		
		//file에서 마지막 "." 기호의 순서값
		int lastdot=file.lastIndexOf(".");
		System.out.println(lastdot);//13
		
		//파일명
		String filename=file.substring(0, lastdot);
		System.out.println("파일명 : "+filename);
		
		//확장명
		String ext=file.substring(lastdot+1);
		System.out.println("확장명 : "+ext);
		
		
		//확장명을 전부 소문자로 치환
		ext=ext.toLowerCase();
		if(ext.equals("png") || ext.equals("jpg") || ext.equals("gif")) {
			System.out.println("파일이 전송되었습니다");
		}else {
			System.out.println("이미지 파일이 아닙니다");
		}//if end		
		
		
		/*
		경은 코드
		System.out.println(path.length());
		System.out.println(path);
		System.out.println(path.substring(18, path.length()));		
		System.out.println("파일명 : "+path.substring(18, path.length()-4));
		System.out.println("확장명 : "+path.substring(path.length()-3, path.length()));
		*/
		

	}//main() end
}//class end
