<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>elOperatorTestPro.jsp</h1>
	
	<h2> 전달정보 저장 </h2>
	
	num1 = ${param.num1 }, num2 = ${param.num2 } <hr> 
	
	<h3> 기본적인 형변환 제공, 하나의 EL표현식 안에서 연산 수행 </h3>
	num1 + num2 = ${param.num1 }+${param.num2 }<br>
	num1 + num2 = ${param.num1 + param.num2 }<br>
	num1 * num2 = ${param.num1 * param.num2 } <hr>
	
	Q. num1,num2 값이 모두 양수인가?  A. ${ (param.num1 > 0) && (param.num2 > 0) }  <hr> 
	
	Q. num1,num2 값이 같은지, 다른지 비교  A. ${param.num1 == param.num2? "같다":"다르다"} <!-- 같다or다르다 출력 --> <hr>
	
	Q. 사용자의 아이디가 있는경우 "OOO님 안녕하세요!",없는경우 "guest님 안녕하세요!"
	  <%-- ${param.id == null} --%>
	  <hr>
	  => ${param.id == ""? "guest":param.id}님 안녕하세요! <br>
	  => ${empty param.id? "guest":param.id}님 안녕하세요! <br>
	
	
	
	
</body>
</html>