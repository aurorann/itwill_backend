package net.mem;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemMainTest {

	public static void main(String[] args) {
		// MyBatis Framework 기반 JDBC 연습
		
		try {
			//factory 공장
			//->어떤 특정 정보를 주면 객체로 생성해 줌
			//->객체 생성 : new연산자(POJO방식), Bean
			
			//1) DB연결 환경 설정 파일 가져오기
			String resource="config/jdbc.xml";
			InputStream is = Resources.getResourceAsStream(resource);
			
			//2) DB연결하기 위한 팩토리빈(factory bean) 생성
			//	 DBOpen + DAO
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(is);
			System.out.println("-----------DB 연결 성공");
			
			//3) 쿼리문 생성 및 변환
			//	->PreparedStatement와 비슷한 기능
			SqlSession sql = ssf.openSession(true);
			/////////////////////////////////////////////////////////////////
			
			//4)쿼리문 실행
			
			//1. 행추가
			//int cnt = sql.insert("mem.insertRow", new MemDTO("대한민국", 32));
			//System.out.println("행추가 결과 : " + cnt);
			
			
			//3. 행수정
			//-> num=5번 행의 이름과 나이를 수정하기
			//int result = sql.update("mem.updateRow", new MemDTO(5, "코리아", 30));
			//System.out.println("행수정 결과 : " + result);
			
			
			//4. 행삭제
			//-> 나이가 40이상 행 삭제
			//int result = sql.delete("mem.deleteRow", 40);
			//System.out.println("행삭제 결과 : " + result);
			
			//2. 전체목록
			/*
			List<MemDTO> list = sql.selectList("mem.selectAll");
			for(int i=0; i<list.size(); i++) {
				MemDTO dto = list.get(i);
				System.out.print(dto.getNum() + " ");
				System.out.print(dto.getName() + " ");
				System.out.print(dto.getAge() + " ");
				System.out.println();
			}//for end
			*/
			
			
			//5. 검색
			//	->이름에 '리' 글자 있는 행을 조회
			/*
			List<MemDTO> list = sql.selectList("mem.search", "리");
			for(int i=0; i<list.size(); i++) {
				MemDTO dto = list.get(i);
				System.out.print(dto.getNum() + " ");
				System.out.print(dto.getName() + " ");
				System.out.print(dto.getAge() + " ");
				System.out.println();
			}//for end
			*/
			
			//6. 상세보기
			//	->num=5행 상세보기
			MemDTO dto = sql.selectOne("mem.selectRead", 5);
			System.out.print(dto.getNum() + " ");
			System.out.print(dto.getName() + " ");
			System.out.print(dto.getAge() + " ");
			System.out.println();
			
			
			//7. 전체 행 갯수
			System.out.println("전체 행 갯수 : " + sql.selectOne("mem.rowCount"));

		} catch (Exception e) {
			System.out.println("실패 : " + e);
		}//end

	}//main() end

}//class end
