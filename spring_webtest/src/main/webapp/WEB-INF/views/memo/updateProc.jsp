<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>  
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
div{
 text-align:center;
 margin-top:100px;
 }
</style> 
</head> 
<body> 
<div>
<c:choose>
	<c:when test="${flag}">메모를 수정했습니다.</c:when>
	<c:otherwise>메모수정이 실패했습니다.</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${flag }"><input type="button" value="목록" 
onclick="location.href='./list.do?col='${param.col}'
&word='${param.word}'
&nowPage='${param.nowPage}'"></c:when>
</c:choose>
 
<br>  

</div> 
</body>  
</html> 
