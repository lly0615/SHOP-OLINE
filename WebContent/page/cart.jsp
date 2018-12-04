<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username="";
	if(session.getAttribute("username")==null||session.getAttribute("username").equals("")){
		out.print("<script>alert('请先登录！'); document.location.href='../page/login.jsp';</script>");
	}else{
		username=session.getAttribute("username").toString();
	}
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
				        	JSONArray jsArray=Cart.getCart(username);
				        %>
				        	<table class="catTable" style="width: 100%;margin-top: 6px">
				        		<tr class="carttr"><td>商品名称</td><td>数量</td><td>价格</td><td>操作</td></tr>
				        		<%
				        		for(int i=0;i<jsArray.length();i++){
				        			JSONObject jsObject=jsArray.getJSONObject(i);
				        			int price=Cart.cacuPrice(jsObject.getString("sku_no"),jsObject.getInt("count"));
				        			%>
				        			<tr class="carttr"><td><%=jsObject.getString("name") %></td><td><%=jsObject.getString("count") %></td><td><%="￥"+price %></td><td><button onclick="javascript:post('payfor.jsp',{orderid:'<%=jsObject.getString("orderid") %>',name:'<%=price %>'})">结算</button></td></tr>
				        			<%
				        		}
				        		%>
				        		
				        	</table>
						</div>
				        <div class="content-2">
							<%
				        	JSONArray jsArray1=Cart.getPaid(username);
				        %>
				        	<table class="catTable" style="width: 100%;margin-top: 6px">
				        		<tr class="carttr"><td>商品名称</td><td>数量</td><td>价格</td><td>操作</td></tr>
				        		<%
				        		for(int i=0;i<jsArray1.length();i++){
				        			JSONObject jsObject=jsArray1.getJSONObject(i);
				        			%>
				        			<tr class="carttr"><td><%=jsObject.getString("name") %></td><td><%=jsObject.getString("count") %></td><td><%=Cart.cacuPrice(jsObject.getString("sku_no"),jsObject.getInt("count")) %></td><td><button onclick="javascript:post('../do/compld.jsp',{orderid:'<%=jsObject.getString("orderid") %>'})">确认收货</button></td></tr>
				        			<%
				        		}
				        		%>
				        		
				        	</table>
						</div>
				        <div class="content-3">
				        	<%
				        	JSONArray jsArray2=Cart.getCompld(username);
				        	%>
				        	<table class="catTable" style="width: 100%;margin-top: 6px">
				        		<tr class="carttr"><td>商品名称</td><td>数量</td><td>价格</td><td>操作</td></tr>
				        		<%
				        		for(int i=0;i<jsArray2.length();i++){
				        			JSONObject jsObject=jsArray2.getJSONObject(i);
				        			%>
				        			<tr class="carttr"><td><%=jsObject.getString("name") %></td><td><%=jsObject.getString("count") %></td><td><%=Cart.cacuPrice(jsObject.getString("sku_no"),jsObject.getInt("count")) %></td><td><button onclick="javascript:post('../do/delectorder.jsp',{orderid:'<%=jsObject.getString("orderid") %>'})">删除订单</button></td></tr>
				        			<%
				        		}
				        		%>
				        		
				        	</table>
						</div>
						
						
			        </div>
			        </section>
		         	<!-- end tabs -->
			   	</div>
			   	<!-- start sidebar -->
			 <div class="left_sidebar">
					<div class="sellers">
						<h4><%=username %></h4>
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
							 <h1>街道</h1>
					  		 <div class="field">
				                 <select class="select1">
				                   <option>请选择</option>
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

<%
	if(request.getParameter("backmsg")!=null||!request.equals("")){%>
		<script type="text/javascript">
			var tab=document.getElementById("tab-2");
		    tab.prop("checked",true);
		</script>
		<%
	}
%>

<script type="text/javascript">
    function post(url, params) {
    console.log(params)
    var temp = document.createElement("form"); //创建form表单
    temp.action = url;
    temp.method = "post";
    temp.style.display = "none";//表单样式为隐藏
    for (var item in params) {//初始化表单内部的控件
       //根据实际情况创建不同的标签元素
        var opt =document.createElement("input");  //添加input标签
        opt.type="text";   //类型为text
        opt.id = item;      //设置id属性
        opt.name = item;    //设置name属性
        opt.value = params[item];   //设置value属性
        temp.appendChild(opt);
    }
    
    document.body.appendChild(temp);
    temp.submit();
    return temp;
}
</script>
</html>
<jsp:include page="footer.jsp"></jsp:include>


