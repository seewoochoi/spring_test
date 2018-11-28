<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: ; 
  font-size: 24px; 
} 
</style> 
<script type="text/javascript">
	function mread(){
		var url ="read.do";
		url=url+"?id=${param.id}";
		location.href=url;
	} 
</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
 <div class="container">
<h2>수정 결과</h2>
<c:choose>
	<c:when test="${flag }">수정을 성공했습니다.<br>
	<input type='button' value='정보확인' onclick="mread()">
    <input type='button' value='홈' onclick="history.back()"></c:when>
	<c:otherwise>수정에 실패했습니다.<br>
	<input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='홈' onclick="location.href='../index.do' "></c:otherwise>
</c:choose>
 

<!-- *********************************************** -->
</div>
</body>
<!-- *********************************************** -->
 
</html> 