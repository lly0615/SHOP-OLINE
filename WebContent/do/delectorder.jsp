<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Cart" scope="page" class="base.SelectCart"></jsp:useBean>
<jsp:setProperty name="Cart" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String orderid="";
	if(request.getParameter("orderid")!=null){
		orderid=request.getParameter("orderid");
		String backMsg=Cart.delectOrder(orderid);
		if("success".equals(backMsg)){
			out.print("<script>alert('删除成功！'); document.location.href='../page/cart.jsp?backmsg=success';</script>");
		}else{
			out.print("<script>alert('删除失败！'); document.location.href='../page/cart.jsp';</script>");
		}
	}

%>
</body>
</html>