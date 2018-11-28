<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}

/* div { */
/* 	text-align: center; */
/* 	margin-top: 20px; */
/* 	margin-bottem: 20px; */
/* } */

/* table { */
/* 	width: 60%; */
/* 	margin: 0 auto; */
/* } */

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

/* th, td { */
/* 	padding: 10px; */
/* } */
</style>
<script type="text/javascript">
	
	function mcreate() {
		var url = "create";
		location.href = url;
	}
	function mupdate(memono) {
		var url = "update";
		url = url + "?memono=" + memono;
		url = url +"&col=${param.col}";
		url = url +"&word=${param.word}";
		url = url +"&nowPage=${param.nowPage}";
		location.href = url;
	}
	function mdelete(memono) {
		var url = "delete";
		url = url + "?memono=" +memono;
		url = url +"&col=${param.col}";
		url = url +"&word=${param.word}";
		url = url +"&nowPage=${param.nowPage}";
		
		location.href = url;
	}
	function mlist() {
		var url = "list";  
		url = url +"?col=${param.col}";
		url = url +"&word=${param.word}";
		url = url +"&nowPage=${param.nowPage}";
		
		location.href = url;
	} 
	function mreply() { 
		var url = "reply"; 
		url = url + "?memono=${dto.memono}";
		 
		url = url +"&col=${param.col}";
		url = url +"&word=${param.word}";
		url = url +"&nowPage=${param.nowPage}";
		location.href = url;
		
	}
</script>
</head>
<body> 

	<h2>조회</h2>
	<table>
		<tr> 
			<th>제목</th>
			<td>${dto.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${dto.content }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${dto.viewcnt}</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${dto.wdate}</td>
		</tr>
	</table>
	<div> 
		<input type="button" value="등록" onclick="mcreate()"> 
		<input type="button" value="수정" onclick="mupdate('${dto.memono}')">
		<input type="button" value="삭제" onclick="mdelete('${dto.memono}')"> 
		<input type="button" value="목록" onclick="mlist()">
		<button onclick="mreply()">답변</button>
	</div>

</body>
</html>
