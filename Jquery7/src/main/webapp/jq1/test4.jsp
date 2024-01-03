<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 라이브러리 추가(CDN : Content Delivery Network) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//$('img').css('width','100');
		// => CSS 속성을 변경/제어
		
		// 요소의 속성을 변경/제어
		
		// 속성의 정보 확인 - 해당 요소중 첫번째요소의 속성값 조회
		var tmp = $('img').attr('src');
		alert(tmp);
		
		// 속성값 변경
		$('img').attr('src','2.jpg');
		
		// border 속성 변경 5,10,15
		//$('img').attr('border','5');
		$('img').attr('border',function(idx){
			//alert(idx);
			return (idx+1)*5;
		});
		
		// 가로길이 100,border - 2 4 6크기로 설정
		$('img').attr({
			
			width : 100,
			border : function(idx){
				return (idx+1)*2;
			}
			
		});
		
		
		
	});
</script>
</head>
<body>
	<h1>test4.jsp</h1>
	
	<img src="1.jpg" width="50">
	<img src="2.jpg" width="100">
	<img src="3.jpg" width="150">
	
	

</body>
</html>
