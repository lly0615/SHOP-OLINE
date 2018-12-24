<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Shops" scope="page" class="base.Shops"/>
<jsp:setProperty name="Shops" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SHOP ONLINE</title>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>

<!-- start slider -->
			<div id="da-slider" class="da-slider">
				<div class="da-slide">
					<h2>大屏幕上见。</h2>
					<p>如果你已加入 iPhone 年年焕新计划，请先查询你的升级换购资格，然后预约前往 Apple Store 零售店换购新 iPhone。</p>
					<a href="#" class="da-link">购买</a>
					<div class="da-img"><img src="images/iphone-xs-select-2018-3.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2>身薄力不薄。</h2>
					<p>在新款 MacBook 上，我们新配备了第七代 Intel Core m3、i5 和 i7 处理器，使处理性能提升最高可达 20%1，此外还采用了速度提升最高可达 50% 的固态硬盘存储。</p>
					<a href="#" class="da-link">购买</a>
					<div class="da-img"><img src="images/macpro.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2>全方面强大。</h2>
					<p>全新，全面屏，全方位强大。一切彻底重新设计，并融入我们的各种先进科技。这将启发你重新思考 iPad 能做到什么。</p>
					<a href="#" class="da-link">购买</a>
					<div class="da-img"><img src="images/ipad.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2>运动更多，伙伴更多。</h2>
					<p>Apple Watch Nike+ 搭配 Nike Run Club app 一起使用时，它就是你跑步的好搭档。</p>
					<a href="#" class="da-link">购买</a>
					<div class="da-img"><img src="images/watch.png" alt="image01" /></div>
				</div>
				<nav class="da-arrows">
					<span class="da-arrows-prev"></span>
					<span class="da-arrows-next"></span>
				</nav>
			</div>
        </div>
<!----start-cursual---->
<div class="wrap">
<!----start-img-cursual---->
	<div id="owl-demo" class="owl-carousel">
		<%
			JSONArray jsonArray=Shops.selectIndexShops();
		for(int i=0;i<jsonArray.length();i++){
			JSONObject jsonObject=jsonArray.getJSONObject(i);
			%>
		<div class="item" onClick="location.href='details.jsp?skuno=<%=jsonObject.getString("spu_no") %>';">
			<div class="cau_left">
				<img class="lazyOwl" data-src="images/<%=jsonObject.getString("main_img") %>" alt="Lazy Owl Image">
			</div>
			<div class="cau_left">
				<h4><a href="details.jsp?skuno=<%=jsonObject.getString("spu_no") %>"><%=jsonObject.getString("name") %></a></h4>
				<a href="details.jsp?skuno=<%=jsonObject.getString("spu_no") %>" class="btn">购买</a>
			</div>
		</div>	
			<%
		}
		%>
		
	<!----//End-img-cursual---->
</div>
<!-- start main1 -->
<div class="main_bg1">
<div class="wrap">	
	<div class="main1">
		<h2>热卖商品</h2>
	</div>
</div>
</div>
<!-- start main -->
<div class="main_bg">
<div class="wrap">	
	<div class="main">
		<!-- start grids_of_3 -->
		<div class="grids_of_3">
			<div class="grids_of_3">
			<%
				JSONArray jsonArray2=Shops.selectShops(1);
				for(int i=0;i<jsonArray2.length();i++){
					JSONObject jsonObject=jsonArray2.getJSONObject(i);%>
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
<jsp:include page="footer_bg.jsp"></jsp:include>	
<!-- start footer -->
<div class="footer_bg1">
<div class="wrap">
	<div class="footer">
		<!-- scroll_top_btn -->
	    <script type="text/javascript">
			$(document).ready(function() {
			
				var defaults = {
		  			containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear' 
		 		};
				
				
				$().UItoTop({ easingType: 'easeOutQuart' });
				
			});
		</script>
		 <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
		<!--end scroll_top_btn -->
		<div class="copy">
			<p class="link">Copyright &copy; 2014.Company name All rights reserved.</p>
		</div>
		<div class="clear"></div>
	</div>
</div>
</div>

</body>
</html>