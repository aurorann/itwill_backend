<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>errorTest.jsp</title>
</head>
<body>

	<h3>���� �޼��� Ȯ��</h3>
<%

	//1)HTTP ���� 404 - ã�� �� ����
	//http://localhost:9090/basic05_mvc/error/list.jsp
	
	//2)HTTP ���� 500 - ���� ���� ����
	//http://localhost:9090/basic05_mvc/error/errorTest.jsp
	//-> ?�ڿ� Query String ������ kor���� �Ѱܾ� ������ �߻����� ����
	//-> �����ذ� http://localhost:9090/basic05_mvc/error/errorTest.jsp?kor=50
	int num=Integer.parseInt(request.getParameter("kor"));
	out.print("num : " + num);
	
	//������ �߻��ϴ� ���, ���� �޼����� ���� ������� �ʰ�, �ٸ� �������� �̵��� �ʿ䰡 ����
	//-> /WEB-INF/web.xml��ġ�����ڿ��� ���� 

%>

</body>
</html>