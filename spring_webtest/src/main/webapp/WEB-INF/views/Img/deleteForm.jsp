<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
	function incheck(f){
		if(f.passwd.value==""){
			alert("비번을 입력하세요");
			f.passwd.focus();
			return false;
			
		}
	} 
</script>




 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<!-- </head>  -->
<!-- *********************************************** -->
<body>

<div class="container">
 <h2>삭제</h2>

<FORM name='frm' method='POST' action='./delete'>
<input type="hidden" name="no"  value="${param.no}">

<input type="hidden" name="col"  value="${param.col}">
<input type="hidden" name="word"  value="${param.word}">
<input type="hidden" name="nowPage"  value="${param.nowPage}">
<table> 
   <TR>
      <TH>패스워드</TH>
      <TD><input type="password" name="passwd" size="15"></TD>
      <td>정말 삭제하시겠습니까?</td>
    </TR>
    
     </table>
 
  

  
    <input type='submit' value='삭제' >
    <input type='button' value='취소' onclick="history.back()">
  
</FORM>
  </DIV>
 
 

</body>
<!-- *********************************************** -->
</html> 