<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// ajaxString2.jsp
System.out.println(" ajaxString2.jsp 실행!! ");
// 전달받은 정보를 처리후 전달
String name = request.getParameter("name");
System.out.println(" 전달받은 데이터 : "+name);
int age = Integer.parseInt(request.getParameter("age"));
%>
<%=name+"@@(처리)" %>,<%=age+100 %>
