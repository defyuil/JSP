<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>reWriteForm.jsp</h1>
	
	<%
		//전달정보 저장(bno,pageNum,re_ref,re_lev,re_seq)
		String pageNum = request.getParameter("pageNum");
	    
		int bno = Integer.parseInt(request.getParameter("bno"));
		int re_ref = Integer.parseInt(request.getParameter("re_ref"));
		int re_lev = Integer.parseInt(request.getParameter("re_lev"));
		int re_seq = Integer.parseInt(request.getParameter("re_seq"));	
	%>
	
	<fieldset>
		<legend>ITWILL 게시판 답글쓰기</legend>
		<form action="reWritePro.jsp?pageNum=<%=pageNum %>" method="post">
		   <input type="hidden" name="bno" value="<%=bno%>">
		   <input type="hidden" name="re_ref" value="<%=re_ref%>">
		   <input type="hidden" name="re_lev" value="<%=re_lev%>">
		   <input type="hidden" name="re_seq" value="<%=re_seq%>">
		   글쓴이 : <input type="text" name="name"><br>
		   제목 : <input type="text" name="subject" value="[답글]"><br>
		   내용 : <textarea rows="5" cols="20" 
		            name="content"></textarea><br>
		   비밀번호 : <input type="password" name="pass"><hr>
		   
		   <input type="submit" value="답글쓰기">
		</form>
	</fieldset>
	
	
	
</body>
</html>