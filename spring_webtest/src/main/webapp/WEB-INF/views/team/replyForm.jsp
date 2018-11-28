<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	font-size: 20px;
}
div{
	text-align: center;
	margin-top:  20px;
}
table{
	width :50%;
	margin: 5px auto;
}
th,td{
 	padding: 5px;
}
table,th,td{
	border:1px solid black;
	border-collapse:collapse;
}
</style>
<script type="text/javascript">
function incheck(f){
	if(f.name.value==""){
	alert("이름을 입력하세요");
	f.name.focus();
	return false;
	}
	if(f.gender[0].checked==false && f.gender[1].checked==false){
	alert("성별을 체크하세요");
	f.gender[0].focus();
	return false;
	}
	var cnt=0;
	for(var i=0; i<f.skill.length; i++){
	if(f.skill[i].checked==true){
	cnt++;
	}
	}
	if(cnt==0){
	alert("보유기술을 체크하세요")
	f.skill[0].focus();
	return false;
	}
	
}

</script>
</head>
<body>

<div class="container">
<h2>답변등록</h2>
<form name ='frm' action='./reply' method='post'
	onsubmit="return incheck(this)">
	<input type="hidden" name="grpno" value="${dto.grpno }">
	<input type="hidden" name="indent" value="${dto.indent }">
	<input type="hidden" name="ansnum" value="${dto.ansnum }">
	<input type="hidden" name="no" value="${dto.no }">
<table>
	<tr>
	<th>이름</th>
	<td><input type="text" name="name" size="25" value="${dto.name}"></td>
	</tr>
	<tr>
	<th>성별</th>
	<td>
	<input type="radio" name="gender" value="여자">여자
	<input type="radio" name="gender" value="남자">남자
	</td>
 	</tr>
 	<tr>
 	<th>보유기술</th>
 	<td>
 	<input type="checkbox" name="skill" value="java">java
 	<input type="checkbox" name="skill" value="JSP">JSP
 	<input type="checkbox" name="skill" value="MVC">MVC
 	<input type="checkbox" name="skill" value="Spring">Spring
 	<input type="checkbox" name="skill" value="Ajax">Ajax
 	</td>
 	</tr>
	<tr>
		<th>취미</th>
		<td>
		<select name="hobby">
		<option>취미를 선택하세요</option>
			<option value="영화보기">영화보기</option>
			<option value="게임">게임</option>
			<option value="기술서적읽기">기술서적읽기</option>
			<option value="보드">보드</option>
			<option value="운동">운동</option>
		</select>
	</tr>
	<tr>
	<th>전화번호</th>
	<td><input type="text" name="phone"></td>
	</tr>
	<tr>
	<th>우편번호</th>
	<td><input type="text" name="zipcode" size="7" maxlength="5">
	<button>우편번호 검색</button>
	</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
		<input type="text" name="address" size="45">
		<input type="text" name="address2" size="45">
		</td>
	</tr>
</table>
<div>
	<button>등록</button>
	<button type="reset">입력취소</button>
</div>
</form>
</div>
</body>
</html>