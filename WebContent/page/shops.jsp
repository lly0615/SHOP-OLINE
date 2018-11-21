<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<jsp:useBean id="Shops" scope="page" class="base.Shops"/>
<jsp:setProperty name="Shops" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SHOP ONLINE</title>
</head>
<body>
<!-- start main -->
<div class="main_bg">
<div class="wrap">	
	<div class="main">
	<%
		int brandId=Integer.parseInt(request.getParameter("brand_id"));
		switch(brandId){
			case 1:
				%>
				<h2 class="style top">macbook</h2>
				<%
				break;
			case 2:
				%>
				<h2 class="style top">ipad</h2>
				<%
				break;
			case 3:
				%>
				<h2 class="style top">iphone</h2>
				<%
				break;
			case 4:
				%>
				<h2 class="style top">watch</h2>
				<%
				break;
		}
	%>
		<!-- start grids_of_3 -->
		<div class="grids_of_3">
			<%
				JSONArray jsonArray=Shops.selectShops(brandId);
				for(int i=0;i<jsonArray.length();i++){
					JSONObject jsonObject=jsonArray.getJSONObject(i);%>
			<div class="grid1_of_3">
				<a href="details.jsp?skuno=<%=jsonObject.getString("spu_no") %>">
					<img src="images/<%=jsonObject.getString("main_img") %>" alt=""/>
					<h3><%=jsonObject.getString("name") %></h3>
					<div class="price">
						<h4>￥<%=jsonObject.getString("price") %><span>详情</span></h4>
					</div>
					<span class="b_btm"></span>
				</a>
			</div>
					<%if(i!=0&&(i+1)%3==0){%>
						<div class="clear"></div></div>
						<div class="grids_of_3">
						<%
					}
				}
			%>
		</div>
		<div class="grids_of_3">
			<div class="clear"></div>
		</div>	
		<!-- end grids_of_3 -->
	</div>
</div>
</div>	
<!-- start footer -->
<jsp:include page="footer_bg.jsp"></jsp:include>	
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>