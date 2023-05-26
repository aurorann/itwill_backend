package oop0323;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.StringTokenizer;

public class Test06_sungjuk {

	public static void main(String[] args) {
		//문제) 성적프로그램
		//성적 입력 자료(sungjuk.txt)을 가져와서, 성적 결과 파일 완성하기(result.txt)
		/*
			1) 입력 데이터 파일 : sungjuk.txt
			
			2) 결과 파일 : result.txt
		
								성 / 적 / 결 /과
              -------------------------------------------------------
              이름     국어   영어  수학   평균  등수   결과
              -------------------------------------------------------                       
              라일락    100  100  100   100   1    합격 ********** 장학생
              진달래     50   55   60    55   4    불합격 *****
              개나리     95   95   35    75   3    재시험 *******
			  무궁화     80   85   90    85   2    합격 ********
              홍길동     60   40   30    43   5    불합격 ****
              ------------------------------------------------------
		*/
		
		String inName="I:/java202301/sungjuk.txt";
		String outName="I:/java202301/result.txt";
		
		FileReader fr=null;
		BufferedReader br=null;
		
		FileWriter fw=null;
		PrintWriter out=null;
		
		try {
			
			//1단계) 데이터 저장 변수 선언
			String[] name=new String[5];
			int[] kor = new int[5];
			int[] eng = new int[5];
			int[] mat = new int[5];
			
			int[] aver = new int[5];
			int[] rank = {1,1,1,1,1};
			
			int size=name.length; //5
			int i=0;
			
			
			//2단계) 데이터 입력파일(sungjuk.txt) 가져와서 내용을 읽기
			fr=new FileReader(inName);
			br=new BufferedReader(fr);
			
			while(true) {
				String line=br.readLine();
				if(line==null) {
					break;
				}//if end
				System.out.println(line);
				
				//,를 기준으로 문자열 분리한 후 1단계에서 선언한 변수에 저장하기
				String[] word=line.split(",");
				name[i]=word[0].trim();
				kor[i]=Integer.parseInt(word[1].trim());
				eng[i]=Integer.parseInt(word[1].trim());
				mat[i]=Integer.parseInt(word[1].trim());
				i++;//다음사람				
			}//while end
			
			//3단계) 평균구하기
			
			
			
			
			//4단계) 등수구하기(평균을 기준으로)
			
			
			
			
			
			//5단계) result.txt 결과 출력하기
			fw=new FileWriter(outName, false);
			out=new PrintWriter(fw, true);
			
			out.println("성/적/결/과");
			out.println("---------------------------------------------------");
			out.println("이름		국어		영어		수학		평균		등수		결과");
			out.println("---------------------------------------------------");
			
			
			
			
			
		}catch (Exception e) {
			System.out.println("성적 프로그램 읽고, 쓰기 실패 : "+e);
		}finally {
			try {
				if(br!=null) {br.close();}
			} catch (Exception e) {}				
			try {
				if(fr!=null) {fr.close();}
			} catch (Exception e) {}
			try {
				if(out!=null) {out.close();}
			} catch (Exception e) {}
			try {
				if(fw!=null) {fw.close();}
			} catch (Exception e) {}
		}//end

		
		
		
		

	}//main() end
}//class end
