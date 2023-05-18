package kr.co.itwill.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {
	
	public CommentDAO() {
		System.out.println("---------CommentDAO() 객체 생성");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public int commentInsert(CommentDTO comment) {
		return sqlSession.insert("comment.insert", comment);
	}//insert() end
	
	
	public List<CommentDTO> commentlist(int product_code){
		return sqlSession.selectList("comment.list", product_code);
	}//commentlist() end

}//class end
