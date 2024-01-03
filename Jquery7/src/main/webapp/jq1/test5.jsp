<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 라이브러리 추가(CDN : Content Delivery Network) -->
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		// 요소의 값을 변경 - html() / text()
		
		//  html() 해당요소 중 첫번째 요소의 값을 가져오기
		var tmpHtml = $('h2').html();
		
		alert(tmpHtml);
		
		// text() 모든 해당요소의 값을 가져오기
		var tmpText = $('h2').text();
		
		alert(tmpText);
		
		// 해당 모든 대상의 값을 변경
		// => 값이 태그형태라면 태그를 적용후 출력
// 		$('h2').html(" 아이티윌 ");
		$('div').html(" <h3> 아이티윌 </h3>");
		
		
		// 해당 모든 대상의 값을 변경
		// => 값이 태그형태라면 문자 그대로 출력
// 		$('h2').text(" ITWILL ");
// 		$('div').text(" <h3> 아이티윌 </h3>");

		$('h2').html(function(idx,oldHTML){
			//alert(idx+"/"+oldHTML);
			// 인덱스 값에 따른 * 출력
			var tmpStar = "";
			for(var i=0;i<idx;i++){
				tmpStar += " * ";
			}
			
			return oldHTML + tmpStar;
		});
		
		
		// div 출력되는 '아이티윌' - 서울지점,부산지점,전국통합지점
		var addrArray = ['서울지점','부산지점','전국통합지점'];
		$('div').html(function(idx,oldHTML){
			 //return oldHTML + "- " + addrArray[idx];
			 return "<h3> 아이티윌 - "+addrArray[idx]+"</h3> ";
		});
		
		
	});
</script>

</head>
<body>
	<h1>test5.jsp</h1>
	
	<h2> head-0 </h2>
	<h2> head-1 </h2>
	<h2> head-2 </h2>
	
	<hr>
	<div> div-0 </div>
	<div> div-1 </div>
	<div> div-2 </div>
	
	
	
	
	
	
	
	
	
</body>
</html>