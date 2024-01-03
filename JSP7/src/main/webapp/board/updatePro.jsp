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
		<h1>updatePro.jsp</h1>
		
		<%
		  // 한글데이터 처리
		  request.setCharacterEncoding("UTF-8");
		  //페이지번호
		  String pageNum = request.getParameter("pageNum");
		  
		  // 전달정보(파라메터) 저장
		  // => 액션태그 - 자바빈 객체 사용저장
		 %>
		   <jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"/>
		   <jsp:setProperty property="*" name="bb"/>		    
		 <% 
		   // 확인
			System.out.println(bb);
		 
		   // BoardDAO - 정보 수정메서드
		   BoardDAO bdao = new BoardDAO();
		   
		   int result = bdao.updateBoard(bb);
		   
		   // result값에 따른 페이지 이동 (JS)
		   // -1  0  1
		   if(result == 1){
			   %>
			     <script type="text/javascript">
			     	alert('수정완료! ');
			     	location.href='boardList.jsp?pageNum=<%=pageNum%>';
			     </script>			   
			   <%
		   }
		   else if(result == 0){
			   %>
			     <script type="text/javascript">
			     	alert('수정 실패-비밀번호 오류!');
			     	history.back();
			     </script>			   
			   <%
		   }else{
			   // result == -1
			   %>
			     <script type="text/javascript">
			     	alert('수정 실패-게시판 글없음!');
			     	history.back();
			     </script>			   
			   <%
		   }
		 %>
		
		
</body>
</html>