package kr.co.mymelon.mediagroup;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

//@Service
//@Repository 모델클래스로 지정, 스프링컨테이너(톰캣)가 자동으로 객체 생성해 준다.
@Repository
public class MediagroupDAO {
	
	//DBOpen dbopen=new DBOpen()과 동일한 형태
	//@Autowired 스프링컨테이너가 생성해 준 객체를 연결 
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql=null;
	
	public MediagroupDAO() {
		System.out.println("-----------MediagroupDAO() 객체 생성");
	}//end
	
	
	//비지니스 로직 구현
	
	public int create(MediagroupDTO dto) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO mediagroup(mediagroupno, title) ");
			sql.append(" VALUES( mediagroup_seq.nextval, ? ) ");
			
			cnt = jt.update(sql.toString(), dto.getTitle());
			
		} catch (Exception e) {
			System.out.println("미디어그룹 등록 실패 : "+e);
		}//end
		return cnt;
	}//create() end
	
	
	public List<MediagroupDTO> list(){
		List<MediagroupDTO> list=null;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT mediagroupno, title ");
			sql.append(" FROM mediagroup ");
			sql.append(" ORDER BY mediagroupno DESC ");
			
			RowMapper<MediagroupDTO> rowMapper=new RowMapper<MediagroupDTO>() {
				@Override
				public MediagroupDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MediagroupDTO dto=new MediagroupDTO();
					dto.setMediagroupno(rs.getInt("mediagroupno"));
					dto.setTitle(rs.getString("title"));
					return dto;
				}//mapRow()end
			};//rowMapper
			
			list=jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("미디어그룹 목록 보기 실패 : "+e);
		}
		return list;
	}//list() end
	
	
	public int totalRowCount() {
		int cnt=0;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) FROM mediagroup ");
			cnt=jt.queryForObject(sql.toString(), Integer.class);//count가 갖고있는 자료형의 class를 넣는다.
			
		} catch (Exception e) {
			System.out.println("전체 목록 갯수 조회 실패 : "+e);
		}
		return cnt;
	}//totalRowCount() end
	
	
	public int delete(int mediagroupno) {
		int cnt=0;
		try {
			sql = new StringBuilder();  
			sql.append(" DELETE FROM mediagroup ");
			sql.append(" WHERE mediagroupno=? ");
			cnt=jt.update(sql.toString(), mediagroupno);
			
		} catch (Exception e) {
			System.out.println("미디어 그룹 삭제 실패 : "+e);
		}
		return cnt;
	}//delete() end
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}//class end
