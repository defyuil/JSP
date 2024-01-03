<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>updateForm.jsp</h1>
	<%
		// 전달정보(파라메터) 저장 - bno,pageNum
		int bno = Integer.parseInt(request.getParameter("bno"));
	    String pageNum = request.getParameter("pageNum");
	    
		// BoardDAO 객체 생성
		BoardDAO bdao = new BoardDAO();
		
		// 특정 번호에 해당하는 글정보를 가져오기 - getBoard()
		BoardBean bb = bdao.getBoard(bno);
		
		// 정보 출력
	
	%>
	
	<fieldset>
		<legend>ITWILL 게시판 글수정하기</legend>
		<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post">
		   <input type="hidden" name="bno" value="<%=bno %>" >
		   글쓴이 : <input type="text" name="name" value="<%=bb.getName()%>"><br>
		   제목 : <input type="text" name="subject" value="<%=bb.getSubject()%>"><br>
		   내용 : <textarea rows="5" cols="20" 
		            name="content"><%=bb.getContent() %></textarea><br>
		   비밀번호 : <input type="password" name="pass" placeholder="비밀번호를 입력하세요!"><hr>
		   
		   <input type="submit" value="글수정하기">
		</form>
	</fieldset>
	
	
	
</body>
</html>