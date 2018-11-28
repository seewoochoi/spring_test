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
  font-family: ; 
  font-size: 24px; 
} 
.serch{
	width:80%; 
	text-align:center;
	margin:20px auto;
}
</style> 
<script type="text/javascript">
	function read(no){
		var url="read";
		url=url+"?no="+no; 
		url=url+"&col=${col}";
		url=url+"&word=${word}";
		url=url+"&nowPage=${nowPage}";

		
		location.href=url;
	}

</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

 
 <div class="serch">
 <FORM name='frm' method='POST' action='./list'>

 <select name="col">
<option value="name"
<c:if test="${col=='name'}">selected</c:if>
>이름</option>
<option value="title"
<c:if test="${col=='title'}">selected</c:if>
>제목</option>
<option value ="total">전체검색</option>
  </select>
 <input type="text" name="word" value="${word}">
 <input type="submit" value="검색">
 <input type="button" value ="등록" onclick="location.href='create'">
</form>
 </div>
 <div class="container">
 <h2><span class="glyphicon glyphicon-th-list"></span>
 목록</h2>
  <TABLE class="table table-hover">
  <c:choose>
  	<c:when test="${empty list}">
  	 <tr><td colspan="3">등록된글이없습니다</td></tr>
  
  
  	</c:when>
  <c:otherwise>
  <c:forEach var="dto" items="${list}">
 
 	<tr>

 		<td rowspan="3"	 width="30%">
 		<c:forEach begin="1" end="${dto.indent}">&nbsp;&nbsp;</c:forEach>
 		<c:if test="${dto.indent>0}"><img src='../images/re.jpg'></c:if>
		<a href="javascript:read('${dto.no}')">
		<img src="./storage/${dto.fname}" width="200px" height="130px"></a>
  
  
  	<th>이름</th>
  	<td>${dto.name}</td>
 
  	
  	</tr>
  	
  
  	<tr>
  	<th>제목</th>
  	<td>${dto.title}</td>
  	</tr>
  	<tr>
  	<th>등록일</th>
  	<td>${dto.mdate}</td>
  	</tr>
  	
  	
  </c:forEach>
  </c:otherwise>
  </c:choose>
   

  
  	 
  	 
  
  </TABLE>
   
  <DIV class='bottom'>
  ${paging} 
  </DIV>
</div>

</body>
<!-- *********************************************** -->
 
</html> 