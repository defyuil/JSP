<%@page import="com.itwillbs.javabean.JavaBean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>beanPro2.jsp</h1>
	<%
		// 한글처리
		request.setCharacterEncoding("utf-8");
	
// 		// 전달정보 저장
// 		String id = request.getParameter("id");
// 		String pw = request.getParameter("pw");
// 		int age = Integer.parseInt(request.getParameter("age"));
	%>
<%-- 		아이디 : <%=id %><br> --%>
<%-- 		비밀번호 : <%=pw %><br> --%>
<%-- 		나이 : <%=age %><br> --%>
		
	   <!-- 자바빈객체 (JavaBean2) 생성 -->
	   <%
	      // 자바빈 객체 생성
// 	      JavaBean2 jb2 = new JavaBean2();
	      
// 	   	  jb2.setId(request.getParameter("id"));
// 	   	  jb2.setPw(request.getParameter("pw"));
// 	   	  jb2.setAge(Integer.parseInt(request.getParameter("age")));
	   %>
<%-- 	      아이디 :<%=jb2.getId() %><br> --%>
<%-- 	      비밀번호 : <%=jb2.getPw() %><br> --%>
<%-- 	      나이 : <%=jb2.getAge() %><br> --%>

	   <!-- 자바빈 객체(액션태그) -->
	   <jsp:useBean id="jb2" class="com.itwillbs.javabean.JavaBean2"/>
	   
	  <%--  <jsp:setProperty property="id" name="jb2" param="id"/>
	   <jsp:setProperty property="pw" name="jb2" param="pw"/> --%>
	   <%-- <jsp:setProperty property="age" name="jb2" param="age"/> --%>
	  <%--  <jsp:setProperty property="age" name="jb2" /> --%>
	   <!-- 파라메터명, 프로퍼티명이 같은경우 param 속성 생략가능 -->
	   <jsp:setProperty property="*" name="jb2"/>
	   <!--  property="*" 전달되는 모든 파라메터 정보를 각각 저장 -->
	   
	   
	   
	   아이디 : <jsp:getProperty property="id" name="jb2"/>
	   비밀번호 : <jsp:getProperty property="pw" name="jb2"/>
	   나이 : <jsp:getProperty property="age" name="jb2"/>
	   
	   
	   
	   
	   
	   
	   
	   	
	


</body>
</html>