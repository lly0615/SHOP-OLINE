<%@page import="back.Getorder"%>
<%@page import="base.SelectCart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="AddCart" scope="page" class="base.AddCart"/>
<jsp:setProperty name="AddCart" property="*"/>
<jsp:useBean id="SelectOrder" scope="page" class="base.GetOrder"/>
<jsp:setProperty name="SelectOrder" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付</title>
</head>
<body>
<%
	if(AddCart.getName()!=null){
		String backMsg=AddCart.addCart();
		if("success".equals(backMsg)){
			String orderid=SelectOrder.getOrder();
			response.sendRedirect("../page/payfor.jsp?orderid="+orderid);
			//out.print("<script>alert('加入成功！'); document.location.href='../page/details.jsp?skuno="+AddCart.getSkuno()+"';</script>");
		}else{
			out.print("<script>alert('加入失败！'); document.location.href='../page/details.jsp?skuno="+AddCart.getSkuno()+"';</script>");
		}
	}
%>
</body>
</html>