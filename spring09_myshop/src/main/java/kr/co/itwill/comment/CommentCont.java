package kr.co.itwill.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/comment")
public class CommentCont {
	
	public CommentCont() {
		System.out.println("---------CommentCont() 객체 생성");
	}//end
	
	@Autowired
	CommentDAO commentdao;
	
	@RequestMapping("/insert")
	@ResponseBody
	public int mCommentServiceInsert(@RequestParam int product_code, @RequestParam String content) throws Exception{
		//System.out.println(product_code);
		//System.out.println(content);
		
		CommentDTO comment = new CommentDTO();
		comment.setProduct_code(product_code);
		comment.setContent(content);
		
		//로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 된다.
		//->session.getAttribute()
		//따로 폼을 구현하지 않았기 때문에 임시로 "test"
		comment.setWname("test");
		
		return commentdao.commentInsert(comment);
	}//mCommentServiceInsert() end
	
	
	@RequestMapping("/list")
	@ResponseBody
	public List<CommentDTO> mCommentServiceList(@RequestParam int product_code) throws Exception{
		return commentdao.commentlist(product_code);
	}//mCommentServiceList() end
	
	
	@RequestMapping("/delete/{cno}")
	@ResponseBody
	public int mCommentServiceDelete(@PathVariable int cno) throws Exception{
		return commentdao.commentDelete(cno);
	}//mCommentServiceDelete() end
	
	
	@RequestMapping("/update")
	@ResponseBody
	private int mCommentServiceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception{
		CommentDTO comment = new CommentDTO();
		comment.setCno(cno);
		comment.setContent(content);
		return commentdao.commentUpdate(comment);
	}//mCommentServiceUpdateProc() end
	
	
	
	
	
	
	
	
	
}//class end
