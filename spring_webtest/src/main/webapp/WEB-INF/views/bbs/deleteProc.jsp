<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript"> 
function blist(){
	var url="list.do";
	url = url + "?col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href=url;
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<div class="container">
 
<h2>처리결과</h2>
	<c:if test="${pflag==false}">패스워드가 일치하지 않습니다.</c:if>
<c:choose>
	<c:when test="${flag }">글을 삭제했습니다.</c:when>
	<c:otherwise>글삭제를 실패했습니다.</c:otherwise>
</c:choose>
<c:choose>
 	<c:when test="pflag">   
<c:if test="${pflag==false||flag==false}"></c:if>
 	<input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='목록' onclick="blist()"></c:when>	
	<c:otherwise><input type='button' value='목록' onclick="blist()"></c:otherwise>

</c:choose>

  </DIV>
  
</body>
<!-- *********************************************** -->
</html> 