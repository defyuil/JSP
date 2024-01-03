<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
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
		<h1>boardList.jsp </h1>
		
		<h2> 게시판 목록 </h2>
		
		<h3><a href="writeForm.jsp">글쓰기</a></h3>
		<h3><a href="fileWriteForm.jsp">첨부파일 글쓰기</a></h3>

		<%
			// BoardDAO 객체 생성
			BoardDAO dao = new BoardDAO();
		
			// DB에 저장된 글의 개수 계산 후 가져오기
			int result = dao.getBoardCount();
			/*********************페이징처리 1*******************/
			// 한 페이지에 출력할 글의 개수 설정
			int pageSize = 10;
			
			// 현 페이지가 몇페이지 인지확인
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null){
				pageNum = "1";
			}
			
			//시작행 번호 계산하기
			//  1  11  21  31  41 .....
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1)*pageSize + 1;
			
			// 끝행 번호 계산
			//  10  20  30 40  50 .....
			int endRow = currentPage * pageSize;
			
			/*********************페이징처리 1*******************/
			// DB에 저장된 글정보를 모두 가져오기
		    //ArrayList boardList = dao.getBoardList();
		    ArrayList boardList = dao.getBoardList(startRow,pageSize);
		    
		    if(boardList.size() == 0){
		    	response.sendRedirect("boardList.jsp?pageNum="+(currentPage-1));
		    }
		    
		%>
		
		<h3> 글 개수 : <%=result %> 개 </h3>
		
		<table border="1">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>ip</td>
			</tr>
		<%
		  for(int i=0;i<boardList.size();i++){
			  // 배열에 있는 요소를 꺼내기
			  // boardList[i];
			  BoardBean bb = (BoardBean)boardList.get(i);
	     %>
			<tr>
				<td><%=bb.getBno() %></td>
				<td>
					<!-- 
					     페이징 처리3  
					     페이지 처리 후 다시 리스트로 돌아올때 
					     기존의 페이지를 유지 하도록 처리
					   -->
					<%if(bb.getRe_lev() > 0){ %>  
						<img src="level.gif" width="<%=bb.getRe_lev()*10%>">	   
						<img src="re.gif">  
					<%} %> 
					<a href="boardContent.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>">
						<%=bb.getSubject() %>
					</a>
					
					<%if(bb.getFile() != null){ %>
						<img src="save.png" width="15px">
					<%} %>
					
				</td>
				<td><%=bb.getName() %></td>
				<td><%=bb.getDate() %></td>
				<td><%=bb.getReadcount() %></td>
				<td><%=bb.getIp() %></td>
			</tr>
		<%
		   }
		%>	
		</table>
		
		<%
		  /*******************페이징처리 2*********************/ 
			// 페이지 블럭(1,2,3,.....,10) 생성
			
			if(result != 0){ // 게시판에 글이 있을때
				
				// 전체 페이지수 
				//  글 15 / 페이지당 10 => 2개
				//  글 78 / 페이지당 10 => 8개
				int pageCount = result/pageSize + (result%pageSize == 0? 0:1);
				
				// 한 화면에 보여줄 페이지 블럭개수
				int pageBlock = 3;
				
				// 페이지 블럭의 시작번호 계산
				//  1페이지 => 1     ,  11페이지 => 11    
				//  5페이지 => 1     ,  25페이지 => 21
				int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
				
				// 페이지 블럭의 마지막번호 계산
				//  1페이지 => 10,  13페이지 => 20
				int endPage = startPage + pageBlock - 1;
				// 페이지의 글이 없는경우
				if(endPage > pageCount){
					endPage = pageCount;
				}
				
				// 이전
				if(startPage > pageBlock){
				%>
					<a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
				<%
				}
				
				// 1.....10 11...20 21...30
				for(int i=startPage;i<=endPage;i++){
					%> 
					    <a href="boardList.jsp?pageNum=<%=i %>">[<%=i %>]</a> 
					<%
				}
				
				// 다음
				if(endPage < pageCount){
				%>
					<a href="boardList.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>				
				<%
				}
				
				
			}// count!=0
		  
		  /*******************페이징처리 2*********************/ 
		%>
		
		
		
		
		
		
		
		
</body>	
</html>