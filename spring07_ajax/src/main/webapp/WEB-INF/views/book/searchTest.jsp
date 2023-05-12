<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>searchTest.jsp</title>
	<script src="../js/jquery-3.6.4.min.js"></script>
</head>
<body>

	<h3>교재 검색</h3>
	
	<form name="search" id="search">
		<input type="text" name="keyword" id="keyword">
		<input type="button" value="검색">
	</form>
	
	<!-- 검색 결과 출력 -->
	<div id="panel" style="display:none"></div>
	
	<script>
		$("#keyword").keyup(function(){
			//alert("test");
			
			if($("#keyword").val()==""){//검색어가 존재하지 않으면
				$("#panel").hide();		//출력결과 숨기기	
			}//if end
			
			//1)id="keyword" 값 가져오기
			//let params=$("#keyword").val();
			//alert(params);
			
			//2)본문의 14행 <form name="search" id="search">
			let params=$("#search").serialize();
			//alert(params);	//keyword=java
			
			$.post("searchproc.do", params, responseProc);			
			
		});//keyup() end
		
		function responseProc(data) {
			//alert(data);
		}//responseProc() end
		
	</script>
	
</body>
</html>