<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String passwd = (String)request.getAttribute("passwd");
	
	if(passwd!=null){
		out.println("비밀번호는"+passwd+"입니다");
	}else{
		out.println("잘못된 정보를 입력하셧습니다");
	}
%>