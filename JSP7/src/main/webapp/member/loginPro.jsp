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
	<h1>loginPro.jsp</h1>
	
	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		// 전달정보 (파라메터) 저장
		// => 액션태그 사용
	%>
		<!-- 자바빈 객체 생성 -->
		<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
		<!-- 전달정보 저장 -->
		<jsp:setProperty property="*" name="mb"/>
		
	<%
		System.out.println(mb.toString());
	
	    //DB에 가서 회원정보가 있는지 없는지 체크(로그인)
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
	    // 3. SQL 구문(select) & pstmt 객체
	    String sql = "select pw from itwill_member where id=?";
	    PreparedStatement pstmt = con.prepareStatement(sql);
	    // ???
	    pstmt.setString(1, mb.getId());		
	    // 4. SQL 실행
	    ResultSet rs = pstmt.executeQuery();
	    // 5. 데이터 처리	    
	    if(rs.next()){
	    	// 아이디 O - '회원'
	    	if(mb.getPw().equals(rs.getString("pw"))){
			    // 		비밀번호 O - ' 본인 - 로그인 성공'
			    System.out.println(" 로그인 성공! ");
			    // 로그인 아이디를 세션영역에 저장
			    session.setAttribute("id", mb.getId());
			    // 메인페이지로 이동
			    response.sendRedirect("main.jsp");			    
	    	}else{
			    // 		비밀번호 X - ' 회원 - 비밀번호 오류'
			    System.out.println(" 로그인 실패!-비밀번호 오류 ");
			    %>
			    	<script type="text/javascript">
			    		alert('로그인 실패!-비밀번호 오류!! ');
			    		history.back();
			    	</script>
			    <%
	    	}
	    }else{
	    	 // 아이디 X - '비회원'
		    System.out.println(" 로그인 실패!-비회원 ");
		    %>
		    	<script type="text/javascript">
		    		//alert(' 로그인 실패!-비회원!! ');
		    		var joinResult 
		    		  = confirm(' 로그인 실패!-비회원입니다. 회원가입 하시겠습니까? ');
		    		
		    		if(joinResult){
						location.href='insertForm.jsp';		    			
		    		}else{
			    		history.back();		    			
		    		}
		    	</script>
	    	<%
	    }
		    
		   
	    
	    
	
	
	%>	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>