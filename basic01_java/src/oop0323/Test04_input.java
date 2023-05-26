package oop0323;

import java.io.BufferedReader;
import java.io.FileReader;

public class Test04_input {

	public static void main(String[] args) {
		//3) 메모장 파일의 내용을 엔터 단위로 가져오기
		
		String filename="I:/java202301/workspace/java_class/basic01_java/src/oop0322/Buyer.java";

		FileReader fr=null;
		BufferedReader br=null;
		
		try {
			
			//1) 파일 가져오기(읽기모드)
			fr=new FileReader(filename);
			
			//2) 엔터단위로 끊어서 읽기 위해 BufferedReader에 옮겨담기
			br=new BufferedReader(fr);
			
			int num=0; //행번호
			
			while(true) {
				String line=br.readLine();//4)엔터(\n)를 기준으로 한줄씩 가져오기
				if(line==null) {//파일의 끝인지? (EOF)
					break;		//무한 루프 빠져나감
				}//if end
				System.out.printf("%d %s\n", ++num, line);
				
				//20행마다 밑줄 긋기
				if(num%20==0) {
					System.out.println("------------------------------");
				}
				
				
				
			}//while end
			
		}catch (Exception e) {
			System.out.println("파일 읽기 실패 : "+e);
		}finally {
			//자원반납 순서 주의
			try {
				if(br!=null) {br.close();}
			}catch (Exception e) {}
			try {
				if(fr!=null) {fr.close();}
			}catch (Exception e) {}
		}//end
		

	}//main() end
}//class end
