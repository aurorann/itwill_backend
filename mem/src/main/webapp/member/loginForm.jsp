<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- 본문 시작 loginForm.jsp-->

<h3>L O G I N</h3>
<br>

<form name="loginfrm" id="loginfrm" method="post" action="loginProc.jsp" onsubmit="return loginCheck()"><!-- myscript.js -->
		<div class="form-field">
			<input type="text" name="id" id="id" placeholder="아이디" maxlength="10" required>
		</div>
		<div class="form-field">
			<input type="password" name="passwd" id="passwd" placeholder="비밀번호" maxlength="10" required>
		</div>

	<br>
		<label><input type="checkbox" name="c_id" value="SAVE">&nbsp;&nbsp;ID저장</label>
	<br>
		&nbsp;&nbsp;&nbsp;
		<a href="agreement.jsp">회원가입</a>
		&nbsp;&nbsp;&nbsp;
		<a href="findID.jsp">아이디/비밀번호 찾기</a>
		
	<br>
	<br>
		<input type="submit" value="login" class="btn btn-primary">
</form>

	<input type='button' value='logout' class='btn btn-warning' onclick="location.href='logout.jsp'">

	<br><br>
	<a href='memberModify.jsp'>[회원정보수정]</a>
	&nbsp;&nbsp;
	<a href='memberWithdraw.jsp'>[회원탈퇴]</a>
