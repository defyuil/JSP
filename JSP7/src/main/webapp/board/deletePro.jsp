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
	<h1>deletePro.jsp</h1>
	
	<%
		// 전달정보 저장(bno,pass,pageNum)
		
		// bno,pass => 액션태그
		// pageNum => 파라메터
		String pageNum = request.getParameter("pageNum");
	%>
	<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	
	<%
		// BoardDAO - 게시판 글 삭제메서드(bno,pass)
		// BoardDAO - 게시판 글 삭제메서드(bb)
		BoardDAO bdao = new BoardDAO();
	    
	    // 글삭제 메서드-deleteBoard(bb) 호출
		int result = bdao.deleteBoard(bb);	     
	    
	     // 처리결과에 따른 페이지 이동
	     // result값에 따른 페이지 이동 (JS)
		   // -1  0  1
		   if(result == 1){
			   %>
			     <script type="text/javascript">
			     	alert('삭제완료! ');
			     	location.href='boardList.jsp?pageNum=<%=pageNum%>';
			     </script>			   
			   <%
		   }
		   else if(result == 0){
			   %>
			     <script type="text/javascript">
			     	alert('삭제 실패-비밀번호 오류!');
			     	history.back();
			     </script>			   
			   <%
		   }else{
			   // result == -1
			   %>
			     <script type="text/javascript">
			     	alert('삭제 실패-게시판 글없음!');
			     	history.back();
			     </script>			   
			   <%
		   }
	%>
	
	
	
	
	
	
</body>
</html>