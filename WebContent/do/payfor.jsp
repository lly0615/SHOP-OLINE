<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Cart" scope="page" class="base.SelectCart"/>
<jsp:setProperty name="Cart" property="*"/>
<jsp:useBean id="Test" scope="page" class="db.Login"/>
<jsp:setProperty name="Test" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付</title>
</head>
<body>
<%
	String userid="";
	String password="";
	String orderid="";
	if(request.getParameter("username")!=null|request.getParameter("password")!=null|request.getParameter("orderid")!=null){
		userid=request.getParameter("username");
		password=request.getParameter("password");
		orderid=request.getParameter("orderid");
		String backmessage=Test.login();
		if("success".equals(backmessage)){
			String backMsg=Cart.payFor(orderid);
			System.out.print(backMsg);
			if("success".equals(backMsg)){
				out.print("<script>alert('支付成功！'); document.location.href='../page/cart.jsp?backmsg=success';</script>");
			}else{
				out.print("<script>alert('支付失败！'); document.location.href='../page/cart.jsp';</script>");
			}
		}else{
			out.print("<script>alert('密码错误！'); document.location.href='../page/login.jsp';</script>");
		}
	}
%>
</body>
</html>