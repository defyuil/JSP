<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro1.jsp</h1>
	파라메터 : 이전페이지(form)에서 전달해준 정보<br>
	  request.getParameter("input태그 name"); <hr>
	
	전달된 정보 : <%=request.getParameter("id") %><br>
	전달된 정보 : <%=request.getParameter("age") %><br>
	전달된 정보 : <%=request.getParameter("id") %><br>
	
	<%
		String id = request.getParameter("id");
		// 폼태그로 전달된 데이터 파라메터는 
		// 항상 '문자열(String)' 타입이다.
		//int age = request.getParameter("age");
		
		int age = Integer.parseInt(request.getParameter("age"));
	%>
	아이디 : <%=id %><br>
	나이 : <%=age %><br>
	
	
	
</body>
</html>