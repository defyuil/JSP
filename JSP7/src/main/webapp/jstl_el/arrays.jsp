<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <h1>arrays.jsp</h1>
	 
	 <h3> el표현식 전달데이터 출력 </h3>
	 
	 ${requestScope.foods } <hr>
	 ${requestScope.foods.toString() } <hr>
	 
	 ${foods[0] },${foods[1] },${foods[2] },${foods[3] },${foods[4] }  
	 [ ${foods[5] } ] el 표현식의 null은 공백문자가 출력됨
	 <hr>
	 el표현식은 jsp 반복문 사용이 불가능하다!!! <hr>
	 
	 <%
	   // request 영역데이터 가져오기
	   String[] foods = (String[])request.getAttribute("foods");
	   
	 	for(int i=0;i<foods.length;i++){
	 		%>
	 			${foods[i] } @
	 		<%	 		
	 	}	 
	 %>
	 <hr>
	 
	 ${requestScope.sportsList } <hr>
	 ${requestScope.sportsList.toString() } <hr>
	 ${requestScope.sportsList[0] } <hr>
	 
	 <h2> EL표현식 반복문 사용불가 => JSTL 반복문을 사용해서 해결 </h2>
	 
	 
	 
</body>
</html>