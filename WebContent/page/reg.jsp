<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册ID</title>
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
<body>
<div id="login_content">
<div id="one">
			
			<h1>注册 ID</h1>
			
			<hr>
			
			<form id="fompost" action="../UploadImg" method="post" enctype="multipart/form-data">
			
				<input required="required" id="emailaccount" name="username" type="text" placeholder="ID*" />

			
				<input required="required" id="password" name="password" type="password" placeholder="密码*" />
				
				<input required="required" id="prepassword" name="phone" type="text" placeholder="手机号*" />
				
				<input required="required" id="prepassword" name="email" type="text" placeholder="邮箱*" />
				
				<input required="required" id="prepassword" name="place" type="text" placeholder="地址*" />
				
				<input required="required" id="prepassword" name="birthday" type="text" placeholder="生日*" />
				
				</br>性别：<select name="sex">
  							<option value="男">男</option>
  							<option value="女">女</option>
						</select>
						
				<input required="required" id="prepassword" name="hobbies" type="text" placeholder="爱好*" />
				
				
				</br>选择头像：<input id="file" name="file" type="file">
				<input id="subbtn" type="submit" value="确认注册"/>
				<a href="#">ID 现在登录></a>
			</form>
			
		</div>
		</div>
</body>
</html>
