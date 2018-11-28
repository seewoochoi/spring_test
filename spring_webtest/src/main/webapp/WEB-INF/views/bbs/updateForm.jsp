<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style> 
<script type="text/javascript">
function incheck(f){
	if(f.wname.value==""){
		alert("이름을 입력하세요");
		return;
	}
	
		if(f.title.value==""){
			alert("제목을 입력하세요");
			return;
			
		}
		
			if(f.content.value==""){
				alert("내용을 입력하세요");
				return;	
			}
			
		
			if(f.passwd.value==""){
			alert("비밀번호를 입력하세요");
			return;
			}
			f.submit();
		
}
</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>
 <div class="container">
 <H2>수정</H2>

 
<FORM name='frm' method='POST' action='./update'
	enctype="multipart/form-data">
	<input type='hidden' name="bbsno" value="${dto.bbsno}">
	<input type='hidden' name="col" value="${param.col}"> 
	<input type='hidden' name="word" value="${param.word}">
	<input type='hidden' name="nowPage" value="${param.nowPage}">
	<input type='hidden' name="oldfile" value="${dto.filename}">
	
  <TABLE class="table table-bordered"> 
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="wname" value="${dto.wname}"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="${dto.title}"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="10" cols="45" name="content">${dto.content}</textarea></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="filenameMF"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='수정' onclick="incheck(this.form)">
    <input type='button' value='취소' onclick="history.back()">
  </DIV> 
</FORM>
</div>
 
 
</body>
<!-- *********************************************** -->
</html> 