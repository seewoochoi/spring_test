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
text-align:center;
margin-top:20px;
margin-bottom:20px;
}
table{
width:50%;
margin: 0 auto
}
table,th,td{
border:1px solid black;
border-collapse:collapse;
}
</style> 
<script type="text/javascript">
//f는 this를 그러니까 form을 나타내는 것이다.
function incheck(f){
	if(f.title.value==""){
	alert("제목을 입력하세요");
	f.title.focus();
	return false; //return false;하면 submit이 안된다.
	}
	if(f.content.value==""){
	alert("내용을 입력하세요");
	f.content.focus();
	return false; //return false;하면 submit이 안된다.
	}
	
}
</script>
</head> 
<body> 
<div class="container">
<H2>답변등록</H2> 
<form name="frm" method="POST" action="./reply"
onsubmit="return incheck(this)">
<input type="hidden" name="memono" value ="${dto.memono }">
<input type="hidden" name="grpno" value ="${dto.grpno }">
<input type="hidden" name="indent" value ="${dto.indent }">
<input type="hidden" name="ansnum" value ="${dto.ansnum }">


<input type="hidden" name="col" value ="${param.col}">
<input type="hidden" name="word" value ="${param.word}">
<input type="hidden" name="nowPage" value ="${param.nowPage}">



<table>
<tr>
<th>제목</th>
<td>
<input type="text" name="title" size="30" value="${dto.title}"/>
</td>
</tr>
<tr>
<th>내용</th>
<td>
<textarea rows="10" cols="30" name="content"></textarea> 
</td>
</tr>
</table>
<div id="h">
<input type="submit" value="전송">
<input type="button" value="취소" onclick="history.back()">
</div>
</form>
</div>


</body> 
</html> 