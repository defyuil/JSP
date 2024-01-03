<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <h1>cookieForm.jsp</h1>
	 <!-- 설정된 언어값을 사용하여 메세지 출력
	     한국어(kor) - " 안녕하세요! 쿠키 테스트 입니다!"
	     영어(eng) - " Hello~! Cookie Test!! "	 
	  -->
	  <%
	     String lang = "kor";
	  	 // 쿠키값을 모두 가져오기(배열)
	  	 Cookie[] cookies = request.getCookies();
	  	 // 배열에 들어있는 요소중에서 언어설정 값을 찾기
	  	 if(cookies != null){
	  		 for(int i=0;i<cookies.length;i++){
	  			 if(cookies[i].getName().equals("lang")){
	  				 // 해당요소가 있을때 (언어설정값)
	  				lang = cookies[i].getValue();	  				 
	  			 }	  			 
	  		 }
	  	 }
	  	 // 값이 존재할때 메세지 출력	  
	  
	  %>	  
	 <h2> 쿠키값 : <%=lang %> </h2>
	 <%
	   if(lang.equals("kor")){
		   %>
		     <h2> 안녕하세요! 쿠키 테스트 입니다! </h2>
		   <%
	   }else{
		   %>
		     <h2> Hello~! Cookie Test!! </h2>
		   <%
	   }
	 %>
	 
	 <!-- action속성값이 없을경우 자신의 페이지 호출 -->
	 <form action="cookiePro.jsp" method="get">
	   <input type="radio" name="language" value="kor" 
	   <%if(lang.equals("kor")){ %>
	   		checked
	   <%} %>
	    >한국어
	   <input type="radio" name="language" value="eng" 
	    <%if(lang.equals("eng")){ %>
	   		checked
	    <%} %>
	   >영어
	   <input type="submit" value="언어 설정">	 
	 </form>
	 
	 
	 
	 
	 
</body>
</html>