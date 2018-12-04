<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Cart" scope="page" class="base.SelectCart"></jsp:useBean>
<jsp:setProperty name="Cart" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String orderid="";
	if(request.getParameter("orderid")!=null){
		orderid=request.getParameter("orderid");
		String backMsg=Cart.comPld(orderid);
		System.out.print(backMsg);
		if("success".equals(backMsg)){
			out.print("<script>alert('收货成功！'); document.location.href='../page/cart.jsp?backmsg=success';</script>");
		}else{
			out.print("<script>alert('支付失败！'); document.location.href='../page/cart.jsp';</script>");
		}
	}

%>

</head>
<body>

</body>
</html>