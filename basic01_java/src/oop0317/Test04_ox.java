package oop0317;

public class Test04_ox {

	public static void main(String[] args) {
		//문제) 성적프로그램 OX 표시학
		//	   Jumsu클래스 생성후 실습합니다
		/*
			         ** 시험결과 **
			====================================
			번호  이름   1  2  3  4  5  점수  등수      
			------------------------------------    
			1   홍길동  O  X  O  O  O   80   2    
			2   무궁화  O  O  O  O  O  100   1
			3   라일락  X  X  X  X  O   20   5
			4   진달래  X  O  X  O  O   60   3
			5   봉선화  O  O  X  X  X   40   4
			------------------------------------ 
			
			- 맞은문제 O, 틀린문제 X표시
			- 점수: O당 20점씩
			- 등수: 점수를 기준으로 높은사람이 1등 
		 */
		
		//1) 1명을 대상으로 성적 구하기
		//Jumsu student=new Jumsu(1, "홍길동", 3, 4, 3, 3, 3);
		//student.compute();
		//student.disp();
		
		
		//2) 5명의 성적 구하기
		Jumsu[] student= {
				 new Jumsu(1, "홍길동", 3, 4, 3, 3, 3)
				,new Jumsu(2, "무궁화", 3, 3, 3, 3, 3)
				,new Jumsu(3, "라일락", 4, 4, 4, 4, 3)
				,new Jumsu(4, "진달래", 4, 3, 4, 3, 3)
				,new Jumsu(5, "봉선화", 3, 3, 4, 4, 4)
		};
		
		int size=student.length;
		
		//OX표시하고 점수 계산하기
		for(int i=0; i<size; i++) {			
			student[i].compute();
		}//for end
		
		//문제)student배열의 score를 기준으로 등수 구하기
		for(int a=0; a<size; a++) {
			for(int b=0; b<size; b++) {
				if(student[a].score<student[b].score) {
					student[a].rank++;
				}//if end
			}//for end
		}//for end	
		
		
		//출력하기
		for(int i=0; i<size; i++) {			
			student[i].disp();
		}		
			
		
		/*
		경은코드
		for(int i=0; i<size; i++) {
			if(student[i].score < student[i+1].score) {
				student[i].rank++;
				}else {
				}//if end
		}//for end
		*/
		

	}//main() end
}//class end
