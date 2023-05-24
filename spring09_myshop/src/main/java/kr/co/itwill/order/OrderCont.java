package kr.co.itwill.order;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/order")
public class OrderCont {

	public OrderCont() {
		System.out.println("---------OrderCont() 객체 생성");
	}//end
	
	
	@Autowired
	OrderDAO orderDao;
	
	
	@RequestMapping("/orderform")
	public String orderForm() {
		return "/order/orderForm";
	}//orderForm() end
	
	
	@RequestMapping("/insert")
	public ModelAndView orderInsert(@ModelAttribute OrderDTO dto, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		//1) 주문서번호 생성하기
		/*
		주문서 번호 생성 알고리즘
		예)  최초주문 202305231717281
			있으면  202305231717282
		 */
		
		
		//오늘날짜 및 현재 시각을 문자열 "년월일시분초"로 구성해서 변환하기
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sd.format(new Date());
		//System.out.println(date);
		
		String orderno=orderDao.orderno(date);
		if (orderno.equals("1")) {
			orderno = date + 1;
		}else{
			int n = Integer.parseInt(orderno.substring(14))+1;
			orderno = date + n;
		}//if end
		
		//System.out.println(orderno);
		
		//String s_id=session.getAttribute("s_id");//실제 구현시(로그인되어있을때)
		String s_id="test";//임시 세션 아이디
		
		
		//2)총결제금액 구하기
		int totalamount=orderDao.totalamount(s_id);
		//System.out.println(totalamount);
		
		
		//3)dto에 주문서번호, 총결제금액, 세션아이디 추가로 담기
		dto.setOrderno(orderno);
		dto.setTotalamount(totalamount);
		dto.setId(s_id);
		
		
		//4)orderlist테이블에 행 추가하기
		int cnt=orderDao.orderlistInsert(dto);
		//System.out.println("orderlist테이블에 행 추가 결과 : " + cnt);
		if (cnt==1) {
			
			//5)cart테이블에 있는 주문상품을 orderdetail테이블 옮겨 담기
			HashMap<String, String> map = new HashMap<>();
			map.put("orderno", orderno);
			map.put("s_id", s_id);
			
			int result=orderDao.orderdetailInsert(map);
			System.out.println("orderdetail 테이블에 행 추가 결과 : " + result);
			
			if (result!=0) {
				//6)cart테이블 비우기
				orderDao.cartDelete(s_id);
			}//if end
			
			//7)주문내역서 메일 보내기
			
			mav.addObject("msg", "주문이 완료되었습니다.");
			mav.setViewName("/order/msgView");// /WEB-INF/views/order/msgView.jsp

		}//if end

		return mav;
	}//orderInsert() end
	
	
	@RequestMapping("/list")
	public ModelAndView list() {
		String s_id="test";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/list");
		mav.addObject("list", orderDao.OrderList(s_id));
		return mav;
	}//list() end
	
	
	
	
	
}//class end
