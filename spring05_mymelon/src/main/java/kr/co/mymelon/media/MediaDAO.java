package kr.co.mymelon.media;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.mymelon.mediagroup.MediagroupDTO;

@Repository
public class MediaDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql=null;
	
	public MediaDAO() {
		System.out.println("-----------MediaDAO() 객체 생성");
	}//end
	
	public List<MediaDTO> list(int mediagroupno){
		List<MediaDTO> list=null;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT mediano, title, poster, filename, filesize, mview, rdate, mediagroupno ");
			sql.append(" FROM media ");
			sql.append(" WHERE mview='Y' and mediagroupno=" + mediagroupno);
			sql.append(" ORDER BY mediano DESC ");
			
			RowMapper<MediaDTO> rowMapper=new RowMapper<MediaDTO>() {
				@Override
				public MediaDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MediaDTO dto=new MediaDTO();
					dto.setMediano(rs.getInt("mediano"));
					dto.setTitle(rs.getString("title"));
					dto.setRdate(rs.getString("rdate"));
					dto.setPoster(rs.getString("poster"));
					dto.setFilename(rs.getString("filename"));
					dto.setFilesize(rs.getLong("filexize"));
					dto.setMview(rs.getString("mview"));
					dto.setMediagroupno(rs.getInt("mediagroupno"));
					return dto;
				}//mapRow()end
			};//rowMapper
			
			list=jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("미디어 목록 보기 실패 : "+e);
		}
		return list;
	}//list() end

}//class end
