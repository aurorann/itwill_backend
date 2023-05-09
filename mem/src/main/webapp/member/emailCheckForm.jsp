<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>emailCheckForm.jsp</title>
</head>
<body>
	<div style="margin: auto;" align="center">
		<br><br>
		<h3>email 중복확인</h3>
		<br>
		<form action="emailCheckProc.jsp" onsubmit="return blankCheck()">
			email : <input type="email" name="email" id="email" maxlength="20" autofocus>
			<br><br>
			<input type="submit" value="중복확인">
        	</div>

		</form>
	</div>
	<script>
		function blankCheck() {
			let email=document.getElementById("email").value;
			email=email.trim();
			if(email.length<5){
				alert("email은 5글자 이상으로 입력해 주세요");
				return false;
			}//if end
			return true;
		}//blankCheck() end
		
		function CheckEmail(){ 
			var email = document.getElementById("email").value;
		     var exptext = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		     if(exptext.test(email)==false) {       
		    	 alert("이메일 형식이 올바르지 않습니다.")
		    	 document.getElementById("email").focus();
		        return false;         
		     }//if end		                                
		}//CheckEmail() end
		
		function emailText() {
			let email2Direct=document.getElementById("email2Direct");
			if(document.getElementById("email2").value=="direct"){
				if(navigator.appName.indexOf("Microsoft")>-1){
					var visible='block';
				}else{
					var visible='table-row';
				}
				email2Direct.style.display=visible;
			}else{
				email2Direct.style.display=none;
			}//if end
		}//domainCheck() end
		
		
		
	</script>
</body>
</html>