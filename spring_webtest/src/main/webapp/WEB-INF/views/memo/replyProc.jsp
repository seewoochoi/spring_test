<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>    
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script>
function mlist(){
	var url = "list.do";
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
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body> 

 <div class="container">
<h2>처리결과</h2>
 
	<c:choose>
		<c:when test="${flag}">답변이 등록되었습니다.</c:when>
		<c:otherwise>답변등록이 실패했습니다.</c:otherwise>
	</c:choose>
		
 

  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="mlist()">
    <input type='button' value='등록' onclick="location.href='reply.do'">
  </DIV>
</div>
 
  

</body>
<!-- *********************************************** -->
</html> 