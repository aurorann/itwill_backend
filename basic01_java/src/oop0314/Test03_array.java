package oop0314;

public class Test03_array {

	public static void main(String[] args) {
		// 배열 Array
		// 연속성 자료형, 열거형
		// -> 1차원배열 : [열]
		// -> 2차월배열 : [행][열] (예: 아파트 한동)
		// -> 3차월배열 : [면][행][열] (예: 아파트 단지) 자바에서는 없음
		// -> new 연산자 : 메모리 할당(확보) 연산자
		//////////////////////////////////////////////////
		
		//1. 1차원 배열
		int[] kor=new int[3]; //(int)4byte*3 -> 12바이트 메모리 할당
		kor[0]=10; //배열에서는 인덱스 값으로 접근
		kor[1]=30;
		kor[2]=50;
		System.out.println(kor[0]);
		System.out.println(kor[1]);
		System.out.println(kor[2]);
		
		//ArrayIndexOutOfBoundsException 발생
		// System.out.println(kor[3]); kor의 3번째 요소는 존재하지 않음
		
		//kor배열 요소의 갯수
		System.out.println(kor.length);//3
		///////////////////////////////////////////////////////
		
		//메모리 할당 및 초기값 지정
		int[] eng= {20, 30, 40};
		for(int i=0; i<eng.length; i++) {
			System.out.println(eng[i]);
		}//for end
		
		
		double[] aver= {1.2, 3.4, 5.6};
		for(int i=0; i<aver.length; i++) {
			System.out.println(aver[i]);
		}//for end
		
		
		char[] ch= {'H','e', 'l', 'l', 'o'};
		for(int i=0; i<ch.length; i++) {
			System.out.println(ch[i]);
		}//for end
		
		
		String[] name= {"개나리", "진달래", "무궁화"};
		for(int i=0; i<name.length; i++) {
			System.out.println(name[i]);
		}//for end
		/////////////////////////////////////////////
		
		//2. 2차원 배열
		//-> [행][열]
		//-> 행, 줄, row
		
		//2행3열
		int[][] mat=new int[2][3];	//4바이트*6개 -> 24바이트 메모리 할당
		mat[0][0]=10;
		mat[0][1]=20;
		mat[0][2]=30;
		mat[1][0]=40;
		mat[1][1]=50;
		mat[1][2]=60;
		
		for(int r=0; r<=1; r++) {
			for(int c=0; c<=2; c++) {
				System.out.println(mat[r][c]);
			}//for end
		}//for end
		
		//ArrayIndexOutOfBoundsException 발생
		//mat의 4행 4열은 존재하지 않음
		//System.out.println(mat[4][4]);
		
		System.out.println(mat.length);		//2 mat배열의 행의 갯수
		System.out.println(mat[0].length);	//3 mat[0]행의 열의 갯수
		System.out.println(mat[1].length);	//3 mat[1]행의 열의 갯수
		////////////////////////////////////////////////////////
		
		//2차원 배열에서는 각행의 열의 갯수는 달라도 된다.
		int[][] music= {
				{10, 20}
			   ,{30, 40, 50, 60}
			   ,{70, 80, 90}
		};
		
		System.out.println(music.length);	//3 music배열의 행의 갯수
		System.out.println(music[0].length);//2 music[0]행의 열의 갯수
		System.out.println(music[1].length);//4 music[0]행의 열의 갯수
		System.out.println(music[2].length);//3 music[0]행의 열의 갯수
		
		int row=music.length; //3
		
		for (int r=0; r<row; r++) {
			int col=music[r].length;
			for(int c=0; c<col; c++) {
				System.out.print(music[r][c] +" ");
			}//for end
			System.out.println();
		}//for end
		
		
	}//main() end
}//class end
