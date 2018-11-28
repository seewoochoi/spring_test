<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath}">
</c:set> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style type="text/css">
img{
	max-width:1000%;
	max-height:1000%;
	width:100%;
	
}
</style>
</head>
<body>

<!-- 상단 메뉴 -->
<div style="background-color: #EEEEEE;">
<table>
  <tr>
    <td>
      <img src="${root }/images/main2.jpg" width="50%">
    </td>
  </tr> 
  
  <tr> 
    <td> 
   <ul class="nav nav-pills">
  <li class="nav-item">
    <a class="nav-link active" href="${root}/">홈</a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/list.do">게시판</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="${root}/bbs/create">게시판 글쓰기</a>
      <a class="dropdown-item" href="${root}/bbs/list">목록</a>
      
      
       <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="${root}/memo/list">메모</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="${root}/memo/create">게시판 글쓰기</a>
      <a class="dropdown-item" href="${root}/memo/list">목록</a>
      
      
       <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="${root}/Img/list">이미지게시판</a>
    <div class="dropdown-menu"> 
      <a class="dropdown-item" href="${root}/Img/create">이미지 올리기</a>
      <a class="dropdown-item" href="${root}/Img/list">목록</a>
       </div>
</li> 
</div>
</li>
</div>
</li>
       <c:choose>
       	<c:when test="${empty id}">
      <li><a href="${root}/member/agree"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${root}/member/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       	</c:when>
       	<c:otherwise>
       		<c:if test="${grade!='A'}">
      <li><a href="${root}/member/read"><span class="glyphicon glyphicon-user"></span> MyInfo</a></li>
   	  <li><a href="${root}/member/delete"><span class="glyphicon glyphicon-user"></span> Del</a></li>
       		</c:if>
      <li><a href="${root}/member/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
       	</c:otherwise>
       </c:choose>
       
       
      
       


      <c:if test="${not empty id && grade=='A'}">
 <li><a href="${root}/member/read"><span class="class="nav-link""></span> MyInfo</a></li>
 
     <li id="admin"><a class="nav-link" href="${root}/admin/list">회원목록</a></li>
     <li id="admin"><a class="nav-link" href="${root}/team/list">회원목록</a></li>
     <li id="admin"><a class="nav-link" href="${root}/team/create">회원등록</a></li>
   </c:if>
    </ul> 
    
    </td>  
  </tr> 
 
</table>
</div>
<!-- 상단 메뉴 끝 -->

 
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">

</body>
</html>