<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>list.jsp</h1>
		
		<h2>ITWILL 회원정보 출력</h2>
		
		<%
			// 세션제어 (로그인,관리자)
			String id = (String) session.getAttribute("id");
		
			if(id == null || !id.equals("admin") ){
				response.sendRedirect("loginForm.jsp");
			}
			
			//DB 접근해서 모든 회원정보 가져오기
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
			
			// 3. sql작성(select) & pstmt 객체
// 			String sql = "select * from itwill_member";
			String sql = "select * from itwill_member where id != ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			// 4. sql 실행
			ResultSet rs = pstmt.executeQuery();
				
		%>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>비밀번호</td>
				<td>이름</td>
				<td>성별</td>
				<td>나이</td>
				<td>이메일</td>
				<td>회원가입일</td>			
			</tr>
		 <%
			// 5. 데이터 처리
			// 화면에 출력 (table)	
			while(rs.next()){
				// 관리자 정보 제외
				if(rs.getString("id").equals("admin")){
					System.out.println("관리자!!!");
					continue;
				}
				
		 %>	
			<tr>
				<td><%=rs.getString("id") %></td>
				<td><%=rs.getString("pw") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("gender") %></td>
				<td><%=rs.getInt("age") %></td>
				<td><%=rs.getString("email") %></td>
				<td><%=rs.getTimestamp("regdate") %></td>			
			</tr>
		 <% } %>		
			
		</table>		
		
		
		<h2><a href="main.jsp">메인페이지로</a></h2>
		
		
		
		
		
		
		
		
		
</body>
</html>