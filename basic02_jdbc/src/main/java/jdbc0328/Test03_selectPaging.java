package jdbc0328;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.print.attribute.SetOfIntegerSyntax;

public class Test03_selectPaging {

	public static void main(String[] args) {
		//페이징
		//문제) sungjuk테이블에서 이름순으로 정렬후 행번호 4~6만 조회하시오
		int start=7;
		int end=9;

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;	//select문을 실행한 결과(테이블)를 저장
		
		try {
			
			String url 		= "jdbc:oracle:thin:@localhost:1521:xe";
			String user 	= "system";
			String password = "1234";
			String driver 	= "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			System.out.println("오라클DB 서버 연결 성공");
			
			
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT *");	
			sql.append(" FROM(SELECT sno, uname, aver, addr, rownum as rnum");
			sql.append(" FROM(SELECT sno, uname, aver, addr");
			sql.append(" FROM SUNGJUK");
			sql.append(" ORDER BY UNAME))");
			sql.append(" WHERE rnum>=? and rnum<=?");
			//String where=" WHERE rnum >= " + start +" AND rnum <= " + end;
			//sql.append(where);
			
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("자료 있음");
				do {
					System.out.print(rs.getInt("rnum")+" ");
					System.out.print(rs.getInt("sno")+" ");
					System.out.print(rs.getString("uname")+" ");
					System.out.print(rs.getInt("aver")+" ");
					System.out.print(rs.getString("addr")+" ");
					System.out.println();
				} while (rs.next());
			}else {
				System.out.println("자료 없음");
			}//if end	
	
			
		} catch (Exception e) {
			System.out.println("오라클DB 연결 실패"+e);
		} finally{//자원반납(순서주의)
			
			try {
				if(rs!=null) {rs.close();}
			} catch (Exception e) {}
			
			try {
				if(pstmt!=null) {pstmt.close();}
			} catch (Exception e) {}
			
			try {
				if(con!=null) {con.close();}
			} catch (Exception e) {}			
		}//end		


	}//main() end
}//class end
