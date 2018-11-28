<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function mread(){
	var url = "read.do";
	url += "?no=${no}";
	location.href=url;
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<%-- <link href="{root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<!-- </head>  -->
<!-- *********************************************** -->
<body>
<div class="container">
<h2>정보수정</h2>
 
<DIV class="title">정보수정</DIV>
 
	<c:choose>
		<c:when test="${flag2}">정보가 수정되었습니다.</c:when>
		<c:otherwise>정보수정이 실패했습니다.</c:otherwise>
	</c:choose>
 
  
 
  <DIV class='bottom'>
    <input type='button' value='정보확인' onclick="mread()">
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>
</div>
 
 

</body>
<!-- *********************************************** -->
</html> 