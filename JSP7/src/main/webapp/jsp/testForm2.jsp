<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  	<h1>testForm2.jsp</h1>
  	<fieldset>
  		<form action="testPro2.jsp" method="get">
  			이름 : <input type="text" name="name"><br>
  			나이 : <input type="text" name="age"><br>
  			<hr>
  			성별 : <input type="radio"  name="gender" value="남성">남성
  			       <input type="radio"  name="gender" value="여성">여성<br>
  			
  			취미 : <input type="checkbox" name="hobby" value="게임"> 게임
	  			   <input type="checkbox" name="hobby" value="운동"> 운동
	  			   <input type="checkbox" name="hobby" value="영화"> 영화<br>
  			과목 :
  			<select name="subject"> 
  				<option value="">과목을 선택하세요.</option>
  				<option value="JAVA">JAVA</option>
  				<option value="JSP">JSP</option>
  				<option value="WEB">WEB</option>
  				<option value="DB">DB</option>
  			</select>
  			<hr>
  			<input type="submit"  value="전송">  		
  		</form>  	
  	</fieldset>
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
</body>
</html>