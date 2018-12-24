<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<style type="text/css">			
			body{
				font-family: "微软雅黑";
				margin-top: 150px;
				background: url(img/5ba1c2dcb4003.jpg) no-repeat;
				background-size: cover; 
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
<body>
<div id="login_content">
<div id="one">
			
			<h1>管理员登录</h1>
			
			<hr>
			
			<form id="fompost" action="../do/adminloginCheck.jsp" method="post">
			
				<input required="required" id="emailaccount" name="username" type="text" placeholder="ID*" />

			
				<input required="required" id="password" name="password" type="password" placeholder="密码*" />
				
				
				<input id="subbtn" type="submit" value="登录"/>
			</form>
			
		</div>
		</div>
</body>
</html>