<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function blist(){
	var url = "list";
	
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
	<c:when test="${flag}">글이 등록이 되었습니다.</c:when>
	<c:otherwise>글 등록이 실패했습니다.</c:otherwise>
</c:choose>

<br><br>
</div> 
  <DIV class='bottom'>
    <input type='button' value='계속등록' onclick="location.href='create'">  
    <input type='button' value='목록' onclick="location.href='list'">  
  </DIV> 

 
 

</body>
<!-- *********************************************** -->
</html> 