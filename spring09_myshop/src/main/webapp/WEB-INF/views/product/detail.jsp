<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>detail.jsp</title>
	<script src="/js/jquery-3.6.4.min.js"></script>
	<link href="/css/main.css" rel="stylesheet" type="text/css">
	<link href="/css/layout.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
	<script>
		function product_update() {
			document.productfrm.action="/product/update";
			document.productfrm.submit();
		}//product_update() end
		
		
		function product_delete() {
			if(confirm("첨부된 파일은 영구히 삭제됩니다\n진행할까요?")){
				document.productfrm.action="/product/delete";
				document.productfrm.submit();
			}//if end
		}//product_delete() end
		
		
		function product_update() {
			document.productfrm.action="/product/update";
			document.productfrm.submit();
		}//product_update() end
		
	</script>
	
</head>
<body>
	<div class="container-fluid" style="margin: auto; width: 550px">
	<h3 class="text-center">상품 상세보기 / 상품 수정 / 상품 삭제</h3>
	<br>
	<form name="productfrm" id="productfrm" method="post" enctype="multipart/form-data">
		<p align="center">
			<button style="margin-left: 70%" type="button" onclick="location.href='/product/list'" class="btn btn-info">상품전체목록</button>
		</p>
		<table class="table" style="margin: auto;">
	    <tr>
	        <td style="background-color: #FFF8DC; font-weight: bold;">상품명</td>
	        <td> <input type="text" name="product_name" value="${product.PRODUCT_NAME}"> </td>
	    </tr>
	    <tr>
	        <td style="background-color: #FFF8DC; font-weight: bold;">상품가격</td>
	        <td> <input type="number" name="price" value="${product.PRICE}"> </td>
	    </tr>
	    <tr>
	        <td style="background-color: #FFF8DC; font-weight: bold;">상품설명</td>
	        <td> 
	            <textarea rows="5" cols="60" name="description">${product.DESCRIPTION}</textarea>     
	         </td>
	    </tr>
	    <tr>
	        <td style="background-color: #FFF8DC; font-weight: bold;">상품사진</td>
	        <td> 
	        	<c:if test="${product.FILENAME != '-' }">
	        	<img src="/storage/${product.FILENAME}" width="300px">
	        	</c:if>
	        <input type="file" name="img"> </td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	        	<input type="hidden" name="product_code" value="${product.PRODUCT_CODE}">
	        	<input type="button" value="상품수정" onclick="product_update()" class="btn btn-warning">
	        	<input type="button" value="상품삭제" onclick="product_delete()" class="btn btn-danger">
	        </td>
	    </tr>	
	    </table>
	</form>
	<hr>
	<!-- 댓글 시작 -->
	
	<div>
		<label for="content">댓글</label>
		<form name="commentInsertForm" id="commentInsertForm">
			<div>
				<!-- 부모글번호 -->
	        	<input type="hidden" name="product_code" value="${product.PRODUCT_CODE}">
				<input type="text" name="content" id="content" placeholder="내용을 입력해주세요">
				<button type="button" name="commentInsertBtn" id="commentInsertBtn">등록</button>
			</div>
		</form>
	</div>
	
	<div>
		<!-- 댓글목록 -->
		<div class="commentList"></div>
	</div>
	
	<!--댓글과 관련 자바스크립트 -->
	<script>
	
		let product_code = '${product.PRODUCT_CODE}'; //부모글 번호
	
		//댓글 등록 버튼 클릭했을때
		$("#commentInsertBtn").click(function(){
			//alert($);
			//<form id="commentInsertForm"></form>
			let insertData=$("#commentInsertForm").serialize();
			//alert(insertData);//product_code=22&content=abc
			commentInsert(insertData);//댓글등록 함수 호출
		});
		
		function commentInsert(insertData){//댓글 등록 함수
			//alert("댓글등록함수호출" +  insertData);
			$.ajax({
					url:'/comment/insert'
				  , type:'post'
				  , data:insertData
				  , error:function(error){
					  alert(error);
				  }//error end
				  , success:function(data){
					  //alert(data);
					  if(data==1){//댓글 등록 성공
						  commentList();//댓글 작성후 댓글 목록 함수 호출
						  //기존 댓글 내용을 빈 문자열로 대입
						  $("#content").val('');
					  }//if end
				  }//success end
				  });//ajax() end
		}//commentInsert() end
		
		function commentList(){
			//alert("댓글 목록 함수 호출");
			$.ajax({
				  url:'/comment/list'
				, type:'get'
				, data:{'product_code' : product_code}
				, success:function(data){
					//alert(data);
					let a='';//출력할 결과값
					$.each(data, function(key, value){
						//alert(key);
						//alert(value);
						//alert(value.cno);
						//alert(value.content);
						//alert(value.wname);
						//alert(value.regdate);
						//alert(value.product_code);
						
						a += value.content + "<br>";
						
					});//each() end
					
					$(".commentList").html(a);
				}
			});//ajax() end			
			
		}//commentList() end
		
		
		$(document).ready(function(){//페이지 로딩시 댓글 목록 출력
			commentList();
		});//ready() end
		
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	</div>
</body>
</html>