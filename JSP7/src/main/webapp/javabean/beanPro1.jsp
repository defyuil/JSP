<%@page import="com.itwillbs.javabean.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>beanPro1.jsp</h1>
	
	<%
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		// 전달정보 저장
		
		// 변수
		// String id = request.getParameter("id");
		
		// 객체(자바빈)
// 		JavaBean1 jb1 = new JavaBean1();
// 		jb1.setId(request.getParameter("id"));
	%>
	
	<%-- 아이디 : <%=id %><hr> --%>
	<%-- 아이디(객체) : <%=jb1.getId() %><hr> --%>
	
	<h2> 자바빈 (액션태그) </h2>
	
	<%-- <jsp:useBean id="레퍼런스명"  class="클래스위치"/> --%>
	<jsp:useBean id="jb1"  class="com.itwillbs.javabean.JavaBean1"/>
	
	<%-- <jsp:setProperty property="저장할 변수명" name="레퍼런스명" param="파라메터명"/> --%>
	<jsp:setProperty property="id" name="jb1" param="id"/>
	
	<%-- <jsp:getProperty property="가져올 변수명" name="레퍼런스명"/> --%>
	아이디(자바빈) : <jsp:getProperty property="id" name="jb1"/>
	
	
	
	
	
	
	
</body>
</html>