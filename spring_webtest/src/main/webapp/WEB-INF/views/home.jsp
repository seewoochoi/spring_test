<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<c:set var="title" value="나의 여행블로그"/>
<c:if test="${not empty sessionScope.id && sessionScope.grade =='A'}">
    <c:set var="title" value="관리자 페이지"/>
</c:if>
   
 <c:choose>
   		<c:when test="${empty sessionScope.id}">
   			<c:set var="str" value="메인페이지 입니다."/>
   		</c:when>
   		<c:otherwise> 
   			<c:set var="str" value="확인 하는 안녕하세요 ${sessionScope.id} 님"/>
   		</c:otherwise>
</c:choose>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Spring 4.3.14.기반의 MVC Webtest 실습
</h1>

<P>  The time on the server is ${serverTime}. </P>

<div class="container">
<h2>${title}</h2>
 
 <h1>${str}</h1>
 <img src="${pageContext.request.contextPath }/images/main.jpg" width="50%"><br><br>
 
 
 <c:choose>
 	<c:when test="${empty sessionScope.id }">
    <button onclick="location.href='member/login'">로그인</button>
   </c:when>
 	<c:otherwise>
   <button onclick="location.href='member/logout'">로그아웃</button>
 	</c:otherwise>
 	
 </c:choose>

</div>
</body>
</html>
