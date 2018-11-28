<%@ page contentType="text/html; charset=UTF-8"%>

<%@include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}
 
div {
	text-align: center;
	margin-top: 100px;
}
</style>
<script type="text/javascript">
function ilist() {
	var url = "list.do";

	location.href = url;
}
</script>
</head>
<body>
	<div>
	<c:choose>
		<c:when test="${flag}">삭제했습니다</c:when>
		<c:otherwise>삭제를 실패했습니다.</c:otherwise>
	</c:choose>
		
		<br> <input type="button" value="목록" onclick="ilist()">
	</div>
</body>
</html>