<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付中</title>
<style type="text/css">
	.progressbar{
				margin: 0 auto;
				position: absolute;
				top: 50%;
				left: 50%;
				align-items:center;
				/*向上 （X轴） 向左(Y轴)*/
				transform: translate(-50%,-50%);
				-moz-transform: translate(-50%,-50%);
				-webkit-transform: translate(-50%,-50%);
			}
			
	.progressbar h5{
			position: absolute;
    		width: 150px;
    		top: 120%;
    		left:50%;
    		transform: translate(-50%,-50%);

			}
			
	.progressbar2{
				margin: 0 auto;
				position: absolute;
				top: 50%;
				left: 50%;
				align-items:center;
				/*向上 （X轴） 向左(Y轴)*/
				transform: translate(-50%,-50%);
				-moz-transform: translate(-50%,-50%);
				-webkit-transform: translate(-50%,-50%);
			}
			
	.progressbar2 img{
				width: 80px;
				height: 80px;
	}
			
	.progressbar2 h5{
			position: absolute;
    		width: 210px;
    		top: 120%;
    		left:50%;
    		transform: translate(-50%,-50%);

			}
			
			
			
</style>
</head>
<body>
<%
	String orderid="";
	String price="";
	if(request.getParameter("orderid")!=null){
		orderid=request.getParameter("orderid");
		price=request.getParameter("name");
		System.out.print(orderid);
	}
	

%>
	<div class="progressbar" id="progressbar" >
		<img src="images/5-121204194114.gif"/>
		<h5>正在检验支付环境......</h5>
	</div>
	
	<div class="progressbar2" id="progressbar2" >
		<img src="images/20151215110432202.gif"/>
		<h5>支付环境安全，请放心支付。</h5>
	</div>
<div class="main_bg">
<div class="wrap">	
	<div class="main">
	<!-- start service -->
	  <div class="service">
		<div class="ser-main">
			<h4 class="para">订单编号：<%=orderid %></h4>
			<h4 class="para">金额：<%="￥"+price %></h4>
			<h4>扫描二维码支付</h4>
			<div class="ser-grid">
				<div class="ser-grid-list">
					<a href="details.html"><img src="images/IMG_9639.JPG" alt=""></a>
					<h5><a href="details.html">推荐使用支付宝</a></h5>
					<p class="para"></p>
				</div>
				<div class="ser-grid-list">
					<a href="details.html"><img src="images/IMG_9638.JPG" alt=""></a>
					<h5><a href="details.html">推荐使用微信支付</a></h5>
					<p class="para"></p>
				</div>
				<div class="clear"></div>
			</div>
			<p></p>
			<h4>输入登录密码支付</h4>
			<div class="ser-grid">
				<form action="../do/payfor.jsp" method="post">
				<input type="text" name="username" value="<%=session.getAttribute("username")%>" style="display: none;">
				<input type="text" name="orderid" value="<%=orderid%>" style="display: none;">
				请输入密码：<input required="required" type="password" name="password" >
				<input type="submit" value="确认付款">
				</form>
			</div>
		</div>
		
				<div class="clear"></div>
			</div>
	</div>
</div>
</div>

</body>
<script type="text/javascript">
		var progress1=document.getElementById("progressbar");
		var progress2=document.getElementById("progressbar2");
		progress2.style.display="none";
		function show(){
			progress1.style.visibility="hidden"
			progress2.style.display="block";
			var timer2=window.setTimeout(block,1000);
		}
		
		function block() {
			progress2.style.visibility="hidden";
		}
		var timer=window.setTimeout(show,3000);
</script>
</html>

<jsp:include page="footer.jsp"></jsp:include>