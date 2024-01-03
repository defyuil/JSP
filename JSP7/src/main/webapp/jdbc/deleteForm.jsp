<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>deleteForm.jsp</h1>
	<!-- 인덱스 번호, 주민번호 입력해서 해당 사용자 정보 삭제 -->
	<fieldset>
		<form action="deletePro.jsp" method="post">
		   삭제할 번호 : <input type="text" name="idx"><br>
		   주민번호 확인 : <input type="text" name="jumin" 
		                   placeholder="-포함 해서 작성하세요"><br>
		   
		   <input type="submit" value="삭제하기"> 
		
		</form>
	</fieldset>
	
</body>
</html>