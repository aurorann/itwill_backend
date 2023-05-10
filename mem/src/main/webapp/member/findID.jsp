<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="auth.jsp" %>
    
<!-- 본문 시작 findID.jsp -->

<h3>아이디/비밀번호 찾기</h3>
<br>

<form name="findID" id="findID" method="post" action="findIDProc.jsp" onsubmit="return findIDCheck()">
		<div class="form-field">
			<input type="text" name="mname" id="mname" placeholder="이름" maxlength="10" required>
		</div>
		<div class="form-field">
			<input type="email" name="email" id="email" placeholder="이메일" required>
		</div>
			<input type="submit" value="아이디/비밀번호 찾기" class="btn btn-primary">
			<input type="reset" value="취소" class="btn btn-warning">

</form>

<!-- 본문 끝 -->