<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  기본생성자만 usebean쓸수 있다. uplaodsave는 메소드,매개변수가 있기때문에 사용불가능 -->
 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function blist(){
	var url = "list";
	url = url + "?col=${col}";
	url = url + "&word=${word}";
	url = url + "&nowPage=${nowPage}";
	
	location.href=url;
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<div class="container">
 
<h2>처리결과</h2>
 
<c:choose>
	<c:when test="${flag }">글을 변경했습니다.</c:when>
	<c:when test="${pflag}">잘못된 패스워드입니다.</c:when>
	<c:otherwise>글변경을 실패했습니다.</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${flag }"><input type='button' value='목록' onclick="blist()"></c:when>
	<c:otherwise><input type='button' value='다시시도' onclick="history.back()"></c:otherwise>
</c:choose>

 
</div>
</body>
<!-- *********************************************** -->
</html> 