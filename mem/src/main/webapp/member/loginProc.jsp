<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="auth.jsp" %>
<%@ include file="ssi.jsp" %>
    
<!-- 본문 시작 loginProc.jsp-->

<h3>L O G I N 결 과</h3>
<% 
	String mid = request.getParameter("mid").trim();
	String passwd = request.getParameter("passwd").trim();
	
	dto.setMid(mid);
	dto.setPasswd(passwd);
	
	String mlevel=dao.loginProc(dto);
	if(mlevel==null){
		out.println("<p>아이디/비밀번호를 다시 한번 확인해주세요</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		//out.println("로그인 되었습니다.<br>");
		//out.println("회원등급 : " + mlevel);
		
		//다른 페이지에서도 로그인 상태 정보를 공유할 수 있도록
		session.setAttribute("s_mid", mid);
		session.setAttribute("s_passwd", passwd);
		session.setAttribute("s_mlevel", mlevel);
		
		//쿠키시작///////////////////////////////////////////////////////////////////////


		//<input type="checkbox" name="c_id" value="SAVE"> ID저장
		String c_id = Utility.checkNull(request.getParameter("c_id"));
		Cookie cookie=null;
		if(c_id.equals("SAVE")){//ID저장에 체크를 했다면
			//cookie변수 선언 new Cookie("변수명", 값)
			cookie=new Cookie("c_id", mid);
			//cookie의 생존기간 1개월
			cookie.setMaxAge(60*60*24*30);//60초*60분*24시간*30일. 각 브라우저의 쿠키삭제의 영향을 받는다			
		}else{
			cookie=new Cookie("c_id", "");
			cookie.setMaxAge(0);
		}//if end
		
		response.addCookie(cookie);
		
		
			
		//쿠키끝////////////////////////////////////////////////////////////////////////
		
		//첫페이지로 이동
		//http://localhost:9090/myweb/index.jsp
		String root=Utility.getRoot();//myweb반환
		response.sendRedirect(root+"/index.jsp");

	}//if end

%>
<!-- 본문 끝 -->

