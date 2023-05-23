package kr.co.itwill.cart;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.comment.CommentDTO;

@Controller
@RequestMapping("/cart")
public class CartCont {

	public CartCont() {
		System.out.println("--------CartCont() 객체생성됨");
	}//end
	
	
	@Autowired
	CartDAO cartDao;
	
	
	@RequestMapping("/insert")
	public ModelAndView cartInsert(@ModelAttribute CartDTO dto, HttpSession session) throws Exception{

		//로그인 기능을 구현했다면 session.getAttribute() 활용
		//dto.setId(session.getAttribute("s_id"));
		dto.setId("test");//여기서는 임시로 "test"
		
		//System.out.println(dto.toString());
		
		ModelAndView mav = new ModelAndView();
		cartDao.cartInsert(dto);
		mav.setViewName("cart/list");//장바구니 목록 페이지 호출
		mav.addObject("list", cartDao.cartList(dto.getId()));

		return mav;
	}//cartInsert() end
	
	
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session) {
		//로그인 했다면
		//String s_id=session.getAttribute("s_id")
		String s_id="test";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cart/list");//  /WEB-INF/views/cart/list.jsp
		mav.addObject("list", cartDao.cartList(s_id));
		
		return mav;
	}//list() end
	
	
	@RequestMapping("/delete")
	public String delete(int cartno, HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("cartno", cartno);
		map.put("s_id", "test");
		//map.put("s_id", session.getAttribute("s_id"));		
		cartDao.cartDelete(map);
		
		return "redirect:/cart/list";
		
	}//delete() end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class end
