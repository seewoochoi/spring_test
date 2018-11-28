<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%--  <% --%>
 
<!-- //   List<BbsDTO>list = (List)request.getAttribute("list"); -->
<!-- //   String paging = (String)request.getAttribute("paging"); -->
<!-- //   int nowPage = (Integer)request.getAttribute("nowPage"); -->
<!-- //   String col = (String)request.getAttribute("col"); -->
<!-- //   String word = (String)request.getAttribute("word"); -->
   
<%--  %> --%>
 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function read(bbsno){
	var url = "read";
	url = url+ "?bbsno="+bbsno;  //?는 데이터라는것을 알려주기 위한것 이동경로 지정후 ?하는이유
	url = url+ "&col=${col}";
	url = url+ "&word=${word}"; 
	url = url+ "&nowPage=${nowPage}";
	
	location.href=url; 
	
}
function fileDown(filename){
	var url = "${root}/download";
	url = url + "?filename="+filename;
	url = url + "&dir=/bbs/storage";
	 
	location.href= url;
}
</script>
<style type="text/css"> 
/* *{  */
/*   font-family: gulim;   */
/*   font-size: 20px;  */
/* }  */

</style> 
</head> 
<!-- *********************************************** -->
<body>

 


 <div class="search"> 
 <form method="post" action="list">
 <select name="col">
 <option value="wname" 
<c:if test="${col=='wname'}">selected</c:if>
 >성명</option>
 
 <option value="title"
<c:if test="${col=='title'}">selected</c:if>
 >제목</option>
 
 <option value="content" 
<c:if test="${col=='cotent'}">selected</c:if>
 >내용</option>
 
 <option value="total">전체출력</option>
 </select> 
 <input type="text" name="word" value="${word}">
 <button>검색</button> 
 <button type="button" onclick="location.href='create'">등록</button>
 </form>
 
 </div>
 <div class="container">
 <h2><span class="glyphicon glyphicon-th-list"></span>
 목록 
 </h2>
  <TABLE class="table table-hover">
  <thead>
    <TR>
      <TH>번호</TH>
      <TH>제목</TH>
      <TH>성명</TH>
      <TH>조회수</TH>
      <TH>등록일</TH>
      <TH>파일명</TH>
      
     </TR>
     </thead>
     <c:choose>
     <c:when test="${empty list}">
	<tbody><tr><td colspan="6">등록된 글이 없습니다.</td></tr></tbody>   
  


	</c:when>
  <c:otherwise> 
  <c:forEach var="dto" items="${list}">
	<tbody>
     <tr>
     	<td>${dto.bbsno}</td>
     	<td>
     	<c:forEach begin="1" end="${dto.indent}">&nbsp;&nbsp;</c:forEach>
     	<c:if test="${dto.indent>0 }"><img style='width:20px; height:10px;' src='${root }/images/re.jpg'></c:if>
     	
     	<c:set var="rcount" value="${util:rcount(dto.bbsno,rdao) }"/>
     	<a href="javascript:read('${dto.bbsno}')">${dto.title}</a>
     	<c:if test="${rcount>0 }">
            <span style="color:red;">(${rcount})</span>
          </c:if>
     	<c:if test="${util:newImg(dto.wdate)}">
     	<img style='width:20px; height:10px;' src='${root }/images/new.gif'></c:if>
     	</td>
     	<td>${dto.wname}</td>
     	<td>${dto.viewcnt}</td>
     	<td>${dto.wdate}</td>
     	<td>
     	<c:choose>
     	<c:when test="${not empty dto.filename}">
     	<a href="javascript:fileDown('${dto.filename}')">
   			 ${dto.filename}
    	</a> 
    	</c:when>
    	<c:otherwise>파일없음</c:otherwise>
     	</c:choose>
 	</td>
   </tr> 
   </tbody>
 </c:forEach>
 </c:otherwise>
 </c:choose>
  </TABLE>
     	
     
     	 
     	

  
  <DIV class='bottom'>
 	${paging}
 
	</div>
        
  </DIV>

 
 
 
</body>
<!-- *********************************************** -->
</html> 