<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>fileWriteForm.jsp</h1>
	
	<fieldset>
		<legend>ITWILL 게시판 글쓰기(첨부파일)</legend>
		<form action="fileWritePro.jsp" method="post" enctype="multipart/form-data">
		   글쓴이 : <input type="text" name="name"><br>
		   제목 : <input type="text" name="subject"><br>
		   내용 : <textarea rows="5" cols="20" 
		            name="content"></textarea><br>
		   비밀번호 : <input type="password" name="pass"><hr>
		   첨부파일 : <input type="file" name="file"><hr>		   
		   
		   <input type="submit" value="글쓰기">
		</form>
	</fieldset>
	
	
	
</body>
</html>