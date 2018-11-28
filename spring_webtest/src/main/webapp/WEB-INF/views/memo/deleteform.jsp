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
  font-size: 24px; 
} 
div{
text-align: center;
margin-top:20px;
margin-bottom:20px;
}
</style>  
</head> 
<body>
<div>삭제 확인</div>

<c:if test="${flag }">삭제 할 수없습니다.</c:if><c:if test="${flag==false }">
<form method="post" action="./delete">

<input type="hidden" name="memono" value="${param.memono}"> 
<input type="hidden" name="col" value="${param.col}"> 
<input type="hidden" name="word" value="${param.word}"> 
<input type="hidden" name="nowPage" value="${param.nowPage}"> 
 
 
<div>
삭제를 하면 복구 될 수 없습니다.<br><br>
삭제하시려면 삭제버튼을 클릭하세요<br><br>
취소는 '목록'버튼을 누르세요 
<br><br>
<input type="submit" value="삭제처리"> 
<input type="button" value="목록" onclick="location.href='./list.do?col=<%=request.getParameter("col")%>&word=<%=request.getParameter("word")%>&nowPage<%=request.getParameter("nowPage")%>'">
</div>
 
</form> 
</c:if>

</body> 
</html> 