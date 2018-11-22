<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Register" scope="page" class="db.Login"/>
<jsp:setProperty name="Register" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<%
	if(Register.getPassword().equals(Register.getPrepassword())){
		if(Register.reister().equals("success")){
			out.print("<script>alert('注册成功，现在登录！'); document.location.href='../page/login.jsp';</script>");
		}else{
			out.print("<script>alert('注册失败！'); document.location.href='../page/register.jsp';</script>");
		}
	}else{
		out.print("<script>alert('两次密码不一致！'); document.location.href='../page/register.jsp';</script>");
		return;
	}

%>
<body>

</body>
</html>