<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 라이브러리 추가 -->
<!-- <script src="../js/jquery-3.7.1.min.js"></script> -->
<!-- 제이쿼리 라이브러리 추가(CDN : Content Delivery Network) -->
<!-- <script src="https://code.jquery.com/jquery-3.7.1.js"  -->
<!--  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="  -->
<!--  crossorigin="anonymous"></script> -->
 
<!-- 제이쿼리 라이브러리 추가(CDN : Content Delivery Network) -->
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<script type="text/javascript">
	// 자바스크립트 코드 작성
	
	// 제이쿼리 사용 준비 완료!
	$(document).ready(function(){
		alert(" JQUERY1 실행! ");
	});
	
	$(function(){
		alert(" JQUERY2 실행! ");
	});
	// $ 마크가 Jquery를 의미함
	jQuery(document).ready(function(){
		alert(" JQUERY3 실행! ");
	});
	
	jQuery(function(){
		alert(" JQUERY4 실행! ");
	});
 

</script>

</head>
<body>
	<h1>test1.jsp</h1>
	
	
	
</body>
</html>