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
	<h1>boardContent.jsp</h1>
	<h2> 게시판 본문 </h2>
	
	<%
		// 전달정보 저장 (파라메터 - bno,pageNum)
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		
		// BoardDAO 객체 생성
		BoardDAO bdao = new BoardDAO();
		
		// 해당글 조회수 1증가
		bdao.updateReadCount(bno);
		
		// 특정 번호에 해당하는 글정보를 가져오기
		BoardBean bb = bdao.getBoard(bno);		
		// 화면에 글정보 출력
	%>
	   <table border="1">
	       <tr>
	       		<td>글번호</td>
	       		<td><%=bb.getBno()%></td>
	       		<td>조회수</td>
	       		<td><%=bb.getReadcount() %></td>
	       </tr>
	       <tr>
	       		<td>작성자</td>
	       		<td><%=bb.getName() %></td>
	       		<td>작성일</td>
	       		<td><%=bb.getDate() %></td>
	       </tr>
	       <tr>
	       		<td>제목</td>
	       		<td colspan="3"><%=bb.getSubject() %></td>
	       </tr>
	       <tr>
	       		<td>첨부파일</td>
	       		<td colspan="3">
	       		 <%if(bb.getFile() != null){ %>
	       		  <a href="../upload/<%=bb.getFile() %>" download><%=bb.getFile() %></a><br>
	       		  <a href="../file/fileDownload.jsp?fileName=<%=bb.getFile() %>"><%=bb.getFile() %></a>
	       		 <%} %> 
	       		</td>
	       </tr>
	       <tr>
	       		<td>내용</td>
	       		<td colspan="3"><%=bb.getContent() %></td>
	       </tr>
	       
	       <tr>
	       		<td colspan="4">
	       			<input type="button" value="수정하기" onclick=" location.href='updateForm.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>'; ">
	       			<input type="button" value="삭제하기" onclick=" location.href='deleteForm.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>';">
	       			<input type="button" value="답글쓰기"
	       			       onclick=" location.href='reWriteForm.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'; ">
	       			<input type="button" value="목록으로" onclick=" location.href='boardList.jsp?pageNum=<%=pageNum%>';">
	       		</td>
	       </tr>	       
	   
	   </table>
	
	
	
	
	
	
</body>
</html>