package kr.co.itwill.order;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	
	public OrderDAO() {
		System.out.println("---------OrderDAO() 객체 생성");
	}//end
	
	
	@Autowired
	SqlSession sqlSession;
	
	
	public String orderno(String date) {
		return sqlSession.selectOne("order.orderno", date);
	}//orderno() end
	
	
	public int totalamount(String s_id) {
		return sqlSession.selectOne("order.totalamount", s_id);
	}//totalamount() end
	
	
	public int orderlistInsert(OrderDTO dto) {
		return sqlSession.insert("order.orderListInsert", dto);
	}//orderlistInsert() end
	
	
	public int orderdetailInsert(HashMap<String, String> map) {
		return sqlSession.insert("order.orderdetailInsert", map);
	}//orderdetailInsert() end
	
	
	public int cartDelete(String s_id) {
		return sqlSession.delete("order.cartDelete", s_id);
	}//cartDelete() end
	
	
	public List<OrderDTO> OrderList(String s_id){
		return sqlSession.selectList("order.list", s_id);
	}//OrderList() end
	
	
	
	
	
	

}//class end
