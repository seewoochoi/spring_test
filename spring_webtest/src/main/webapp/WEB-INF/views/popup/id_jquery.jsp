<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<%

	String id = request.getParameter("id");
	MemberDAO dao = new MemberDAO();
	boolean flag = dao.duplicateID(id);

  	if(flag){
  		out.print(" 중복된 아이디 입니다.");
  	} else {
  		out.print(" 사용이 가능합니다.");
  		//out.print("</p> ");
  		//out.print(" <input type='button'value='사용' onclick='use()'> ");
  	}
%>