package jdbc0328;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.print.attribute.SetOfIntegerSyntax;

public class Test04_selectJoin {

	public static void main(String[] args) {
		//문제) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
		/*
			g1001		d001		HTML
			g1001		p001		JAVA
			g1001		p002		Oracle
			g1001		p003		JSP
			g1001		p004		Python
			g1001		p005		AJAX
		 */
		String hakno="g1001";

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
			sql.append(" SELECT su.hakno, su.gcode, gw.gname");
			sql.append(" FROM tb_sugang SU join tb_gwamok GW");
			sql.append(" ON su.gcode=gw.gcode");
			sql.append(" WHERE su.hakno=?");
			sql.append(" ORDER BY su.gcode");		
			
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, hakno);

			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("자료 있음");
				do {
					System.out.print(rs.getString("hakno")+" ");
					System.out.print(rs.getString("gcode")+" ");
					System.out.print(rs.getString("gname")+" ");
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
