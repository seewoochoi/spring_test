<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>img</title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
.container {
  margin-left: auto;
  margin-right: auto;
}
.img-table {
  width: 50%;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 20px;
}
.big-image {
	width: 200px;
	height: 200px;
}
ul {
  list-style: none;
}
li {
  float: left;
  margin-left: 10px;
  margin-right: 10px;
}
li img {
  width: 120px;
  height: 120px;
}
.bottom input {
  margin-left: auto;
  margin-right: auto;
}
</style> 
</head> 
<!-- *********************************************** -->
<body>

 
<div class="container">
  <h2 class="title">title</h2>
  <table class="img-table">
    <tr>
      <td rowspan="3"><img class="big-image img-rounded" src="./storage/${dto.fname}"></td>
      <th>title</th>
      <td>${dto.title}</td>
    </tr>
    <tr>
      <th>name</th>
      <td>${dto.name}</td>
    </tr>
    <tr>
      <th>mdate</th>
      <td>${dto.mdate}</td>
    </tr>
  </table>
  <div class="button">
    <input type='button' value='수정' onclick='iupdate()'>
    <input type='button' value='삭제' onclick='idel()'>
  </div>
  <ul>
  <c:choose>
  	<c:forEach begin="1" end="maxcount" ></c:forEach>
   <c:if test="${imgno<0}"> <li class="thumbnail"><img src="./storage/member.jpg"></li></c:if>
   <c:if test="${imgno==no}"><li class="thumbnail"><img src="./storage/${imgFname[cnt]}"></li></c:if>
  <c:otherwise> <li class="thumbnail"><a href="javascript:iread('${imgNo[cnt]}')"><img src="./storage/${imgFname[cnt]}"></a></li></c:otherwise>
  </c:choose>
 
  </ul>

</div>
<script>
function iupdate(){
	var url = "update";
	url = url +"?no=${dto.no}";
	location.href = url;
} 
function idel(){
	var url = "delete";
	url = url + "?no=${dto.no}";
	location.href = url;
}
function iread(no){
	var url = "read2";
	url = url + "?no=" + no;
	location.href = url;
}
</script>
 

</body>
<!-- *********************************************** -->
</html> 