package kr.co.mymelon.mediagroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MediagroupCont {
	
	@Autowired
	private MediagroupDAO dao;//다시 생성하지 않아도 Autowired를 통해서 스프링부트가 자동으로 생성해준 객체를 불러올수 있다.
	
	public MediagroupCont() {
		System.out.println("-----------MediagroupCont() 객체 생성");
	}//end
	
	
	//미디어그룹 쓰기 페이지 호출
	//http://localhost:9095/mediagroup/create.do
	@RequestMapping(value = "mediagroup/create.do", method= RequestMethod.GET)
	public String createForm() {
		return "mediagroup/createForm"; //  /WEB-INF/views/mediagroup/createForm.jsp
	}//createForm() end
	
	
	@RequestMapping(value = "mediagroup/create.do", method= RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute MediagroupDTO dto) {
		ModelAndView mav=new ModelAndView();
		
		int cnt=dao.create(dto);
		if(cnt==0) {
			mav.setViewName("mediagroup/msgView");
			String msg1 = "<p>미디어 그룹 등록 실패</p>";
			String img = "<img src='../images/bearggu9.gif'>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='그룹목록' onclick='location.href=\"list.do\"'>";
			
			mav.addObject("msg1", msg1);
			mav.addObject("img", img);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
			
		}else {
			mav.setViewName("redirect:/mediagroup/list.do");
		}//if end
		return mav;
	}//createProc() end
	
	
	@RequestMapping("mediagroup/list.do")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mediagroup/list");
		
		List<MediagroupDTO> list=dao.list();
		int totalRowCount=dao.totalRowCount();
		
		mav.addObject("list", list);
		mav.addObject("count", totalRowCount);
		
		return mav;
	}//list() end
	
	
	@RequestMapping(value = "mediagroup/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteProc(int mediagroupno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mediagroup/deleteForm");
		mav.addObject("mediagroupno", mediagroupno);
	
		return mav;
	}//deleteForm() end
	
	
	@RequestMapping(value = "mediagroup/delete.do", method = RequestMethod.POST)
	public ModelAndView deleteForm(int mediagroupno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mediagroup/deleteForm");
		mav.addObject("mediagroupno", mediagroupno);
		
		int cnt=dao.delete(mediagroupno);
		if(cnt==0) {
			mav.setViewName("mediagroup/msgView");
			String msg1 = "<p>미디어 그룹 삭제 실패</p>";
			String img = "<img src='../images/bearggu9.gif'>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='그룹목록' onclick='location.href=\"list.do\"'>";
			
			mav.addObject("msg1", msg1);
			mav.addObject("img", img);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
			
		}else {
			mav.setViewName("redirect:/mediagroup/list.do");
		}//if end	
		
		
		return mav;
	}//deleteForm() end
	
	
	
	
	
	
	
	

}//class end
