<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>



<!DOCTYPE html> 
<html> 
<head> 

<meta charset="UTF-8"> 
<title></title> 
<style>
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
	//alert("호출");
		var cnt=0;
		for(var i=0; i<f.skill.length; i++){
		if(f.skill[i].checked==true){
		cnt++;
		}
		}
		if(cnt==0){
		alert("보유기술을 체크하세요")
		f.skill[0].focus();
		return;
		}
		if(f.hobby.selectedIndex==0){
			alert("취미를 선택하세요");
			f.hobby.focus();
			return;
		}
		if(f.phone.value==""){
			alert("전화번호를 입력하세요");
			f.phone.focus();
			return;
		}
		f.submit();
	}

</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
</head> 
<body> 
<div class="container">
<h2>수정</h2> 
<form name ='frm' action='./update' method='post'>
<input type="hidden" name="no" value="${dto.no}"> 
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">
<table>
	<tr>
	<th>이름</th>
	<td>${dto.name}</td>
	</tr>
	<tr>
	<th>성별</th>
	<td>
	${dto.gender }
	</td>
 	</tr>
 	<tr>
 	<th>보유기술</th>
 	<td>
 	<label><input type="checkbox" name="skill" value="java"
 	<c:if test="${fn:indexOf(dto.skills,'java')!= -1}">checked</c:if>
 	>java</label>
 	<label><input type="checkbox" name="skill" value="JSP"
 	<c:if test="${fn:indexOf(dto.skills,'JSP')!= -1}">checked</c:if>
 	>JSP</label>
 	<label><input type="checkbox" name="skill" value="MVC"
 	<c:if test="${fn:indexOf(dto.skills,'MVC')!= -1}">checked</c:if>
 	>MVC</label>
 	<label><input type="checkbox" name="skill" value="Spring"
 	<c:if test="${fn:indexOf(dto.skills,'Spring')!= -1}">checked</c:if>
 	>Spring</label>
 	<label><input type="checkbox" name="skill" value="Ajax"
 	<c:if test="${fn:indexOf(dto.skills,'Ajax')!= -1}">checked</c:if>
 	>Ajax</label>
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
		<script type="text/javascript">
		document.frm.hobby.value='${dto.hobby }';
		
		</script>
		</td>
		
	</tr>
	<tr>
	<th>전화번호</th>
	<td><input type="text" name="phone" value="${dto.phone}"></td>
	</tr>
	<tr>
	<th>우편번호</th>
	<td><input type="text" name="zipcode" size="7" maxlength="5" value="${dto.zipcode}">
	
	<button type="button" onclick="sample6_execDaumPostcod()">우편번호 검색</button>
	</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
		<input type="text" name="address" size="45" value="${dto.address}">
		<input type="text" name="address2" size="45"value="${dto.address2}">
		</td>
	</tr>
</table>
<div> 
	<button type="button" onclick="incheck(this.form)">수정</button>
	<button type="reset">입력취소</button>
</div>
</form>
</div>
</body> 
</html> 