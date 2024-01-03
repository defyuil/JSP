<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> test3.jsp </h1>
	
	<h2> 내장객체 사용 </h2>
	
	<h2> request 객체 </h2>
	
	주소(URL) : <%=request.getRequestURL() %><br>
	서버도메인(IP개념) : <%=request.getServerName() %><br>
	IP주소 : <%=request.getRemoteAddr() %><br>
	페이지정보 전달방식 : <%=request.getMethod() %> <br>
	프로젝트의 실제경로(물리적경로) : <%=request.getRealPath("/") %><br>
	
	<h2> response 객체 </h2>
	<%
	    // 페이지 이동
		// response.sendRedirect("http://www.naver.com");
	    // response.addHeader("Refresh", "3; url=http://www.naver.com");
	
	%>
	
	<h2> session 객체 </h2>
	
	세션 객체 ID : <%=session.getId() %><br>	
	세션 생성시간 : <%=session.getCreationTime() %><br>
	세션 최종접속시간 : <%=session.getLastAccessedTime() %><br>
		
	
	
	
	
	
	
	
	
	
</body>
</html>