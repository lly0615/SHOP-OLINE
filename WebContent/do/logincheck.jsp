<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Test" scope="page" class="db.Login"/>
<jsp:setProperty name="Test" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录检验</title>
</head>
<body>
<%=Test.getUsername() %>
<%
	String backmessage=Test.login();
	if("success".equals(backmessage)){
		session.setAttribute("username", Test.getUsername());
		response.sendRedirect("../page/index.jsp");
	}else{
		out.print("<script>alert('密码错误！'); document.location.href='../page/login.jsp';</script>");
	}
%>
</body>
</html>