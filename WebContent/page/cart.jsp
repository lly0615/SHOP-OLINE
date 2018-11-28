<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//if(session.getAttribute("username")==null){
		//out.print("<script>alert('请先登录！'); document.location.href='../page/login.jsp';</script>");
	//}
%>
<jsp:include page="head.jsp"></jsp:include>
<jsp:useBean id="Cart" scope="page" class="base.SelectCart"/>
<jsp:setProperty name="Cart" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>购物车</title>
</head>
<body>
<div class="main_bg">
<div class="wrap">	
	<div class="main">
	<!-- start content -->
	<div class="single">
			<!-- start span1_of_1 -->
				
			<div class="left_content">
			<div class="span1_of_1">
			</div>
			<!-- start span1_of_1 -->
			   	<div class="clear"></div>
			   	<!-- start tabs -->
				   	<section class="tabs">
				   	
				   	
		            <input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked">
			        <label for="tab-1" class="tab-label-1">购物车</label>
			
		            <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2">
			        <label for="tab-2" class="tab-label-2">已支付</label>
			
		            <input id="tab-3" type="radio" name="radio-set" class="tab-selector-3">
			        <label for="tab-3" class="tab-label-3">已完成</label>
			       
	          
				    <div class="clear-shadow"></div>
					
			        <div class="content">
				        <div class="content-1">
				        <%
				        	JSONArray jsArray=Cart.getCart(session.getAttribute("username").toString());
				        %>
				        	<table class="catTable" style="width: 100%;margin-top: 6px">
				        		<tr class="carttr"><td>商品名称</td><td>数量</td><td>价格</td><td>操作</td></tr>
				        		<%
				        		for(int i=0;i<jsArray.length();i++){
				        			JSONObject jsObject=jsArray.getJSONObject(i);
				        			%>
				        			<tr class="carttr"><td><%=jsObject.getString("name") %></td><td><%=jsObject.getString("count") %></td><td><%=Cart.cacuPrice(jsObject.getString("sku_no"),jsObject.getInt("count")) %></td><td><button>结算</button></td></tr>
				        			<%
				        		}
				        		%>
				        		
				        	</table>
						</div>
				        <div class="content-2">
							<%
				        	JSONArray jsArray1=Cart.getPaid(session.getAttribute("username").toString());
				        %>
				        	<table class="catTable" style="width: 100%;margin-top: 6px">
				        		<tr class="carttr"><td>商品名称</td><td>数量</td><td>价格</td><td>操作</td></tr>
				        		<%
				        		for(int i=0;i<jsArray1.length();i++){
				        			JSONObject jsObject=jsArray1.getJSONObject(i);
				        			%>
				        			<tr class="carttr"><td><%=jsObject.getString("name") %></td><td><%=jsObject.getString("count") %></td><td><%=Cart.cacuPrice(jsObject.getString("sku_no"),jsObject.getInt("count")) %></td><td><button>确认收货</button></td></tr>
				        			<%
				        		}
				        		%>
				        		
				        	</table>
						</div>
				        <div class="content-3">
				        	<img alt="" src="images/xuzhi.jpg">
						</div>
						
						
			        </div>
			        </section>
		         	<!-- end tabs -->
			   	</div>
			   	<!-- start sidebar -->
			 <div class="left_sidebar">
					<div class="sellers">
						<h4><%=session.getAttribute("username") %></h4>
						<div class="single-nav">
			                <ul>
			                   <li><a href="#">收货地址管理</a></li>
			                    <li><a href="#">全部订单</a></li>
			                    <li><a href="#">我的收藏</a></li>
			                    <li><a href="#">评价管理</a></li>
			                    <li><a href="#">联系客服</a></li>			                    
			                </ul>
			              </div>
						  <div class="banner-wrap bottom_banner color_link">
								<a href="#" class="main_link">
								<figure><img src="images/delivery.png" alt=""></figure>
								<h5><span>免费送货</span><br> 超过￥99</h5><p>可以提供送货上门服务。</p></a>
						 </div>
						 <div class="brands">
							 <h1>Brands</h1>
					  		 <div class="field">
				                 <select class="select1">
				                   <option>Please Select</option>
										<option>Lorem ipsum dolor sit amet</option>
										<option>Lorem ipsum dolor sit amet</option>
										<option>Lorem ipsum dolor sit amet</option>
				                  </select>
				            </div>
			    		</div>
					</div>
				</div>
					<!-- end sidebar -->
          	    <div class="clear"></div>
	       </div>	
	<!-- end content -->
	</div>
</div>
</div>
<jsp:include page="footer_bg.jsp"></jsp:include>	
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>