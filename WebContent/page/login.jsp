<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<style type="text/css">			
			
			#login_content{
				padding-top:60px;
				padding-bottom:200px;	
				background:#f2f2f2;
				width: 100%;
				height: 100%;
			}
			#one{
				margin-top:120px;
				padding-top: 20px;
				padding-right: 80px;
				padding-left: 80px;
				border-radius: 10px;
				background-color: rgba(255,255,255);
				margin: 0 auto;
				width: 300px;
				height: 480px;
			}
			
			
			#two{
				text-align: center;
				margin: 0 auto;
				width: 100px;
				height: 100px;	
			}
			
			
			#head{
				width: 100px;
				height: 100px;
				margin: 0 auto;
			}
			
			#emailaccount,#name,#password,#prepassword{
				border-radius: 6px;
				width: 100%;
				height: 24px;
				margin-top: 20px;
			}
			
			#subbtn{
				margin-bottom:20px;
				border-radius: 6px;
				margin-top: 20px;
				background: #2494DE;
				color: white;
				width: 100%;
				height: 34px;
			}
			
			
		</style>
</head>
<jsp:include page="head.jsp"></jsp:include>
<body>
<div id="login_content">
<div id="one">
			
			<h1>登录到SHOP</h1>
			
			<hr>
			
			<form id="fompost" action="../do/logincheck.jsp" method="post">
			
				<input required="required" id="emailaccount" name="username" type="text" placeholder="Shop ID*" />

			
				<input required="required" id="password" name="password" type="password" placeholder="密码*" />
				
				
				<input id="subbtn" type="submit" value="登录"/>
				<a href="register.jsp">没有Shop ID？现在注册></a>
			</form>
			
		</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>