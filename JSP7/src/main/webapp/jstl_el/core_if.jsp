<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>core_if.jsp</h1>
	
	<c:set var="name" value="ITWILL"/>
	
<%-- 	<c:if test="조건문"> --%>
<!-- 		조건문이 참일때 실행하는 문장 -->
<%-- 	</c:if> --%>
	<c:if test="${name=='ITWILL'}">
		아이티윌! <hr>
	</c:if>
	
	<fieldset>
	   <!-- action 속성이 없는 경우 자신페이지 호출,get방식(기본값) -->
		<form>
			숫자1 : <input type="text" name="num1"> <br>
			숫자2 : <input type="text" name="num2"> <br>
			<input type="submit" value="계산하기">
		</form>	
	</fieldset>
	
	<hr>
	<h2> 숫자1, 숫자2 중에서 더 큰값을 출력하기! </h2>
	<%-- <% request.getParameter("num1"); %> --%>
	숫자1 : ${param.num1 } <br>
	숫자2 : ${param.num2 } <br>
	
	<c:if test="${param.num1 > param.num2}">
		<h3>결과 : ${param.num1 } </h3>		
	</c:if>
	<c:if test="${param.num1 < param.num2}">
		<h3>결과 : ${param.num2 } </h3>		
	</c:if>
	
	<h2> 파라메터 정수로 변경후 결과 </h2>
	<c:if test="${ (param.num1 != null) && (param.num2 != null) }">
		<c:set var="num1"  value="${Integer.parseInt(param.num1) }"/>
		<c:set var="num2"  value="${Integer.parseInt(param.num2) }"/>
	</c:if>
	
	<c:if test="${num1 gt num2}">
		<h3>결과 : ${num1 } </h3>		
	</c:if>
	<c:if test="${num1 lt num2}">
		<h3>결과 : ${num2 } </h3>		
	</c:if>
	
	<h2> 두 속성의 값이 동일한지 체크 </h2>
	<c:if test="${param.num1 eq param.num2 }">
	    <h3> num1,num2값은 동일합니다! </h3>
	</c:if>
	
	<h2> 조건비교 구문(switch-case와 유사함) </h2>
	
<%-- 	<c:choose> --%>
<%-- 		<c:when test="조건1"></c:when> --%>
<%-- 		<c:when test="조건2"></c:when> --%>
<%-- 		<c:when test="조건3"></c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			그외 나머지(else) -->
<%-- 		</c:otherwise>	 --%>
<%-- 	</c:choose> --%>

	<!-- num1,num2 값을 비교해서 값이 같은가? 더 큰수를 찾기 -->
	<c:choose>
		<c:when test="${param.num1 > param.num2 }">
		    ${param.num1 } <hr>		
		</c:when>
		<c:when test="${param.num1 < param.num2 }">
		    ${param.num2 } <hr>		
		</c:when>
		<c:otherwise>
		   <c:if test="${ !empty param.num1 }">
				동일한 값!!!<hr>
		   </c:if>
		</c:otherwise>	
	</c:choose>


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>