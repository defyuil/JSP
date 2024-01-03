<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>elTest1.jsp</h1>
	
	<%
	   int num = 100;	
	   out.println("변수num : "+num+"<hr>");
	   
	   // 영역객체에 정보 저장
	   request.setAttribute("num2", 1000);
	%>
	변수num : <%=num %><br>
	 => jsp 표현식 출력하는 num (변수)
	 <hr> 
	
	변수num(el) : ${num }<br>
	 => el 표현식 출력하는 num (변수X, 속성(attribute)O )
	 <hr> 
	 
	영역객체의 속성 num2 (JSP) : <%=request.getAttribute("num2") %><hr>  
	영역객체의 속성 num2 (EL) : ${num2 }<hr>
	
	
	
</body>
</html>