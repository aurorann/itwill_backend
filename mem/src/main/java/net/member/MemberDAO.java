package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.MyAuthenticator;

public class MemberDAO {
	
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public MemberDAO() {
		dbopen=new DBOpen();
	}//end
	
	public String loginProc(MemberDTO dto) {
		String mlevel=null;
		
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT mlevel ");		
			sql.append(" FROM member ");		
			sql.append(" WHERE mid=? AND passwd=? ");		
			sql.append(" AND mlevel IN ('A1', 'B1') ");		
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getPasswd());
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				mlevel=rs.getString("mlevel");
			}//if end			
			
		} catch (Exception e) {
			System.out.println("조회 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//end		
		return mlevel;		
	}//loginProc() end
	
	
	public int duplecateID(String mid) {
		int cnt=0;
		
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT count(mid) as count ");		
			sql.append(" FROM member ");		
			sql.append(" WHERE mid=? ");		
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, mid);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("count");
			}//if end			
			
		} catch (Exception e) {
			System.out.println("조회 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//end		
		return cnt;		
	}//
	
	
	
	public int duplecateEmail(String email) {
		int cnt=0;
		
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT count(email) as count ");		
			sql.append(" FROM member ");		
			sql.append(" WHERE email=? ");		
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("count");
			}//if end			
			
		} catch (Exception e) {
			System.out.println("로그인 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//end		
		return cnt;		
	}//
	
	
	public int memcreate(MemberDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();//오라클 데이터베이스 연결
			
			sql=new StringBuilder();
			sql.append(" INSERT INTO member(mid, passwd, mname, jomin1, jomin2, email, tel) ");
			sql.append(" VALUES (?,?,?,?,?,?,?) ");		
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setInt(4, dto.getJomin1());
			pstmt.setInt(5, dto.getJomin1());
			pstmt.setString(6, dto.getEmail());                                                                                          
			pstmt.setString(7, dto.getTel());	
			
			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("회원가입 실패 : "+e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//memcreate() end
	
	
	public boolean findID(MemberDTO dto) {
		boolean flag=false;
		try {
			con=dbopen.getConnection();//오라클 데이터베이스 연결
			
			sql=new StringBuilder();
			sql.append(" SELECT mid ");		
			sql.append(" FROM member ");		
			sql.append(" WHERE mname=? and email=? ");	
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMname());
			pstmt.setString(2, dto.getEmail());
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				//1) 아이디 가져오기
				String mid=rs.getString("mid");
				
				//[임시 비밀번호 발급]
				//대문자, 소문자, 숫자를 이용해서 랜덤하게 10글자 만들기
				String[] ch = {
						"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
						"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
						"N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
						"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
						"n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
				};//ch[0]~ch[61]
				
				//ch배열에 랜덤하게 10글자 뽑아서 가져오기
				//2) 임시비밀번호 만들기
				StringBuilder imsiPW=new StringBuilder();
				for(int i=0; i<10; i++) {
					int num=(int)(Math.random()*ch.length);
					imsiPW.append(ch[num]);
				}//for end
				
				//임시비밀번호를 테이블에 수정 및 저장하기
				sql=new StringBuilder();//sql을 다시 사용하기 위해 새로이 메모리 할당
				sql.append(" UPDATE member");
				sql.append(" SET passwd=? ");
				sql.append(" WHERE mname=? AND email=?");
				
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setString(1, imsiPW.toString());//임시비밀번호			
				pstmt.setString(2, dto.getMname());
				pstmt.setString(3, dto.getEmail());
				
				int cnt=pstmt.executeUpdate();
				if(cnt==1) {//임시 비밀번호로 member 테이블에 수정되었다면
				//3) 아이디(id)와 임시비밀번호(imsiPW)를 메일로 보내기
					String content ="임시 비밀번호로 로그인 후, 회원 정보 수정에서 비밀번호를 변경하시길 바랍니다.";			
					content += "<br>";
					content += "고객님의 아이디는 <strong>"+mid+"</strong> 이며";
					content += "<br>";
					content += "임시비밀번호는 <strong>"+imsiPW.toString()+"</strong>입니다.";	
					
					//메일서버(POP3/SMTP) 지정하기
					String mailServer="mw-002.cafe24.com"; //cafe24 메일서버
					Properties props=new Properties();
					props.put("mail.smtp.host",mailServer);
					props.put("mail.smtp.auth", true);
					
					//메일서버에서 인증받은 계정+비번
					Authenticator myAuth=new MyAuthenticator();//다형성
					//메일 서버와 계정+비번 유효한지 검증
					Session sess=Session.getInstance(props, myAuth);					
					
					InternetAddress[] address = {new InternetAddress(dto.getEmail())};//받는 사람 이메일 주소
					Message msg = new MimeMessage(sess);						//메일 관련 정보 작성
					msg.setRecipients(Message.RecipientType.TO, address);		//받는 사람
					msg.setFrom(new InternetAddress("aurorannn@gmail.com"));	//보내는 사람
					msg.setSubject("Myweb 임시비밀번호 발급");						//메일 제목
					msg.setContent(content, "text/html; charset=UTF-8");		//메일 내용
					msg.setSentDate(new Date());								//메일 보낸 날짜
					Transport.send(msg);										//메일 전송
					
					flag=true;//최종적으로 성공
					
				}//if end			
				
			}else{
				flag=false;//else는 안써도 상관없다
			}//if end			
			
		} catch (Exception e) {
			System.out.println("아이디찾기 실패 : "+e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return flag;
	}//findID() end
	
	
	
	public MemberDTO read(String mid) {
		MemberDTO dto=null;
		
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT mid, passwd, mname, jomin1, jomin2, email, tel, mlevel, mdate ");		
			sql.append(" FROM member ");		
			sql.append(" WHERE mid=? ");		
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, mid);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new MemberDTO();
				dto.setMid(rs.getString("mid"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setMname(rs.getString("mname"));
				dto.setJomin1(rs.getInt("jomin1"));
				dto.setJomin2(rs.getInt("jomin2"));
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				dto.setMlevel(rs.getString("mlevel"));
				dto.setMdate(rs.getString("mdate"));
				
			}//if end			
			
		} catch (Exception e) {
			System.out.println("회원정보보기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//end		
		return dto;	
	}//read() end
	
	
	
	
	
	

}//class end
