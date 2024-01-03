<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
		<h1>updatePro.jsp</h1>
		
		<%
			// 로그인 세션 제어
			String id = (String) session.getAttribute("id");
			if(id == null){
				response.sendRedirect("loginForm.jsp");
			}
			
			// 한글처리
			request.setCharacterEncoding("UTF-8");
			
			// 전달정보 저장 => 자바빈(액션태그)
		%>
		
		<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean" />
		<jsp:setProperty property="*" name="mb"/>
		
		<%
			// 수정할 정보를 DB에 전달해서 정보 수정
			
			// 디비연결정보 
			final String DRIVER = "com.mysql.cj.jdbc.Driver";
			final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
			final String DBID = "root";
			final String DBPW = "1234";
			
			// 1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println(" 드라이버 로드 성공! ");
			// 2. 디비 연결
			Connection con =
			DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println(" 디비 연결 성공! ");
			
			// 3. SQL 구문 (select) & pstmt 객체
			String sql = "select pw from itwill_member where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			// 4. SQL 실행
			ResultSet rs = pstmt.executeQuery();
			
			// 5. 데이터 처리 (update)
			if(rs.next()){
				// 회원정보가 있음
				if(mb.getPw().equals(rs.getString("pw"))){
					// 회원정보 수정
					// 3. sql작성 & pstmt 객체
					sql = "update itwill_member set name=?,gender=? where id=?";
					pstmt = con.prepareStatement(sql);
					
					// ???
					pstmt.setString(1, mb.getName());
					pstmt.setString(2, mb.getGender());
					pstmt.setString(3, mb.getId());
					
					// 4. sql 구문실행
					pstmt.executeUpdate();
					System.out.println(" 수정완료! ");
					
					// 메인페이지로 이동
					response.sendRedirect("main.jsp");					
				}else{
					// 회원정보 수정X - 비밀번호 오류	
					%>
						<script type="text/javascript">
							alert("수정X-비밀번호 오류!!");
							history.back();							
						</script>
					<%
				}				
			}else{
				// 회원정보가 없음
				%>
				<script type="text/javascript">
					alert("수정X-회원정보가 없음!!");
					history.back();							
				</script>
				<%
				
			}		
		%>
		
		
		
		
		
		
</body>
</html>