<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/jdbc/insertForm.jsp</h1>
	
	<h2> 사용자가 정보를 입력하는 페이지 </h2>
	
	<fieldset>
		<form action="insertPro.jsp" method="post">
			이름 : <input type="text" name="name"> <br>
			성별 : <input type="radio" name="gender" value="M">M 
			       <input type="radio" name="gender" value="W">W <br>
			나이 : <input type="number" name="age"> <br>
			주민번호 : <input type="text" name="ju1">-<input type="text" name="ju2" ><br>
			
			<input type="submit" value="정보전달">			
		</form>
	</fieldset>
	
	
	
	
	
	
	
	
	
	
</body>
</html>