<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>



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
div#title{
 	width:30%;
	margin: 20px auto;
	margin-top: 20 px;
	border : 1px solid black;
}
div{
	text-align:center;
	margin-top:10px;
}

</style> 
<script type="text/javascript">
function tlist(){
	
	var url = "list";
	url = url +"?col=${param.col}";
	url = url +"&word=${param.word}";
	url = url +"&nowPage=${param.nowPage}";
		
		location.href=url;
		
	
}
</script>
</head> 
<body> 
<div class="container">
<h2>처리결과</h2>
<c:choose>
	<c:when test="${dflag }">답변글이 있으므로 삭제할 수 없습니다.</c:when>
	<c:when test="${flag }">삭제를 하였습니다.</c:when>
	<c:otherwise>삭제가 실패했습니다.</c:otherwise>
</c:choose>


<br><br>
<button onclick="tlist()">목록</button>

</div>

</body> 
</html> 