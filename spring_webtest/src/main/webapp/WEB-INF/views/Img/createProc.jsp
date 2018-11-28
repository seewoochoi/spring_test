<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
  
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
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

 
<DIV class="title"> 등록</DIV>
 
<div class="content">
<c:choose>
	<c:when test="flag">등록 성공.</c:when>
	<c:otherwise>등록 실패.</c:otherwise>
</c:choose>

</div>
  <DIV class='bottom'> 
    <input type='button' value='계속등록' onclick="location.href='./create.do'">
    <input type='button' value='목록' onclick="location.href='./list.do'">
  </DIV>

 

</body>
<!-- *********************************************** -->
</html> 