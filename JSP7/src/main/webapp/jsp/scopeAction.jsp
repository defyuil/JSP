<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopeAction.jsp</h1> 
		
	아이디(파라메터) : <%=request.getParameter("id") %> <br>
	비밀번호(파라메터) : <%=request.getParameter("pw") %><br>
	
	<hr>
	page영역값 : <%=pageContext.getAttribute("p") %><br>
	request영역값 : <%=request.getAttribute("r") %><br>
	session영역값 : <%=session.getAttribute("s") %><br>
	application영역값 : <%=application.getAttribute("a") %><br>
	
	
	
	
	
	
	
	
	
	
</body>
</html>