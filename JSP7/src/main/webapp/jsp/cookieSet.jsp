<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<h1>cookieSet.jsp</h1>
	
	<h2> 서버 (카페) </h2>
	<%
		System.out.println(" 클라이언트 요청처리 중... ");
	    
		// 쿠키 생성(서블릿 API)
		Cookie cookie = new Cookie("name","ITWILL");
		
		// 쿠키 설정(유효기간 (단위:초))
		cookie.setMaxAge(10 * 60); 
		
		// 쿠키정보 전달
		response.addCookie(cookie);
	
	%>	
	
	<script type="text/javascript">
		alert(" 요청처리완료! 쿠키생성 완료! ");
	    location.href="cookieTest.jsp";
	</script>

</body>
</html>