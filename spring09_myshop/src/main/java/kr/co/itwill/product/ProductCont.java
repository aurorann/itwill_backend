package kr.co.itwill.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ProductCont {
	
	public ProductCont() {
		System.out.println("---------ProductCont() 객체 생성");
	}//class end
	
	@Autowired
	ProductDAO productDAO;

}//class end
