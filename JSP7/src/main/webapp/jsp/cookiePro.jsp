<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>cookiePro.jsp</h1>
		
		<%
		   
			// 쿠키를 통해서 언어설정 (파라메터 사용)
// 			String lang = request.getParameter("language");
// 			Cookie cookie = new Cookie("lang",lang);
			Cookie cookie = new Cookie("lang",request.getParameter("language"));
			
			// 쿠키 사용 설정(유효기간 설정-s)
			cookie.setMaxAge(60*60); // 1시간
			
			// 쿠키정보를 클라이언트로 전달
			response.addCookie(cookie);
			System.out.println(" 쿠키생성! ");
			//response.sendRedirect("cookieForm.jsp");
		%>
		<script type="text/javascript">
			alert(" 언어정보 쿠키 설정 완료! ");
			location.href="cookieForm.jsp";		
		</script>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>