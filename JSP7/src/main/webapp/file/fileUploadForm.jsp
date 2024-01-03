<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>./file/fileUploadForm.jsp</h1>
	<%
		//파일 업로드(p305)
		// => 자바의 입출력 스트림사용(직접X,컴포넌트 사용 O-누가만들어 놓은것)
		// => cos.jar 라이브러리 사용
	%>
	
	<fieldset>
		<legend> 파일업로드 </legend>
		<!-- 반드시 post방식으로 enctype="multipart/form-data" 속성을 사용 -->
		<form action="fileUploadPro.jsp" method="post" enctype="multipart/form-data">
			
			이름 : <input type="text" name="name"> <br>
			메세지 : <input type="text" name="msg"> <br>
			첨부파일 : <input type="file" name="file"><hr>
			
			<input type="submit" value="전송하기">		
		</form>	
	</fieldset>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>