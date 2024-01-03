<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>elParamTest.jsp</h1>
	
	<fieldset>
		<form action="elParamTestPro.jsp" method="post">
			아이디 : <input type="text" name="id"><br>
			이름 : <input type="text" name="name"><br>
			나이 : <input type="number" name="age"><br>
			<hr>
			좋아하는 음식1 : <input type="text" name="foods"> <br>	
			좋아하는 음식2 : <input type="text" name="foods"> <br>	
			<hr>
			취미 : 
			<input type="checkbox" name="hobbys" value="게임">게임		
			<input type="checkbox" name="hobbys" value="운동">운동			
			<input type="checkbox" name="hobbys" value="영화">영화<br>			
			
			<input type="submit" value="전송하기">		
		</form>
	</fieldset>
	
	
</body>
</html>