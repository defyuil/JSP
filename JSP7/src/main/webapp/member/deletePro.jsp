<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxCrud.DropViewOrBuilder"%>
<%@page import="java.sql.DriverManager"%>
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
			// 세션제어
			String id = (String)session.getAttribute("id");
		    if(id == null){
		    	response.sendRedirect("loginForm.jsp");
		    }
		
			// 한글처리
			request.setCharacterEncoding("UTF-8");
			// 전달정보 저장(id,pw)
			//String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			
			// 전달된 정보 확인하여 회원정보 삭제
			// (DB에 저장된 회원정보 삭제)
			
			// 디비 연결정보
			final String DRIVER = "com.mysql.cj.jdbc.Driver";
			final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
			final String DBID = "root";
			final String DBPW = "1234";
			
			// 1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println(" 드라이버 로드성공! ");
			// 2. 디비연결
			Connection con = 
			 DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println(" 디비 연결 성공! ");
			// 3. SQL 작성 (select) & pstmt 객체
			String sql = "select pw from itwill_member where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// ???
			pstmt.setString(1, id);
			
			// 4. SQL 실행
			ResultSet rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()){
				if(pw.equals(rs.getString("pw"))){
					//3. SQL 작성(delete) & pstmt 객체
					sql = "delete from itwill_member where id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					
					//4. SQL 실행
					pstmt.executeUpdate();
					
					// 로그인정보(세션) 초기화					
					session.invalidate();
					
					// 페이지 이동
					%>
						<script type="text/javascript">
							alert("삭제O-회원정보 탈퇴 완료!!");
							location.href='main.jsp';							
						</script>
					<%
				}else{
					%>
						<script type="text/javascript">
							alert("삭제X-비밀번호 오류!!");
							history.back();							
						</script>
					<%
				}
			}else{
				%>
					<script type="text/javascript">
						alert("삭제X-회원정보가 없음!!");
						history.back();							
					</script>
				<%				
			}
			// 실행결과에 따른 페이지 이동	
			
			
			
		
		%>
		
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>