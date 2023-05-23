package kr.co.itwill.order;

import java.text.SimpleDateFormat;
import java.util.Date;

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
		//오늘날짜 및 현재 시각을 문자열 "년월일시분초"로 구성해서 변환하기
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sd.format(new Date());
		System.out.println(date);
		
		/*
			주문서 번호 생성 알고리즘
			예)  최초주문 202305231717281
				있으면  202305231717282
		
		
		
		*/
		
		String orderno=orderDao.orderno("20230523175646");
		if (orderno.equals("1")) {
			orderno="20230523175646"+1;
		}else{
			int n=Integer.parseInt(orderno=orderno.substring(14))+1;
			orderno="20230523175646"+n;
		}//if end
		
		System.out.println(orderno);
		
		return null;
	}//orderInsert() end
	
	
}//class end
