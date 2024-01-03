<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>logout.jsp</h1>
	 <%
	    // 로그아웃 -> 로그인 세션정보 삭제(초기화)
	    session.invalidate();
	    System.out.println(" 세션 초기화완료! 로그아웃 성공! ");
	 %>
	 
	 <script type="text/javascript">
	 	alert(" 회원님의 정보가 안전하게 로그아웃 되었습니다! ");
	 	location.href="main.jsp";	 
	 </script>
	 
	 
	
	
	
</body>
</html>