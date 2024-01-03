<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>core_set2.jsp</h1>
		
		<h2> core_set1.jsp에서 전달된 정보 저장 </h2>
		<h3> [ core_set1.jsp 실행 ]</h3>
		<%=request.getAttribute("model") %>
		
		<c:out value="${requestScope.model }"/> <hr>
		<c:out value="${model }"/><hr>
		model : ${model }<hr>
		price : ${requestScope.price }<hr>
		color : ${sessionScope.color }<hr>
		color : ${color }<hr>
		
		<!-- 속성을 제거  -->
		<c:remove var="color" scope="request"/>
		
		color : ${sessionScope.color }<hr>
		color : ${color }<hr>
		
		<hr>
		<h2> ExServlet에서 전달해준 정보를 출력 </h2>
		<h3> [ /exServlet 실행 ]</h3>
		
		이름 : ${requestScope.person1.name }님<br>
		나이 : ${person1.age }살<br>
		휴대폰 모델명 : ${requestScope.person1.phone.model }<br>
		휴대폰 번호 : ${person1.phone.tel}<br>
		
		<c:set var="p" value="${requestScope.person1.phone }"/>
		
		휴대폰 모델명 : ${p.model }<br>
		휴대폰 번호 : ${p.tel}<br>
		
		
		<hr>
		<h2> ExServlet에서 전달해준 Vector 정보를 출력 </h2>
		${requestScope.personList } <hr>
		이름 : ${requestScope.personList[0].name }<br>
		전화번호 : ${personList[0].phone.tel } <hr>
		
		<c:set var="pl" value="${personList[1] }" /> 
		이름 : ${pl.name } <br>
		<c:set var="ph" value="${personList[1].phone }" /> 
		전화번호 : ${ph.tel }<hr> 
		
		
		
		
		
		
</body>
</html>